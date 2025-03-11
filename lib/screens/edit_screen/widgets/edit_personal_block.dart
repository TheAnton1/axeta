import 'dart:async';

import 'package:axeta/res/typography.dart';
import 'package:axeta/screens/edit_screen/bloc/edit_screen_bloc.dart';
import 'package:axeta/screens/edit_screen/bloc/edit_screen_events.dart';
import 'package:axeta/screens/edit_screen/widgets/language_choice.dart';
import 'package:axeta/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditPersonalBlock extends StatefulWidget {
  const EditPersonalBlock({
    required this.language,
    required this.location,
    required this.name,
    required this.formKey,
    super.key,
  });

  final String name;
  final String location;
  final String language;
  final GlobalKey<FormState> formKey;

  @override
  State<EditPersonalBlock> createState() => _EditPersonalBlockState();
}

class _EditPersonalBlockState extends State<EditPersonalBlock> {
  late TextEditingController _nameController;
  late TextEditingController _locationController;

  Timer? _nameDebounce;
  Timer? _locationDebounce;

  @override
  void initState() {
    _nameController = TextEditingController(text: widget.name);
    _locationController = TextEditingController(text: widget.location);
    super.initState();
  }

  @override
  void dispose() {
    _nameDebounce?.cancel();
    _locationDebounce?.cancel();
    _nameController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<EditScreenBloc>();
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            controller: _nameController,
            style: AppTypography.header,
            validator: bloc.validateName,
            onChanged: () {
              if (_nameDebounce?.isActive ?? false) {
                _nameDebounce!.cancel();
              }
              _nameDebounce = Timer(const Duration(milliseconds: 1500), () {
                bloc.add(ChangeNameEvent(newName: _nameController.text));
              });
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            controller: _locationController,
            validator: bloc.validateLocation,
            onChanged: () {
              if (_locationDebounce?.isActive ?? false) {
                _locationDebounce!.cancel();
              }
              _locationDebounce = Timer(const Duration(milliseconds: 1500), () {
                bloc.add(
                    ChangeLocationEvent(newLocation: _locationController.text));
              });
            },
          ),
          const SizedBox(height: 16),
          ColoredBox(
            color: Colors.white,
            child: LanguageChoice(
                value: widget.language,
                onChanged: (value) {
                  bloc.add(ChangeLanguageEvent(newLanguage: value));
                }),
          ),
        ],
      ),
    );
  }
}
