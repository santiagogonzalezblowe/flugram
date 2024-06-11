import 'package:flugram/features/flugram/ui/widgets/subpages/subpages_blocs_provider.dart';
import 'package:flugram/features/flugram/ui/widgets/subpages/subpages_list_view_builder.dart';
import 'package:flugram/features/home/models/page_model.dart';
import 'package:flutter/material.dart';

class SubpagesListView extends StatelessWidget {
  const SubpagesListView({
    super.key,
    required this.flugramId,
    required this.parentPageIds,
    required this.onGoPressed,
  });

  final String flugramId;
  final List<String> parentPageIds;
  final Function(PageModel subpage) onGoPressed;

  @override
  Widget build(BuildContext context) {
    return SubpagesBlocsProvider(
      flugramId: flugramId,
      parentPageIds: parentPageIds,
      child: SubpagesListViewBuilder(onGoPressed: onGoPressed),
    );
  }
}
