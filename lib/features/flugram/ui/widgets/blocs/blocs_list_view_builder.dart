import 'package:flugram/blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/flugram/logic/blocs_bloc.dart';
import 'package:flugram/features/home/models/bloc_model.dart';
import 'package:flugram/features/update_bloc/ui/page/update_bloc_page.dart';
import 'package:flutter/material.dart';

class BlocsListViewBuilder extends StatelessWidget {
  const BlocsListViewBuilder({
    super.key,
    required this.flugramId,
    required this.parentPageIds,
  });

  final String flugramId;
  final List<String> parentPageIds;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocsBloc, BloweBlocState>(
      builder: (context, state) {
        if (state is BloweCompleted<List<BlocModel>>) {
          return ListView.builder(
            itemCount: state.data.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final bloc = state.data[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.storage, size: 16),
                        const SizedBox(width: 8),
                        Text(bloc.name),
                      ],
                    ),
                    IconButton(
                      onPressed: () => UpdateBlocPage.go(
                        context,
                        flugramId,
                        bloc.id,
                        parentPageIds,
                      ),
                      icon: const Icon(Icons.edit),
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
