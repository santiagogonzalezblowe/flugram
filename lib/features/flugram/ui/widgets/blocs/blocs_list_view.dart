import 'package:flugram/features/flugram/ui/widgets/blocs/blocs_blocs_provider.dart';
import 'package:flugram/features/flugram/ui/widgets/blocs/blocs_list_view_builder.dart';
import 'package:flutter/material.dart';

class BlocsListView extends StatelessWidget {
  const BlocsListView({
    super.key,
    required this.flugramId,
    required this.parentPageIds,
  });

  final String flugramId;
  final List<String> parentPageIds;

  @override
  Widget build(BuildContext context) {
    return BlocsBlocsProvider(
      flugramId: flugramId,
      parentPageIds: parentPageIds,
      child: BlocsListViewBuilder(
        flugramId: flugramId,
        parentPageIds: parentPageIds,
      ),
    );
  }
}
