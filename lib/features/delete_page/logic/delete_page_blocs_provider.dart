import 'package:flugram/app/repositories/authenticated/page_repository.dart';
import 'package:flugram/features/delete_page/logic/delete_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeletePageBlocsProvider extends StatelessWidget {
  const DeletePageBlocsProvider({
    super.key,
    required this.child,
    required this.flugramId,
    required this.pageId,
  });

  final Widget child;
  final String flugramId;
  final String pageId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeletePageBloc(
        flugramId,
        pageId,
        context.read<PageRepository>(),
      ),
      child: child,
    );
  }
}
