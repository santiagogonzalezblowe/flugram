import 'package:flugram/app/repositories/authenticated/subpage_repository.dart';
import 'package:flugram/features/delete_subpage/logic/delete_subpage_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteSubpageBlocsProvider extends StatelessWidget {
  const DeleteSubpageBlocsProvider({
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
    return BlocProvider(
      create: (context) => DeleteSubpageBloc(
        flugramId,
        pageId,
        parentPageIds,
        context.read<SubpageRepository>(),
      ),
      child: child,
    );
  }
}
