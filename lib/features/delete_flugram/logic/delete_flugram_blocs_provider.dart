import 'package:flugram/app/repositories/authenticated/flugram_repository.dart';
import 'package:flugram/features/delete_flugram/logic/delete_flugram_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteFlugramBlocsProvider extends StatelessWidget {
  const DeleteFlugramBlocsProvider({
    super.key,
    required this.child,
    required this.flugramId,
  });

  final Widget child;
  final String flugramId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeleteFlugramBloc(
        context.read<FlugramRepository>(),
        flugramId,
      ),
      child: child,
    );
  }
}
