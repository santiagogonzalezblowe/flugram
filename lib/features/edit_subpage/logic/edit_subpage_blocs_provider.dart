import 'package:flugram/app/repositories/authenticated/flugrams_repository.dart';
import 'package:flugram/features/edit_subpage/logic/edit_subpage_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditSubpageBlocsProvider extends StatelessWidget {
  const EditSubpageBlocsProvider({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditSubpageBloc(context.read<FlugramsRepository>()),
      child: child,
    );
  }
}
