import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/flugram/logic/subpage_watch_bloc.dart';
import 'package:flutter/material.dart';

class FlugramSubpageListener extends StatelessWidget {
  const FlugramSubpageListener({
    super.key,
    required this.child,
    required this.onPopPressed,
  });

  final Widget child;
  final Function() onPopPressed;

  @override
  Widget build(BuildContext context) {
    return BloweBlocListener<SubpageWatchBloc, void>(
      onError: (context, state) => onPopPressed(),
      child: child,
    );
  }
}
