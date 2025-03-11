import 'package:axeta/entities/experience_entity.dart';
import 'package:axeta/entities/portfolio_entity.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'user_info_entity.g.dart';

@CopyWith()
class UserInfoEntity {
  UserInfoEntity({
    required this.fullname,
    required this.location,
    required this.portfolioEntity,
    required this.experienceEntity,
    required this.availability,
    required this.environment,
    required this.quote1,
    required this.quote2,
    required this.language,
    this.avatarPath,
  });

  final String fullname;
  final String location;
  final String language;
  final PortfolioEntity portfolioEntity;
  final ExperienceEntity experienceEntity;
  final String availability;
  final String environment;
  final String quote1;
  final String quote2;
  final String? avatarPath;
}
