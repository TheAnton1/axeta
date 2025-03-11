import 'dart:developer';

import 'package:axeta/res/typography.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final TextStyle? style;
  final VoidCallback onChanged;

  const CustomTextField({
    super.key,
    required this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.style,
    required this.onChanged,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isError = false;
  @override
  Widget build(BuildContext context) {
    final textStyle = widget.style ?? AppTypography.body;
    return FormField(
      autovalidateMode: AutovalidateMode.always,
      validator: (value) {
        final result = widget.validator?.call(value as String?);
        if (result != null && !isError) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            setState(() {
              isError = true;
            });
          });
        } else if (result == null && isError) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            setState(() {
              isError = false;
            });
          });
        }
        return result;
      },
      builder: (formFieldState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: widget.controller,
              keyboardType: widget.keyboardType,
              style: textStyle,
              textAlignVertical: TextAlignVertical.center,
              onChanged: (value) {
                widget.onChanged();
                formFieldState.didChange(value);
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                isDense: true,
                isCollapsed: true,
                contentPadding: const EdgeInsets.all(4),
                border: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.12)),
                  borderRadius: BorderRadius.zero,
                ),
                suffixIconConstraints: const BoxConstraints(maxHeight: 16),
                suffixIcon: isError
                    ? const Icon(
                        Icons.cancel,
                        color: Colors.red,
                        size: 16,
                      )
                    : const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 16,
                      ),
              ),
            ),
            if (formFieldState.hasError)
              Text(
                formFieldState.errorText!,
                style: AppTypography.error,
              )
          ],
        );
      },
    );
  }
}
