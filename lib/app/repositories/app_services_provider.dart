import 'package:flugram/app/services/jelly_bean/spaceflight_service.dart';
import 'package:flugram/app/services/spaceflight/spaceflight_service.dart';
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
          create: (context) => SpaceflightService(),
        ),
        RepositoryProvider(
          create: (context) => JellyBeanService(),
        ),
      ],
      child: child,
    );
  }
}
