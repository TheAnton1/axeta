import 'package:axeta/res/colors.dart';
import 'package:axeta/res/typography.dart';
import 'package:flutter/material.dart';

class SmallTextField extends StatelessWidget {
  const SmallTextField({
    required this.controller,
    this.suffixText,
    this.onChanged,
    super.key,
  });

  final TextEditingController controller;
  final String? suffixText;
  final VoidCallback? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 67,
      child: TextField(
        controller: controller,
        style: AppTypography.body,
        onChanged: (value) {
          onChanged?.call();
        },
        decoration: InputDecoration(
            isDense: true,
            isCollapsed: true,
            suffixText: suffixText,
            filled: true,
            fillColor: AppColors.bgAvatar,
            contentPadding: const EdgeInsets.all(4),
            suffixStyle: AppTypography.body.copyWith(
              color: AppColors.grey,
            )),
      ),
    );
  }
}
