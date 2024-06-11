import 'package:flugram/features/edit_subpage/ui/page/edit_subpage_page.dart';
import 'package:flugram/features/home/models/page_model.dart';
import 'package:flutter/material.dart';

class EditSubpageItem extends StatelessWidget {
  const EditSubpageItem({
    super.key,
    required this.subpage,
  });

  final PageModel subpage;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(subpage.name),
      subtitle: Text(subpage.description),
      trailing: const Icon(Icons.edit),
      onTap: () async {
        await showGeneralDialog(
          context: context,
          pageBuilder: (context, animation, secondaryAnimation) {
            return EditSubpagePage(subpage: subpage);
          },
        );
      },
    );
  }
}
