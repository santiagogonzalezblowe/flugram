import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flugram/app/services/jelly_bean/models/jelly_bean_model.dart';
import 'package:flugram/features/jelly_bean/logic/jelly_bean_bloc.dart';
import 'package:flugram/features/jelly_bean/ui/widgets/jelly_bean_loaded.dart';
import 'package:flutter/material.dart';

class JellyBeanBuilder extends StatelessWidget {
  const JellyBeanBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JellyBeanBloc, BloweState>(
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

        if (state is BloweCompleted<JellyBeanModel>) {
          return JellyBeanLoaded(state.data);
        }

        return const SizedBox.shrink();
      },
    );
  }
}
