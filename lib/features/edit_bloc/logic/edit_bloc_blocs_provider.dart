import 'package:flugram/app/repositories/authenticated/flugrams_repository.dart';
import 'package:flugram/features/edit_bloc/logic/edit_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditBlocBlocsProvider extends StatelessWidget {
  const EditBlocBlocsProvider({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditBlocBloc(context.read<FlugramsRepository>()),
      child: child,
    );
  }
}
