import 'package:axeta/res/typography.dart';
import 'package:axeta/screens/main_screen/bloc/main_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalBlock extends StatelessWidget {
  const PersonalBlock({
    required this.location,
    required this.name,
    required this.language,
    super.key,
  });

  final String name;
  final String location;
  final String language;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: AppTypography.header,
        ),
        const SizedBox(height: 12),
        Text(
          location,
          style: AppTypography.body,
        ),
        const SizedBox(height: 12),
        Text(
          language,
          style: AppTypography.body,
        )
      ],
    );
  }
}
