import 'package:flugram/features/delete_subpage/ui/widget/delete_page_button.dart';
import 'package:flutter/material.dart';

class DeleteSubpageForm extends StatelessWidget {
  const DeleteSubpageForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [DeleteSubpageButton()],
    );
  }
}
