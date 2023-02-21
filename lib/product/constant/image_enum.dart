// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';

enum ImageEnums { door }

extension ImageEnumsExtensions on ImageEnums {
  String get _toPath => 'assets/images/ic_${name}.png';
  Image get toImage => Image.asset(_toPath);
}
