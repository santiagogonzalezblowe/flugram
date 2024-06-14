import 'package:flugram/features/flugram/ui/widgets/create_page_button.dart';
import 'package:flugram/features/flugram/ui/widgets/flugram_page_card.dart';
import 'package:flugram/features/flugram/ui/widgets/subpage/flugram_subpage_item.dart';
import 'package:flugram/features/home/models/page_model.dart';
import 'package:flutter/material.dart';

class FlugramPageItem extends StatelessWidget {
  const FlugramPageItem({
    super.key,
    required this.pages,
    required this.onGoPressed,
    required this.onPopPressed,
    required this.isInitialPage,
    required this.flugramId,
  });

  final String flugramId;
  final List<PageModel> pages;
  final Function(PageModel subpage) onGoPressed;
  final Function() onPopPressed;
  final bool isInitialPage;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 32,
      ),
      itemCount: isInitialPage ? pages.length + 1 : pages.length,
      itemBuilder: (context, index) {
        if (!isInitialPage) {
          final subpage = pages[index];
          return AppSubpageItem(
            subpage: subpage,
            onGoPressed: onGoPressed,
            onPopPressed: onPopPressed,
            flugramId: flugramId,
          );
        }
        if (index < pages.length) {
          final page = pages[index];
          return AppPageCard(
            page: page,
            onGoPressed: onGoPressed,
            flugramId: flugramId,
          );
        } else {
          return CreatePageButton(flugramId);
        }
      },
    );
  }
}
