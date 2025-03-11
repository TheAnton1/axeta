import 'package:axeta/entities/experience_entity.dart';
import 'package:axeta/entities/user_info_entity.dart';

abstract class EditScreenEvent {}

class PressSaveButtonEvent extends EditScreenEvent {}

class LoadUserInfoEvent extends EditScreenEvent {}

class AddExperienceEvent extends EditScreenEvent {}

class RemoveExperienceEvent extends EditScreenEvent {
  RemoveExperienceEvent({required this.index});

  final int index;
}

class ChangeNameEvent extends EditScreenEvent {
  ChangeNameEvent({required this.newName});

  final String newName;
}

class ChangeLocationEvent extends EditScreenEvent {
  ChangeLocationEvent({required this.newLocation});

  final String newLocation;
}

class ChangeLanguageEvent extends EditScreenEvent {
  ChangeLanguageEvent({required this.newLanguage});

  final String newLanguage;
}

class ChangeExperienceEvent extends EditScreenEvent {
  ChangeExperienceEvent({required this.index, required this.item});

  final int index;
  final ExperienceItem item;
}

class ChangeAvatarEvent extends EditScreenEvent {}
