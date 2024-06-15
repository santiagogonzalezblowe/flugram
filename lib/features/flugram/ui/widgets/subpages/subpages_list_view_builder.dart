import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/flugram/logic/subpages_bloc.dart';
import 'package:flugram/features/home/models/page_model.dart';
import 'package:flutter/material.dart';

class SubpagesListViewBuilder extends StatelessWidget {
  const SubpagesListViewBuilder({
    super.key,
    required this.onGoPressed,
  });

  final Function(PageModel subpage) onGoPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubpagesBloc, BloweState>(
      builder: (context, state) {
        if (state is BloweCompleted<List<PageModel>>) {
          return ListView.builder(
            itemCount: state.data.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final subpage = state.data[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.pages, size: 16),
                        const SizedBox(width: 8),
                        Text(subpage.name),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () => onGoPressed(subpage),
                      child: const Text('Go'),
                    ),
                  ],
                ),
              );
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
