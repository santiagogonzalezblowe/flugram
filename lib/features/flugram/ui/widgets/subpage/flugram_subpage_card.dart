import 'package:flugram/features/create_bloc/ui/page/create_bloc_page.dart';
import 'package:flugram/features/create_subpage/ui/page/create_subpage_page.dart';
import 'package:flugram/features/flugram/ui/widgets/blocs/blocs_list_view.dart';
import 'package:flugram/features/flugram/ui/widgets/subpages/subpages_list_view.dart';
import 'package:flugram/features/home/models/page_model.dart';
import 'package:flugram/features/update_subpage/ui/page/update_subpage_page.dart';
import 'package:flutter/material.dart';

class FlugramSubpageCard extends StatelessWidget {
  const FlugramSubpageCard({
    super.key,
    required this.flugramId,
    required this.subpage,
    required this.onGoPressed,
    required this.onPopPressed,
  });

  final String flugramId;
  final PageModel subpage;
  final Function(PageModel subpage) onGoPressed;
  final Function() onPopPressed;

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
                    subpage.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => UpdateSubpagePage.go(
                    context,
                    flugramId,
                    subpage.id,
                    subpage.parentPageIds,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(subpage.description),
            const SizedBox(height: 8),
            Text(subpage.path),
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
                      [...subpage.parentPageIds, subpage.id],
                    );
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            BlocsListView(
              flugramId: flugramId,
              parentPageIds: [...subpage.parentPageIds, subpage.id],
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
                      [...subpage.parentPageIds, subpage.id],
                    );
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            SubpagesListView(
              flugramId: flugramId,
              parentPageIds: [...subpage.parentPageIds, subpage.id],
              onGoPressed: onGoPressed,
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: onPopPressed,
                child: const Text('Pop'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
