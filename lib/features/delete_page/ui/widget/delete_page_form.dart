import 'package:flugram/features/delete_page/ui/widget/delete_page_button.dart';
import 'package:flutter/material.dart';

class DeletePageForm extends StatelessWidget {
  const DeletePageForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [DeletePageButton()],
    );
  }
}
