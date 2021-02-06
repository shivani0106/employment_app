import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// Colors */
final whiteColor = const Color(0xFFFFFFFF);
final backprimaryColor = const Color(0xFFe7f2ec);
final primaryColor = const Color(0xFF001652);
final secondryColor = const Color(0xFF006080);

///status Height */
double statusHeight(BuildContext context) {
  return MediaQuery.of(context).padding.top;
}

///Screen height  */
double screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

///Screen Width */
double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

/// Text Style  */

TextStyle regularPrimaryColor() {
  return TextStyle(
      fontFamily: 'SourceSansPro-Regular',
      fontSize: 16,
      fontWeight: FontWeight.w300,
      color: Colors.cyan);
}

TextStyle extralargePrimaryColorSemiBold() {
  return TextStyle(
      fontFamily: 'SourceSansPro-Bold',
      fontStyle: FontStyle.italic,
      fontSize: 42,
      fontWeight: FontWeight.w500,
      color: primaryColor);
}

TextStyle largeSecondryColorSemiBold() {
  return TextStyle(
      fontFamily: 'SourceSansPro-SemiBold',
      fontStyle: FontStyle.italic,
      fontSize: 26,
      fontWeight: FontWeight.w100,
      color: secondryColor);
}
