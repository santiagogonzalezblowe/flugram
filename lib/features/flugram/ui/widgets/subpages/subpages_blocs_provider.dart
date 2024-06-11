import 'package:flugram/app/repositories/authenticated/subpages_repository.dart';
import 'package:flugram/blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/flugram/logic/subpages_bloc.dart';
import 'package:flutter/material.dart';

class SubpagesBlocsProvider extends StatelessWidget {
  const SubpagesBlocsProvider({
    super.key,
    required this.child,
    required this.flugramId,
    required this.parentPageIds,
  });

  final Widget child;
  final String flugramId;
  final List<String> parentPageIds;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SubpagesBloc(
        context.read<SubpagesRepository>(),
        flugramId,
        parentPageIds,
      )..add(const BloweFetch(BloweNoParams())),
      child: child,
    );
  }
}
