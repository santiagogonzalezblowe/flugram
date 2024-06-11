import 'package:flugram/features/delete_flugram/ui/widget/delete_flugram_button.dart';
import 'package:flutter/material.dart';

class DeleteFlugramForm extends StatelessWidget {
  const DeleteFlugramForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [DeleteFlugramButton()],
    );
  }
}
