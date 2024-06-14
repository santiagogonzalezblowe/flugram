import 'package:flugram/app/repositories/authenticated/subpage_repository.dart';
import 'package:flugram/blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/flugram/logic/subpage_watch_bloc.dart';
import 'package:flutter/material.dart';

class FlugramSubpageBlocsProvider extends StatelessWidget {
  const FlugramSubpageBlocsProvider({
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
          create: (context) => SubpageWatchBloc(
            flugramId,
            pageId,
            parentPageIds,
            context.read<SubpageRepository>(),
          )..add(const BloweFetch(BloweNoParams())),
        ),
      ],
      child: child,
    );
  }
}
