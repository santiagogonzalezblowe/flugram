import 'package:flugram/app/repositories/authenticated/flugram_repository.dart';
import 'package:flugram/blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/update_flugram/logic/flugram_load_bloc.dart';
import 'package:flugram/features/update_flugram/logic/update_flugram_bloc.dart';
import 'package:flutter/material.dart';

class UpdateFlugramBlocsProvider extends StatelessWidget {
  const UpdateFlugramBlocsProvider({
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
          create: (context) => UpdateFlugramBloc(
            context.read<FlugramRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => FlugramLoadBloc(
            context.read<FlugramRepository>(),
          )..add(BloweFetch(flugramId)),
        ),
      ],
      child: child,
    );
  }
}
