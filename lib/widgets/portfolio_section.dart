import 'package:axeta/entities/portfolio_entity.dart';
import 'package:axeta/res/typography.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioSection extends StatelessWidget {
  const PortfolioSection({
    required this.items,
    super.key,
  });

  final PortfolioEntity items;

  @override
  Widget build(BuildContext context) {
    if (items.urls?.isEmpty ?? true) return const SizedBox();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var item in (items.urls ?? {}).entries) ...[
          GestureDetector(
            onTap: () async {
              launchUrl(Uri.parse(item.value));
            },
            child: RichText(
              text: TextSpan(
                text: '- ',
                style: AppTypography.headline,
                children: [
                  TextSpan(text: item.key, style: AppTypography.link),
                ]
              )
            ),
          )
        ]
      ],
    );
  }
}
