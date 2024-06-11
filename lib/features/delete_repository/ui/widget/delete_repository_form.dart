import 'package:flugram/features/delete_repository/ui/widget/delete_repository_button.dart';
import 'package:flutter/material.dart';

class DeleteRepositoryForm extends StatelessWidget {
  const DeleteRepositoryForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [DeleteRepositoryButton()],
    );
  }
}
