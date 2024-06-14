import 'package:flugram/features/flugram/ui/page/flugram_page.dart';
import 'package:flugram/features/home/models/flugram_model.dart';
import 'package:flutter/material.dart';

class FlugramsListView extends StatelessWidget {
  const FlugramsListView({
    super.key,
    required this.flugrams,
  });

  final List<FlugramModel> flugrams;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 32,
      ),
      itemCount: flugrams.length,
      itemBuilder: (context, index) {
        final flugram = flugrams[index];
        return Card(
          clipBehavior: Clip.antiAlias,
          child: ListTile(
            title: Text(flugram.name),
            subtitle: Text(flugram.description),
            onTap: () => FlugramPage.go(context, flugram.id),
          ),
        );
      },
    );
  }
}
