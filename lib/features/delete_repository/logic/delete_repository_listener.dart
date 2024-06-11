import 'package:flugram/blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/delete_repository/logic/delete_repository_bloc.dart';
import 'package:flugram/features/flugram/ui/page/flugram_page.dart';
import 'package:flutter/material.dart';

class DeleteRepositoryListener extends StatelessWidget {
  const DeleteRepositoryListener({
    super.key,
    required this.child,
    required this.flugramId,
  });

  final Widget child;
  final String flugramId;

  @override
  Widget build(BuildContext context) {
    return BloweBlocListener<DeleteRepositoryBloc, void>(
      onCompleted: (context, state) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Repository deleted successfully!'),
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
