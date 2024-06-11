import 'package:flugram/app/repositories/authenticated/pages_repository.dart';
import 'package:flugram/features/create_page/logic/create_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatePageBlocsProvider extends StatelessWidget {
  const CreatePageBlocsProvider({
    super.key,
    required this.child,
    required this.flugramId,
  });

  final Widget child;
  final String flugramId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreatePageBloc(
        context.read<PagesRepository>(),
        flugramId,
      ),
      child: child,
    );
  }
}
