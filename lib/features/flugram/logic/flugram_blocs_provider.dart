import 'package:flugram/app/repositories/authenticated/flugram_repository.dart';
import 'package:flugram/app/repositories/authenticated/pages_repository.dart';
import 'package:flugram/app/repositories/authenticated/repositories_repository.dart';
import 'package:flugram/blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/flugram/logic/flugram_watch_bloc.dart';
import 'package:flugram/features/flugram/logic/pages_bloc.dart';
import 'package:flugram/features/flugram/logic/repositories_watch_bloc.dart';
import 'package:flutter/material.dart';

class FlugramBlocsProvider extends StatelessWidget {
  const FlugramBlocsProvider({
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
          create: (context) => FlugramWatchBloc(
            context.read<FlugramRepository>(),
          )..add(BloweFetch(flugramId)),
        ),
        BlocProvider(
          create: (context) => PagesBloc(
            context.read<PagesRepository>(),
            flugramId,
          )..add(const BloweFetch(BloweNoParams())),
        ),
        BlocProvider(
          create: (context) => RepositoriesWatchBloc(
            context.read<RepositoriesRepository>(),
            flugramId,
          )..add(const BloweFetch(BloweNoParams())),
        ),
      ],
      child: child,
    );
  }
}
