import 'package:flugram/blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/create_repository/logic/create_repository_bloc.dart';
import 'package:flugram/features/flugram/ui/page/flugram_page.dart';
import 'package:flutter/material.dart';

class CreateRepositoryListener extends StatelessWidget {
  const CreateRepositoryListener({
    super.key,
    required this.child,
    required this.flugramId,
  });

  final Widget child;
  final String flugramId;

  @override
  Widget build(BuildContext context) {
    return BloweBlocListener<CreateRepositoryBloc, void>(
      onCompleted: (context, state) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Repository created successfully!'),
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
