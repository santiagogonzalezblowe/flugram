import 'package:flugram/app/repositories/authenticated/repository_repository.dart';
import 'package:flugram/features/delete_repository/logic/delete_repository_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteRepositoryBlocsProvider extends StatelessWidget {
  const DeleteRepositoryBlocsProvider({
    super.key,
    required this.child,
    required this.flugramId,
    required this.repositoryId,
  });

  final Widget child;
  final String flugramId;
  final String repositoryId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeleteRepositoryBloc(
        flugramId,
        repositoryId,
        context.read<RepositoryRepository>(),
      ),
      child: child,
    );
  }
}
