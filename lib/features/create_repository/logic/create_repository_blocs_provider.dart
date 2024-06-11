import 'package:flugram/app/repositories/authenticated/repositories_repository.dart';
import 'package:flugram/features/create_repository/logic/create_repository_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateRepositoryBlocsProvider extends StatelessWidget {
  const CreateRepositoryBlocsProvider({
    super.key,
    required this.child,
    required this.flugramId,
  });

  final Widget child;
  final String flugramId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateRepositoryBloc(
        context.read<RepositoriesRepository>(),
        flugramId,
      ),
      child: child,
    );
  }
}
