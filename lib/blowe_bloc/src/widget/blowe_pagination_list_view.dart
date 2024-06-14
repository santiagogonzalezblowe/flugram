import 'package:flugram/blowe_bloc/blowe_bloc.dart';
import 'package:flugram/blowe_bloc/src/logic/blowe_pagination_bloc.dart';
import 'package:flutter/material.dart';

typedef BlowePaginationListViewItemBuilder<T> = Widget Function(
  BuildContext context,
  T item,
);

class BlowePaginationListView<B extends BlowePaginationBloc, T>
    extends StatelessWidget {
  const BlowePaginationListView({
    super.key,
    required this.itemBuilder,
    this.padding,
  });

  final BlowePaginationListViewItemBuilder<T> itemBuilder;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<B, BloweBlocState>(
      builder: (context, state) {
        if (state is BloweInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is BloweError) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(state.error.toString()),
              ElevatedButton(
                onPressed: () {
                  context.read<B>().add(const BloweFetch(BloweNoParams()));
                },
                child: const Text('Retry'),
              ),
            ],
          );
        }

        if (state is BloweCompleted<BlowePaginationModel<T>>) {
          return _BlowePaginationListViewLoaded<B, T>(
            data: state.data,
            isLoadingMore: state.isLoadingMore,
            itemBuilder: itemBuilder,
            padding: padding,
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}

class _BlowePaginationListViewLoaded<B extends BlowePaginationBloc, T>
    extends StatefulWidget {
  const _BlowePaginationListViewLoaded({
    super.key,
    required this.data,
    required this.isLoadingMore,
    required this.itemBuilder,
    this.padding,
  });

  final BlowePaginationModel<T> data;
  final bool isLoadingMore;
  final BlowePaginationListViewItemBuilder<T> itemBuilder;
  final EdgeInsetsGeometry? padding;

  @override
  State<_BlowePaginationListViewLoaded<B, T>> createState() =>
      __BlowePaginationListViewStateLoaded<B, T>();
}

class __BlowePaginationListViewStateLoaded<B extends BlowePaginationBloc, T>
    extends State<_BlowePaginationListViewLoaded<B, T>> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(
        () {
          if (widget.isLoadingMore ||
              widget.data.totalCount == widget.data.items.length) {
            return;
          }

          if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent * 0.8) {
            context.read<B>().add(
                  const BloweFetchMore(BloweNoParams()),
                );
          }
        },
      );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<B>().add(const BloweFetch(BloweNoParams()));
      },
      child: ListView.builder(
        padding: widget.padding,
        controller: _scrollController,
        itemCount: widget.data.items.length,
        itemBuilder: (context, index) {
          final items = widget.data.items;
          final item = items[index];

          if (index == items.length - 1) {
            return Column(
              children: [
                widget.itemBuilder(context, item),
                if (widget.isLoadingMore)
                  const LinearProgressIndicator(minHeight: 2),
              ],
            );
          }

          return widget.itemBuilder(context, item);
        },
      ),
    );
  }
}
