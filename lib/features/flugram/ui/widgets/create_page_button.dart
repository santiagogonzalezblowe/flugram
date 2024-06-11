import 'package:flugram/features/create_page/ui/page/create_page_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreatePageButton extends StatelessWidget {
  const CreatePageButton(this.flugramId, {super.key});

  final String flugramId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ElevatedButton(
        onPressed: () => CreatePagePage.go(context, flugramId),
        child: Text(AppLocalizations.of(context)!.createPage),
      ),
    );
  }
}
