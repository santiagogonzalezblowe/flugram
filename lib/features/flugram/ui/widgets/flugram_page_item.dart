import 'package:flugram/features/create_subpage/ui/page/create_subpage_page.dart';
import 'package:flugram/features/flugram/ui/widgets/subpages/subpages_list_view.dart';
import 'package:flugram/features/home/models/page_model.dart';
import 'package:flugram/features/update_page/ui/page/update_page_page.dart';
import 'package:flutter/material.dart';

class AppPageItem extends StatelessWidget {
  const AppPageItem({
    super.key,
    required this.page,
    required this.onGoPressed,
    required this.onPopPressed,
    this.canPop = false,
    required this.flugramId,
  });

  final String flugramId;
  final PageModel page;
  final Function(PageModel subpage) onGoPressed;
  final Function() onPopPressed;
  final bool canPop;

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
                  onPressed: () =>
                      UpdatePagePage.go(context, flugramId, page.id),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(page.description),
            const SizedBox(height: 8),
            Text(page.path),
            const SizedBox(height: 16),
            // if (page.blocs.isNotEmpty) ...[
            //   const Text(
            //     'Blocs:',
            //     style: TextStyle(fontWeight: FontWeight.bold),
            //   ),
            //   ...page.blocs.map(
            //     (bloc) => Padding(
            //       padding: const EdgeInsets.only(top: 4),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Row(
            //             children: [
            //               const Icon(Icons.settings, size: 16),
            //               const SizedBox(width: 8),
            //               Text(bloc.name),
            //             ],
            //           ),
            //           if (bloc.repositories.isNotEmpty) ...[
            //             ...bloc.repositories.map(
            //               (repository) => Padding(
            //                 padding: const EdgeInsets.only(left: 32, top: 2),
            //                 child: Row(
            //                   children: [
            //                     const Icon(Icons.storage, size: 16),
            //                     const SizedBox(width: 8),
            //                     Text(repository.name),
            //                   ],
            //                 ),
            //               ),
            //             ),
            //           ],
            //         ],
            //       ),
            //     ),
            //   ),
            // ],
            // const SizedBox(height: 16),
            // if (page.subpages.isNotEmpty) ...[
            //   ...page.subpages.map((subpage) {
            //     return Padding(
            //       padding: const EdgeInsets.only(top: 4),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Row(
            //             children: [
            //               const Icon(Icons.pages, size: 16),
            //               const SizedBox(width: 8),
            //               Text(subpage.name),
            //             ],
            //           ),
            //           ElevatedButton(
            //             onPressed: () => onGoPressed(subpage),
            //             child: const Text('Go'),
            //           ),
            //         ],
            //       ),
            //     );
            //   }),
            // ],
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
            if (canPop) ...[
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: onPopPressed,
                  child: const Text('Pop'),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
