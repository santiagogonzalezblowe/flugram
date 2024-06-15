import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flugram/app/repositories/authenticated/repository_repository.dart';
import 'package:flugram/features/update_repository/logic/repository_bloc.dart';
import 'package:flugram/features/update_repository/logic/update_repository_bloc.dart';
import 'package:flutter/material.dart';

class UpdateRepositoryBlocsProvider extends StatelessWidget {
  const UpdateRepositoryBlocsProvider({
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RepositoryBloc(
            flugramId,
            repositoryId,
            context.read<RepositoryRepository>(),
          )..add(const BloweFetch(BloweNoParams())),
        ),
        BlocProvider(
          create: (context) => UpdateRepositoryBloc(
            flugramId,
            context.read<RepositoryRepository>(),
          ),
        ),
      ],
      child: child,
    );
  }
}
