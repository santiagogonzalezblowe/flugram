import 'package:flugram/features/create_bloc/ui/page/create_bloc_page.dart';
import 'package:flugram/features/create_subpage/ui/page/create_subpage_page.dart';
import 'package:flugram/features/flugram/ui/widgets/blocs/blocs_list_view.dart';
import 'package:flugram/features/flugram/ui/widgets/subpages/subpages_list_view.dart';
import 'package:flugram/features/home/models/page_model.dart';
import 'package:flugram/features/update_page/ui/page/update_page_page.dart';
import 'package:flutter/material.dart';

class AppPageCard extends StatelessWidget {
  const AppPageCard({
    super.key,
    required this.page,
    required this.onGoPressed,
    required this.flugramId,
  });

  final String flugramId;
  final PageModel page;
  final Function(PageModel subpage) onGoPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    page.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => UpdatePagePage.go(
                    context,
                    flugramId,
                    page.id,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(page.description),
            const SizedBox(height: 8),
            Text(page.path),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text(
                  'Blocs',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    CreateBlocPage.go(
                      context,
                      flugramId,
                      [...page.parentPageIds, page.id],
                    );
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            BlocsListView(
              flugramId: flugramId,
              parentPageIds: [...page.parentPageIds, page.id],
            ),
            Row(
              children: [
                const Text(
                  'Subpages',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    CreateSubpagePage.go(
                      context,
                      flugramId,
                      [...page.parentPageIds, page.id],
                    );
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            SubpagesListView(
              flugramId: flugramId,
              parentPageIds: [...page.parentPageIds, page.id],
              onGoPressed: onGoPressed,
            ),
          ],
        ),
      ),
    );
  }
}
