import 'package:flugram/features/delete_bloc/ui/widget/delete_bloc_button.dart';
import 'package:flutter/material.dart';

class DeleteBlocForm extends StatelessWidget {
  const DeleteBlocForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [DeleteBlocButton()],
    );
  }
}
