import 'package:flugram/blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/delete_flugram/logic/delete_flugram_bloc.dart';
import 'package:flugram/features/home/ui/page/home_page.dart';
import 'package:flutter/material.dart';

class DeleteFlugramListener extends StatelessWidget {
  const DeleteFlugramListener({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BloweBlocListener<DeleteFlugramBloc, void>(
      onCompleted: (context, state) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Flugram deleted successfully!'),
          ),
        );
        HomePage.go(context);
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
