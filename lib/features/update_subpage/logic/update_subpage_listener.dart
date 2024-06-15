import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/update_subpage/logic/update_subpage_bloc.dart';
import 'package:flutter/material.dart';

class UpdateSubpageListener extends StatelessWidget {
  const UpdateSubpageListener({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BloweBlocListener<UpdateSubpageBloc, void>(
      onCompleted: (context, state) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Subpage edited successfully!'),
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
