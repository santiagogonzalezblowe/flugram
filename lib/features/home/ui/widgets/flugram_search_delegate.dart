import 'package:flugram/features/home/models/flugram_model.dart';
import 'package:flugram/features/home/ui/widgets/flugrams_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FlugramSearchDelegate extends SearchDelegate<String> {
  FlugramSearchDelegate(this.context, this.flugrams);

  final BuildContext context;
  final List<FlugramModel> flugrams;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  String? get searchFieldLabel => AppLocalizations.of(context)!.searchFlugram;

  @override
  Widget buildResults(BuildContext context) {
    final results = getFlugramsByQuery(query);
    return FlugramsListView(flugrams: results);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final results = getFlugramsByQuery(query);
    return FlugramsListView(flugrams: results);
  }

  List<FlugramModel> getFlugramsByQuery(String query) {
    return flugrams.where((flugram) {
      return flugram.name.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }
}
