import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/create_page/logic/create_page_bloc.dart';
import 'package:flugram/features/flugram/ui/page/flugram_page.dart';
import 'package:flutter/material.dart';

class CreatePageListener extends StatelessWidget {
  const CreatePageListener({
    super.key,
    required this.child,
    required this.flugramId,
  });

  final Widget child;
  final String flugramId;

  @override
  Widget build(BuildContext context) {
    return BloweBlocListener<CreatePageBloc, void>(
      onCompleted: (context, state) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Page created successfully!'),
          ),
        );
        FlugramPage.go(context, flugramId);
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
