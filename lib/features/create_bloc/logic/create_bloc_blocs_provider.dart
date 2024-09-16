import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flugram/app/repositories/authenticated/blocs_repository.dart';
import 'package:flugram/app/repositories/authenticated/repositories_repository.dart';
import 'package:flugram/features/create_bloc/logic/create_bloc_bloc.dart';
import 'package:flugram/features/create_bloc/logic/repositories_load_bloc.dart';
import 'package:flutter/material.dart';

class CreateBlocBlocsProvider extends StatelessWidget {
  const CreateBlocBlocsProvider({
    super.key,
    required this.child,
    required this.flugramId,
  });

  final Widget child;
  final String flugramId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CreateBlocBloc(
            context.read<BlocsRepository>(),
            flugramId,
          ),
        ),
        BlocProvider(
          create: (context) => RepositoriesLoadBloc(
            context.read<RepositoriesRepository>(),
            flugramId,
          )..fetch(const BloweNoParams()),
        ),
      ],
      child: child,
    );
  }
}
