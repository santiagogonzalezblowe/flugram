import 'package:flugram/blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/flugram/ui/page/flugram_page.dart';
import 'package:flugram/features/home/logic/flugrams_bloc.dart';
import 'package:flugram/features/home/models/flugram_model.dart';
import 'package:flutter/material.dart';

class FlugramsListView extends StatelessWidget {
  const FlugramsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlugramsBloc, BloweBlocState>(
      builder: (context, state) {
        if (state is BloweInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is BloweError) {
          return Center(
            child: Text(state.error.toString()),
          );
        }

        if (state is BloweCompleted<List<FlugramModel>>) {
          if (state.data.isEmpty) {
            return const Center(
              child: Text('No flugrams found'),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 32,
            ),
            itemCount: state.data.length,
            itemBuilder: (context, index) {
              final flugram = state.data[index];
              return Card(
                clipBehavior: Clip.antiAlias,
                child: ListTile(
                  title: Text(flugram.name),
                  subtitle: Text(flugram.description),
                  onTap: () => FlugramPage.go(context, flugram.id),
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
