// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experience_entity.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ExperienceEntityCWProxy {
  ExperienceEntity items(List<ExperienceItem>? items);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ExperienceEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ExperienceEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  ExperienceEntity call({
    List<ExperienceItem>? items,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfExperienceEntity.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfExperienceEntity.copyWith.fieldName(...)`
class _$ExperienceEntityCWProxyImpl implements _$ExperienceEntityCWProxy {
  const _$ExperienceEntityCWProxyImpl(this._value);

  final ExperienceEntity _value;

  @override
  ExperienceEntity items(List<ExperienceItem>? items) => this(items: items);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ExperienceEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ExperienceEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  ExperienceEntity call({
    Object? items = const $CopyWithPlaceholder(),
  }) {
    return ExperienceEntity(
      items: items == const $CopyWithPlaceholder()
          ? _value.items
          // ignore: cast_nullable_to_non_nullable
          : items as List<ExperienceItem>?,
    );
  }
}

extension $ExperienceEntityCopyWith on ExperienceEntity {
  /// Returns a callable class that can be used as follows: `instanceOfExperienceEntity.copyWith(...)` or like so:`instanceOfExperienceEntity.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ExperienceEntityCWProxy get copyWith => _$ExperienceEntityCWProxyImpl(this);
}

abstract class _$ExperienceItemCWProxy {
  ExperienceItem title(String title);

  ExperienceItem years(int years);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ExperienceItem(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ExperienceItem(...).copyWith(id: 12, name: "My name")
  /// ````
  ExperienceItem call({
    String title,
    int years,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfExperienceItem.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfExperienceItem.copyWith.fieldName(...)`
class _$ExperienceItemCWProxyImpl implements _$ExperienceItemCWProxy {
  const _$ExperienceItemCWProxyImpl(this._value);

  final ExperienceItem _value;

  @override
  ExperienceItem title(String title) => this(title: title);

  @override
  ExperienceItem years(int years) => this(years: years);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ExperienceItem(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ExperienceItem(...).copyWith(id: 12, name: "My name")
  /// ````
  ExperienceItem call({
    Object? title = const $CopyWithPlaceholder(),
    Object? years = const $CopyWithPlaceholder(),
  }) {
    return ExperienceItem(
      title: title == const $CopyWithPlaceholder()
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
      years: years == const $CopyWithPlaceholder()
          ? _value.years
          // ignore: cast_nullable_to_non_nullable
          : years as int,
    );
  }
}

extension $ExperienceItemCopyWith on ExperienceItem {
  /// Returns a callable class that can be used as follows: `instanceOfExperienceItem.copyWith(...)` or like so:`instanceOfExperienceItem.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ExperienceItemCWProxy get copyWith => _$ExperienceItemCWProxyImpl(this);
}
