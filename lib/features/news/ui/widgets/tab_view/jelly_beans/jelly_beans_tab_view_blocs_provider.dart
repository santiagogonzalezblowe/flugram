import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flugram/app/repositories/jelly_bean/jelly_bean_repository.dart';
import 'package:flugram/features/news/logic/jelly_bean_search_bloc.dart';
import 'package:flugram/features/news/logic/jelly_beans_bloc.dart';
import 'package:flutter/material.dart';

class JellyBeansTabViewBlocsProvider extends StatelessWidget {
  const JellyBeansTabViewBlocsProvider({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => JellyBeansBloc(
            context.read<JellyBeanRepository>(),
          )..fetch(const BloweNoParams()),
        ),
        BlocProvider(
          create: (context) => JellyBeanSearchBloc(
            context.read<JellyBeanRepository>(),
          ),
        ),
      ],
      child: child,
    );
  }
}
