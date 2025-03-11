import 'package:copy_with_extension/copy_with_extension.dart';

part 'experience_entity.g.dart';

@CopyWith()
class ExperienceEntity {
  ExperienceEntity({this.items});

  final List<ExperienceItem>? items;
}

@CopyWith()
class ExperienceItem {
  ExperienceItem({required this.title, required this.years});

  final String title;
  final int years;
}
