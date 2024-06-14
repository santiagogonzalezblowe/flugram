import 'dart:async';

import 'package:flugram/blowe_bloc/blowe_bloc.dart';
import 'package:flutter/material.dart';

typedef BloweMultiBlocWidgetSelectorBuilder = Widget Function(
  BuildContext context,
  bool enabled,
);

class BloweMultiBlocSelector extends StatefulWidget {
  const BloweMultiBlocSelector({
    super.key,
    required this.builder,
    required this.blocs,
  });

  final BloweMultiBlocWidgetSelectorBuilder builder;
  final List<BloweBloc> blocs;

  @override
  _BloweMultiBlocSelectorState createState() => _BloweMultiBlocSelectorState();
}

class _BloweMultiBlocSelectorState extends State<BloweMultiBlocSelector> {
  final StreamController<bool> _streamController = StreamController<bool>();

  @override
  void initState() {
    super.initState();
    for (final bloc in widget.blocs) {
      bloc.stream.listen((state) {
        _streamController.add(
          widget.blocs.every(
            (bloc) => bloc.state is! BloweInProgress,
          ),
        );
      });
    }
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: _streamController.stream,
      builder: (context, snapshot) {
        final enabled = snapshot.hasData && snapshot.data!;
        return widget.builder(context, enabled);
      },
    );
  }
}
