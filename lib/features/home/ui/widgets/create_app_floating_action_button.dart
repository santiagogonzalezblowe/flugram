import 'package:flugram/features/create_flugram/ui/page/create_flugram_page.dart';
import 'package:flutter/material.dart';

class CreateAppFloatingActionButton extends StatelessWidget {
  const CreateAppFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => CreateFlugramPage.go(context),
      child: const Icon(Icons.add),
    );
  }
}
