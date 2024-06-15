import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/update_page/logic/update_page_bloc.dart';
import 'package:flutter/material.dart';

class UpdatePageListener extends StatelessWidget {
  const UpdatePageListener({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BloweBlocListener<UpdatePageBloc, void>(
      onCompleted: (context, state) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Page edited successfully!'),
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
