import 'package:flugram/app/repositories/authenticated/flugrams_repository.dart';
import 'package:flugram/features/create_flugram/logic/create_flugram_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateFlugramBlocsProvider extends StatelessWidget {
  const CreateFlugramBlocsProvider({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateFlugramBloc(
        context.read<FlugramsRepository>(),
      ),
      child: child,
    );
  }
}
