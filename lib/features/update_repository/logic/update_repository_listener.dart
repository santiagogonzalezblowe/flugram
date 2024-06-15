import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/update_repository/logic/update_repository_bloc.dart';
import 'package:flutter/material.dart';

class UpdateRepositoryListener extends StatelessWidget {
  const UpdateRepositoryListener({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BloweBlocListener<UpdateRepositoryBloc, void>(
      onCompleted: (context, state) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Repository edited successfully!'),
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
