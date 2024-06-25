import 'package:flugram/app/services/jelly_bean/jelly_bean_service.dart';
import 'package:flugram/app/services/space/space_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppServicesProvider extends StatelessWidget {
  const AppServicesProvider({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => SpaceService(),
        ),
        RepositoryProvider(
          create: (context) => JellyBeanService(),
        ),
      ],
      child: child,
    );
  }
}
