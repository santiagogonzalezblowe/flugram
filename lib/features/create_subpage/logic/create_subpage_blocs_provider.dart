import 'package:flugram/app/repositories/authenticated/subpages_repository.dart';
import 'package:flugram/features/create_subpage/logic/create_subpage_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateSubpageBlocsProvider extends StatelessWidget {
  const CreateSubpageBlocsProvider({
    super.key,
    required this.child,
    required this.flugramId,
  });

  final Widget child;
  final String flugramId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateSubpageBloc(
        context.read<SubpagesRepository>(),
        flugramId,
      ),
      child: child,
    );
  }
}
