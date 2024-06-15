import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/home/logic/flugrams_bloc.dart';
import 'package:flugram/features/home/models/flugram_model.dart';
import 'package:flugram/features/home/ui/widgets/flugrams_list_view.dart';
import 'package:flutter/material.dart';

class FlugramsListViewBuilder extends StatelessWidget {
  const FlugramsListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlugramsBloc, BloweState>(
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

          return FlugramsListView(flugrams: state.data);
        }

        return const SizedBox.shrink();
      },
    );
  }
}
