import 'package:flutter/material.dart';

class MediaQueryService {
  static double width(
    BuildContext context, {
    double percent = 1,
  }) =>
      MediaQuery.of(context).size.width * percent;

  static double height(
    BuildContext context, {
    double percent = 1,
  }) =>
      MediaQuery.of(context).size.height * percent;

  static EdgeInsets padding(context) => MediaQuery.of(context).padding;
}
