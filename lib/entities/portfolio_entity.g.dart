// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio_entity.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PortfolioEntityCWProxy {
  PortfolioEntity urls(Map<String, String>? urls);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PortfolioEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PortfolioEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  PortfolioEntity call({
    Map<String, String>? urls,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPortfolioEntity.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPortfolioEntity.copyWith.fieldName(...)`
class _$PortfolioEntityCWProxyImpl implements _$PortfolioEntityCWProxy {
  const _$PortfolioEntityCWProxyImpl(this._value);

  final PortfolioEntity _value;

  @override
  PortfolioEntity urls(Map<String, String>? urls) => this(urls: urls);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PortfolioEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PortfolioEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  PortfolioEntity call({
    Object? urls = const $CopyWithPlaceholder(),
  }) {
    return PortfolioEntity(
      urls: urls == const $CopyWithPlaceholder()
          ? _value.urls
          // ignore: cast_nullable_to_non_nullable
          : urls as Map<String, String>?,
    );
  }
}

extension $PortfolioEntityCopyWith on PortfolioEntity {
  /// Returns a callable class that can be used as follows: `instanceOfPortfolioEntity.copyWith(...)` or like so:`instanceOfPortfolioEntity.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PortfolioEntityCWProxy get copyWith => _$PortfolioEntityCWProxyImpl(this);
}
