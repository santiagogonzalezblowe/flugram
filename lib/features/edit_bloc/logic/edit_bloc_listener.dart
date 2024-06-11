import 'package:flugram/blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/edit_bloc/logic/edit_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EditBlocListener extends StatelessWidget {
  const EditBlocListener({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BloweBlocListener<EditBlocBloc, void>(
      onCompleted: (context, state) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Bloc edited successfully!'),
          ),
        );
        context.pop();
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
