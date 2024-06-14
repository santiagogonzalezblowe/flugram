import 'package:flugram/blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/create_bloc/logic/create_bloc_bloc.dart';
import 'package:flugram/features/create_bloc/logic/repositories_load_bloc.dart';
import 'package:flugram/features/flugram/ui/page/flugram_page.dart';
import 'package:flutter/material.dart';

class CreateBlocListener extends StatelessWidget {
  const CreateBlocListener({
    super.key,
    required this.child,
    required this.flugramId,
  });

  final Widget child;
  final String flugramId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BloweBlocListener<CreateBlocBloc, void>(
          onCompleted: (context, state) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Bloc created successfully!'),
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
        ),
        BloweBlocListener<RepositoriesLoadBloc, void>(
          onError: (context, state) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error.toString()),
              ),
            );
          },
        ),
      ],
      child: child,
    );
  }
}
