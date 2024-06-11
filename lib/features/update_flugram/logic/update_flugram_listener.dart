import 'package:flugram/blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/update_flugram/logic/update_flugram_bloc.dart';
import 'package:flutter/material.dart';

class UpdateFlugramListener extends StatelessWidget {
  const UpdateFlugramListener({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BloweBlocListener<UpdateFlugramBloc, void>(
      onCompleted: (context, state) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('App edited successfully!'),
          ),
        );
      },
      onError: (context, state) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(state.error.toString()),
          ),
        );
      },
      child: child,
    );
  }
}
