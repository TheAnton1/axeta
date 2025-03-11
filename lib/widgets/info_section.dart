import 'package:axeta/res/colors.dart';
import 'package:axeta/res/typography.dart';
import 'package:flutter/material.dart';

class InfoSection extends StatelessWidget {
  const InfoSection({
    required this.title,
    required this.child,
    this.onTap,
    super.key,
  });

  final String title;
  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppTypography.headline,
            ),
            (onTap != null)
                ? InkWell(
                    onTap: onTap,
                    child: const Icon(
                      Icons.add,
                      color: AppColors.edit,
                    ),
                  )
                : const SizedBox(),
          ],
        ),
        const SizedBox(height: 16),
        child
      ],
    );
  }
}
