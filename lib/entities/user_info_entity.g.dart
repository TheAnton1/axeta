// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_entity.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UserInfoEntityCWProxy {
  UserInfoEntity fullname(String fullname);

  UserInfoEntity location(String location);

  UserInfoEntity portfolioEntity(PortfolioEntity portfolioEntity);

  UserInfoEntity experienceEntity(ExperienceEntity experienceEntity);

  UserInfoEntity availability(String availability);

  UserInfoEntity environment(String environment);

  UserInfoEntity quote1(String quote1);

  UserInfoEntity quote2(String quote2);

  UserInfoEntity language(String language);

  UserInfoEntity avatarPath(String? avatarPath);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserInfoEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserInfoEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  UserInfoEntity call({
    String fullname,
    String location,
    PortfolioEntity portfolioEntity,
    ExperienceEntity experienceEntity,
    String availability,
    String environment,
    String quote1,
    String quote2,
    String language,
    String? avatarPath,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUserInfoEntity.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUserInfoEntity.copyWith.fieldName(...)`
class _$UserInfoEntityCWProxyImpl implements _$UserInfoEntityCWProxy {
  const _$UserInfoEntityCWProxyImpl(this._value);

  final UserInfoEntity _value;

  @override
  UserInfoEntity fullname(String fullname) => this(fullname: fullname);

  @override
  UserInfoEntity location(String location) => this(location: location);

  @override
  UserInfoEntity portfolioEntity(PortfolioEntity portfolioEntity) =>
      this(portfolioEntity: portfolioEntity);

  @override
  UserInfoEntity experienceEntity(ExperienceEntity experienceEntity) =>
      this(experienceEntity: experienceEntity);

  @override
  UserInfoEntity availability(String availability) =>
      this(availability: availability);

  @override
  UserInfoEntity environment(String environment) =>
      this(environment: environment);

  @override
  UserInfoEntity quote1(String quote1) => this(quote1: quote1);

  @override
  UserInfoEntity quote2(String quote2) => this(quote2: quote2);

  @override
  UserInfoEntity language(String language) => this(language: language);

  @override
  UserInfoEntity avatarPath(String? avatarPath) => this(avatarPath: avatarPath);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserInfoEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserInfoEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  UserInfoEntity call({
    Object? fullname = const $CopyWithPlaceholder(),
    Object? location = const $CopyWithPlaceholder(),
    Object? portfolioEntity = const $CopyWithPlaceholder(),
    Object? experienceEntity = const $CopyWithPlaceholder(),
    Object? availability = const $CopyWithPlaceholder(),
    Object? environment = const $CopyWithPlaceholder(),
    Object? quote1 = const $CopyWithPlaceholder(),
    Object? quote2 = const $CopyWithPlaceholder(),
    Object? language = const $CopyWithPlaceholder(),
    Object? avatarPath = const $CopyWithPlaceholder(),
  }) {
    return UserInfoEntity(
      fullname: fullname == const $CopyWithPlaceholder()
          ? _value.fullname
          // ignore: cast_nullable_to_non_nullable
          : fullname as String,
      location: location == const $CopyWithPlaceholder()
          ? _value.location
          // ignore: cast_nullable_to_non_nullable
          : location as String,
      portfolioEntity: portfolioEntity == const $CopyWithPlaceholder()
          ? _value.portfolioEntity
          // ignore: cast_nullable_to_non_nullable
          : portfolioEntity as PortfolioEntity,
      experienceEntity: experienceEntity == const $CopyWithPlaceholder()
          ? _value.experienceEntity
          // ignore: cast_nullable_to_non_nullable
          : experienceEntity as ExperienceEntity,
      availability: availability == const $CopyWithPlaceholder()
          ? _value.availability
          // ignore: cast_nullable_to_non_nullable
          : availability as String,
      environment: environment == const $CopyWithPlaceholder()
          ? _value.environment
          // ignore: cast_nullable_to_non_nullable
          : environment as String,
      quote1: quote1 == const $CopyWithPlaceholder()
          ? _value.quote1
          // ignore: cast_nullable_to_non_nullable
          : quote1 as String,
      quote2: quote2 == const $CopyWithPlaceholder()
          ? _value.quote2
          // ignore: cast_nullable_to_non_nullable
          : quote2 as String,
      language: language == const $CopyWithPlaceholder()
          ? _value.language
          // ignore: cast_nullable_to_non_nullable
          : language as String,
      avatarPath: avatarPath == const $CopyWithPlaceholder()
          ? _value.avatarPath
          // ignore: cast_nullable_to_non_nullable
          : avatarPath as String?,
    );
  }
}

extension $UserInfoEntityCopyWith on UserInfoEntity {
  /// Returns a callable class that can be used as follows: `instanceOfUserInfoEntity.copyWith(...)` or like so:`instanceOfUserInfoEntity.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UserInfoEntityCWProxy get copyWith => _$UserInfoEntityCWProxyImpl(this);
}
