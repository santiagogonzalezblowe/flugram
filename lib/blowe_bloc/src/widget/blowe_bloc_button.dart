import 'package:flugram/blowe_bloc/blowe_bloc.dart';
import 'package:flutter/material.dart';

class BloweBlocButton<T extends BloweBloc, B extends ButtonStyleButton>
    extends StatelessWidget {
  const BloweBlocButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return BloweBlocSelector<T>(builder: createButton);
  }

  ButtonStyleButton createButton(BuildContext context, bool enabled) {
    switch (B) {
      case ElevatedButton:
        return ElevatedButton(
          onPressed: enabled ? onPressed : null,
          child: Text(text),
        );
      case TextButton:
        return TextButton(
          onPressed: enabled ? onPressed : null,
          child: Text(text),
        );
      case OutlinedButton:
        return OutlinedButton(
          onPressed: enabled ? onPressed : null,
          child: Text(text),
        );
    }
    throw Exception('Unknown button type');
  }
}
