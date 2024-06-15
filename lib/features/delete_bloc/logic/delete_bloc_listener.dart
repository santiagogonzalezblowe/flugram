import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/delete_bloc/logic/delete_bloc_bloc.dart';
import 'package:flugram/features/flugram/ui/page/flugram_page.dart';
import 'package:flutter/material.dart';

class DeleteBlocListener extends StatelessWidget {
  const DeleteBlocListener({
    super.key,
    required this.child,
    required this.flugramId,
  });

  final Widget child;
  final String flugramId;

  @override
  Widget build(BuildContext context) {
    return BloweBlocListener<DeleteBlocBloc, void>(
      onCompleted: (context, state) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Bloc deleted successfully!'),
          ),
        );
        FlugramPage.go(context, flugramId);
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
