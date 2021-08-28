import 'package:flutter/material.dart';

sizeHeight(BuildContext context) {
  double height = MediaQuery.of(context).size.height;
  return height;
}

sizeWidth(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  return width;
}

const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

Color primaryColor = Color(0xfffdb23d);

TextStyle heading1 = TextStyle(
  fontSize: 20,
);

TextStyle heading2 = TextStyle(
  fontSize: 14,
  color: Colors.grey,
);

Color secondaryTextColor = Colors.grey;
currTxtScaleFac(BuildContext context) {
  double currTextScaleFactor = MediaQuery.of(context).textScaleFactor;
  return currTextScaleFactor;
}

resizeFactor(BuildContext context) {
  double _resizeFactor;
  double currTextScaleFactor = currTxtScaleFac(context);
  if (currTextScaleFactor > 1) {
    _resizeFactor = currTextScaleFactor * 0.87;
  } else {
    _resizeFactor = 1.0;
  }

  return _resizeFactor;
}
