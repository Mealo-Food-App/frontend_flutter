import 'package:flutter/material.dart';

class SizeConfig {
  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  // Optional: Define percentage-based height and width if needed
  static double customHeight(BuildContext context, double height) {
    return height / 803.6363636363636 * MediaQuery.of(context).size.height;
  }

  static double customWidth(BuildContext context, double width) {
    return width / 392.72727272727275 * MediaQuery.of(context).size.width;
  }
}
