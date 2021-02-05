import 'package:flutter/widgets.dart';

/// Colors */
final whiteColor = const Color(0xFFFFFFFF);
final backprimaryColor = const Color(0xFFAEC6CF);

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

/** Text Style  */
