import 'package:axeta/entities/experience_entity.dart';
import 'package:axeta/res/colors.dart';
import 'package:axeta/res/strings/strings.dart';
import 'package:axeta/res/typography.dart';
import 'package:flutter/material.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({required this.items, super.key});

  final ExperienceEntity items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var item in items.items!)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                  text: TextSpan(
                      text: '- ',
                      style: AppTypography.headline,
                      children: [
                    TextSpan(text: item.title, style: AppTypography.boldBody),
                  ])),
              Text(
                Strings.years(item.years),
                style: AppTypography.link.copyWith(
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.edit,
                  decorationStyle: TextDecorationStyle.dashed,
                  decorationThickness: 1.0
                ),
              )
            ],
          ),
      ],
    );
  }
}
