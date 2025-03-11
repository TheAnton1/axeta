import 'package:axeta/entities/experience_entity.dart';
import 'package:axeta/screens/edit_screen/bloc/edit_screen_bloc.dart';
import 'package:axeta/screens/edit_screen/bloc/edit_screen_events.dart';
import 'package:axeta/screens/edit_screen/widgets/experience_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditExperienceSection extends StatelessWidget {
  const EditExperienceSection({required this.items, super.key});

  final ExperienceEntity items;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<EditScreenBloc>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < items.items!.length; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: ExperienceItemWidget(
              key: ValueKey('${items.items![i].title}-${items.items![i].years}'),
              title: items.items![i].title,
              years: items.items![i].years,
              index: i,
              onTapTrash: (items.items!.length > 1)
                  ? () {
                      bloc.add(RemoveExperienceEvent(index: i));
                    }
                  : null,
            ),
          ),
      ],
    );
  }
}
