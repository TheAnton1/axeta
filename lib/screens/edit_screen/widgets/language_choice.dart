import 'dart:developer';

import 'package:axeta/res/typography.dart';
import 'package:flutter/material.dart';

class LanguageChoice extends StatefulWidget {
  const LanguageChoice({
    required this.value,
    required this.onChanged,
    super.key,
  });

  final String value;
  final Function(String value) onChanged;

  @override
  State<LanguageChoice> createState() => _LanguageChoiceState();
}

class _LanguageChoiceState extends State<LanguageChoice> {
  String? _selected;
  final List<Map<String, dynamic>> _items = [
    {'label': 'France', 'emoji': '🇫🇷'},
    {'label': 'English', 'emoji': '🇬🇧'},
    {'label': 'Spanish', 'emoji': '🇪🇸'},
    {'label': 'Russian', 'emoji': '🇷🇺'},
    {'label': 'Belgium', 'emoji': '🇧🇪'},
  ];

  @override
  Widget build(BuildContext context) {
    final chosen = _items.firstWhere((e) => e['label'] == widget.value);
    _selected = chosen['label'];

    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: _selected,
        dropdownColor: Colors.white,
        items: _items
            .map(
              (e) => DropdownMenuItem<String>(
                value: e['label'],
                child: ColoredBox(
                  color: Colors.white,
                  child: Text("${e['emoji']} ${e['label']}"),
                ),
              ),
            )
            .toList(),
        onChanged: (value) {
          setState(() {
            _selected = value;
          });
          widget.onChanged.call(value ?? '');
        },
        style: AppTypography.body,
        isExpanded: true,
        isDense: true,
        padding: const EdgeInsets.all(8),
      ),
    );
  }
}
