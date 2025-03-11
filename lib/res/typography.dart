import 'package:flutter/material.dart';

abstract class AppTypography {
  static const TextStyle _base = TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: Colors.black);

  static TextStyle header = _base.copyWith(
    fontWeight: FontWeight.w600,
    fontSize: 28,
  );

  static TextStyle body = _base.copyWith();

  static TextStyle headline =
      _base.copyWith(fontWeight: FontWeight.w500, fontSize: 24);

  static TextStyle link =
      _base.copyWith(color: const Color.fromRGBO(52, 131, 204, 1));

  static TextStyle boldBody = _base.copyWith(
    fontWeight: FontWeight.w600,
  );

  static TextStyle error = _base.copyWith(
    color: const Color.fromRGBO(255, 0, 0, 1),
    fontSize: 12,
  );
}
