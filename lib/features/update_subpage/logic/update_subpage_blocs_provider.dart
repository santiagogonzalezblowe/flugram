import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flugram/app/repositories/authenticated/subpage_repository.dart';
import 'package:flugram/features/update_subpage/logic/subpage_bloc.dart';
import 'package:flugram/features/update_subpage/logic/update_subpage_bloc.dart';
import 'package:flutter/material.dart';

class UpdateSubpageBlocsProvider extends StatelessWidget {
  const UpdateSubpageBlocsProvider({
    super.key,
    required this.child,
    required this.flugramId,
    required this.pageId,
    required this.parentPageIds,
  });

  final Widget child;
  final String flugramId;
  final String pageId;
  final List<String> parentPageIds;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SubpageBloc(
            flugramId,
            pageId,
            parentPageIds,
            context.read<SubpageRepository>(),
          )..fetch(const BloweNoParams()),
        ),
        BlocProvider(
          create: (context) => UpdateSubpageBloc(
            flugramId,
            parentPageIds,
            context.read<SubpageRepository>(),
          ),
        ),
      ],
      child: child,
    );
  }
}
