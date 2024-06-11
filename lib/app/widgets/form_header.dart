import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FormHeader extends StatelessWidget {
  const FormHeader({
    super.key,
    required this.illustration,
    required this.title,
    required this.description,
  });

  final String illustration;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: SvgPicture.asset(
            illustration,
            height: 160,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        Text(
          description,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
