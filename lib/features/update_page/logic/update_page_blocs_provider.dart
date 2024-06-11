import 'package:flugram/app/repositories/authenticated/page_repository.dart';
import 'package:flugram/blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/update_page/logic/page_bloc.dart';
import 'package:flugram/features/update_page/logic/update_page_bloc.dart';
import 'package:flutter/material.dart';

class UpdatePageBlocsProvider extends StatelessWidget {
  const UpdatePageBlocsProvider({
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageBloc(
            flugramId,
            pageId,
            context.read<PageRepository>(),
          )..add(const BloweFetch(BloweNoParams())),
        ),
        BlocProvider(
          create: (context) => UpdatePageBloc(
            flugramId,
            context.read<PageRepository>(),
          ),
        ),
      ],
      child: child,
    );
  }
}
