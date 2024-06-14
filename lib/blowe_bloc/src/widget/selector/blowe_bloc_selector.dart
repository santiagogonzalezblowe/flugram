import 'package:flugram/blowe_bloc/blowe_bloc.dart';
import 'package:flutter/material.dart';

typedef BloweBlocWidgetSelectorBuilder = Widget Function(
  BuildContext context,
  bool enabled,
);

class BloweBlocSelector<T extends BloweBloc> extends StatelessWidget {
  const BloweBlocSelector({
    super.key,
    required this.builder,
  });

  final BloweBlocWidgetSelectorBuilder builder;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<T, BloweBlocState, bool>(
      selector: (state) => state is! BloweInProgress,
      builder: builder,
    );
  }
}
