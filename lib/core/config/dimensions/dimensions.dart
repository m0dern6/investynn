import 'package:flutter/material.dart';

class Dimensions {
  final BuildContext context;

  Dimensions(this.context);

  double get deviceWidth => MediaQuery.of(context).size.width;
  double get deviceHeight => MediaQuery.of(context).size.height;

  // For width scaling (based on 430 design width)
  double width(double size) => (size / 430) * deviceWidth;

  // For height scaling (based on 932 design height)
  double height(double size) => (size / 932) * deviceHeight;
}
