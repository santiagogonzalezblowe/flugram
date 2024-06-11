import 'package:flugram/blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/edit_subpage/logic/edit_subpage_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EditSubpageListener extends StatelessWidget {
  const EditSubpageListener({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BloweBlocListener<EditSubpageBloc, void>(
      onCompleted: (context, state) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Subpage edited successfully!'),
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
