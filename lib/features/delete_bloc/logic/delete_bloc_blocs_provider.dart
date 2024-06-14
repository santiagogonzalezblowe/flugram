import 'package:flugram/app/repositories/authenticated/bloc_repository.dart';
import 'package:flugram/features/delete_bloc/logic/delete_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteBlocBlocsProvider extends StatelessWidget {
  const DeleteBlocBlocsProvider({
    super.key,
    required this.child,
    required this.flugramId,
    required this.blocId,
    required this.parentPageIds,
  });

  final Widget child;
  final String flugramId;
  final String blocId;
  final List<String> parentPageIds;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeleteBlocBloc(
        flugramId,
        blocId,
        parentPageIds,
        context.read<BlocRepository>(),
      ),
      child: child,
    );
  }
}
