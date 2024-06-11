import 'package:flugram/blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/create_subpage/logic/create_subpage_bloc.dart';
import 'package:flugram/features/flugram/ui/page/flugram_page.dart';
import 'package:flutter/material.dart';

class CreateSubpageListener extends StatelessWidget {
  const CreateSubpageListener({
    super.key,
    required this.child,
    required this.flugramId,
  });

  final Widget child;
  final String flugramId;

  @override
  Widget build(BuildContext context) {
    return BloweBlocListener<CreateSubpageBloc, void>(
      onCompleted: (context, state) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Subpage created successfully!'),
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
