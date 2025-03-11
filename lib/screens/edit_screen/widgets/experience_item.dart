import 'dart:async';
import 'package:axeta/entities/experience_entity.dart';
import 'package:axeta/res/strings/strings.dart';
import 'package:axeta/res/typography.dart';
import 'package:axeta/screens/edit_screen/bloc/edit_screen_bloc.dart';
import 'package:axeta/screens/edit_screen/bloc/edit_screen_events.dart';
import 'package:axeta/widgets/small_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExperienceItemWidget extends StatefulWidget {
  const ExperienceItemWidget({
    required this.title,
    required this.years,
    required this.index,
    required this.onTapTrash,
    super.key,
  });

  final String title;
  final int years;
  final int index;
  final VoidCallback? onTapTrash;

  @override
  State<ExperienceItemWidget> createState() => _ExperienceItemWidgetState();
}

class _ExperienceItemWidgetState extends State<ExperienceItemWidget> {
  late TextEditingController _titleController;
  late TextEditingController _yearsController;

  Timer? _debounceTimer;

  @override
  void initState() {
    _titleController = TextEditingController(text: widget.title);
    _yearsController = TextEditingController(text: widget.years.toString());
    super.initState();
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }

  void _onChanged() {
    final bloc = context.read<EditScreenBloc>();

    if (_debounceTimer?.isActive ?? false) {
      _debounceTimer?.cancel();
    }

    _debounceTimer = Timer(const Duration(milliseconds: 1500), () {
      bloc.add(
        ChangeExperienceEvent(
          index: widget.index,
          item: ExperienceItem(
            title: _titleController.text,
            years: int.tryParse(_yearsController.text) ?? 0,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              '-',
              style: AppTypography.headline,
            ),
            const SizedBox(width: 8),
            SmallTextField(
              controller: _titleController,
              onChanged: _onChanged,
            ),
          ],
        ),
        Row(
          children: [
            SmallTextField(
              controller: _yearsController,
              suffixText: Strings.years(null),
              onChanged: _onChanged,
            ),
            const SizedBox(width: 8),
            if (widget.onTapTrash != null)
              GestureDetector(
                onTap: widget.onTapTrash,
                child: const Icon(
                  Icons.delete,
                  color: Colors.grey,
                ),
              )
          ],
        )
      ],
    );
  }
}
