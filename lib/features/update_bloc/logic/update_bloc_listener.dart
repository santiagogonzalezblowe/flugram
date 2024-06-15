import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/update_bloc/logic/update_bloc_bloc.dart';
import 'package:flutter/material.dart';

class UpdateBlocListener extends StatelessWidget {
  const UpdateBlocListener({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BloweBlocListener<UpdateBlocBloc, void>(
      onCompleted: (context, state) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Bloc edited successfully!'),
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
