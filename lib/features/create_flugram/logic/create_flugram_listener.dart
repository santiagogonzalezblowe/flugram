import 'package:flugram/blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/create_flugram/logic/create_flugram_bloc.dart';
import 'package:flugram/features/flugram/ui/page/flugram_page.dart';
import 'package:flutter/material.dart';

class CreateFlugramListener extends StatelessWidget {
  const CreateFlugramListener({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BloweBlocListener<CreateFlugramBloc, String>(
      onCompleted: (context, state) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Flugram created successfully!'),
          ),
        );
        FlugramPage.go(context, state.data);
      },
      onError: (context, state) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(state.error.toString()),
          ),
        );
      },
      child: child,
    );
  }
}
