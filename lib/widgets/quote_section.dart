import 'package:axeta/res/images.dart';
import 'package:axeta/res/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuoteSection extends StatelessWidget {
  const QuoteSection({required this.title, required this.quote, super.key});

  final String title;
  final String quote;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTypography.headline,
        ),
        const SizedBox(height: 16.0),
        SizedBox(
          height: 72,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: SvgPicture.asset(AppImages.openQuote),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  quote,
                  style: AppTypography.body,
                  textAlign: TextAlign.center,
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: SvgPicture.asset(AppImages.closeQuote),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
