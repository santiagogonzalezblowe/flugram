import 'package:flugram/app/repositories/authenticated/bloc_repository.dart';
import 'package:flugram/app/repositories/authenticated/repositories_repository.dart';
import 'package:flugram/blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/create_bloc/logic/repositories_load_bloc.dart';
import 'package:flugram/features/update_bloc/logic/bloc_bloc.dart';
import 'package:flugram/features/update_bloc/logic/update_bloc_bloc.dart';
import 'package:flutter/material.dart';

class UpdateBlocBlocsProvider extends StatelessWidget {
  const UpdateBlocBlocsProvider({
    super.key,
    required this.child,
    required this.flugramId,
    required this.blocId,
    required this.parentPageIds,
  });

  final Widget child;
  final String flugramId;
  final String blocId;
  final List<String> parentPageIds;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BlocBloc(
            flugramId,
            blocId,
            parentPageIds,
            context.read<BlocRepository>(),
            context.read<RepositoriesRepository>(),
          )..add(const BloweFetch(BloweNoParams())),
        ),
        BlocProvider(
          create: (context) => UpdateBlocBloc(
            flugramId,
            parentPageIds,
            context.read<BlocRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => RepositoriesLoadBloc(
            context.read<RepositoriesRepository>(),
            flugramId,
          )..add(const BloweFetch(BloweNoParams())),
        ),
      ],
      child: child,
    );
  }
}
