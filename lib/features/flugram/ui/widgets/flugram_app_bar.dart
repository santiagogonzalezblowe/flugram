import 'package:flugram/features/home/models/flugram_model.dart';
import 'package:flugram/features/update_flugram/ui/page/update_flugram_page.dart';
import 'package:flutter/material.dart';

class FlugramAppBar extends AppBar {
  FlugramAppBar(BuildContext context, {super.key, FlugramModel? flugram})
      : super(
          title: Text(flugram?.name ?? ''),
          actions: flugram == null
              ? null
              : [
                  IconButton(
                    onPressed: () => UpdateFlugramPage.go(context, flugram.id),
                    icon: const Icon(Icons.edit_note),
                  ),
                ],
        );
}
