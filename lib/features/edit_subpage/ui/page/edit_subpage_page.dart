import 'package:flugram/features/edit_subpage/logic/edit_subpage_blocs_provider.dart';
import 'package:flugram/features/edit_subpage/logic/edit_subpage_listener.dart';
import 'package:flugram/features/edit_subpage/ui/widgets/edit_subpage_form.dart';
import 'package:flugram/features/home/models/page_model.dart';
import 'package:flutter/material.dart';

class EditSubpagePage extends StatelessWidget {
  const EditSubpagePage({
    super.key,
    required this.subpage,
  });

  final PageModel subpage;

  @override
  Widget build(BuildContext context) {
    return EditSubpageBlocsProvider(
      child: EditSubpageListener(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Edit Subpage'),
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 32,
            ),
            children: [
              EditSubpageForm(subpage: subpage),
            ],
          ),
        ),
      ),
    );
  }
}
