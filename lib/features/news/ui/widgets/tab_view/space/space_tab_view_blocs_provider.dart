import 'package:flugram/app/repositories/spaceflight/spaceflight_repository.dart';
import 'package:flugram/blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/news/logic/space_articles_bloc.dart';
import 'package:flutter/material.dart';

class SpaceTabViewBlocsProvider extends StatelessWidget {
  const SpaceTabViewBlocsProvider({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SpaceArticlesBloc(
            context.read<SpaceflightRepository>(),
          )..add(const BloweFetch(BloweNoParams())),
        ),
      ],
      child: child,
    );
  }
}
