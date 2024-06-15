import 'package:flugram/app/repositories/jelly_bean/jelly_bean_repository.dart';
import 'package:flugram/blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/jelly_bean/logic/jelly_bean_bloc.dart';
import 'package:flutter/material.dart';

class JellyBeanBlocsProvider extends StatelessWidget {
  const JellyBeanBlocsProvider({
    super.key,
    required this.child,
    required this.beanId,
  });

  final Widget child;
  final int beanId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => JellyBeanBloc(
            context.read<JellyBeanRepository>(),
          )..add(BloweFetch(beanId)),
        ),
      ],
      child: child,
    );
  }
}
