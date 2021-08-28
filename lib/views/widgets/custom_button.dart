import 'package:flutter/material.dart';
import 'package:onmascota/utils/constants.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final Color textColor;

  final Function onPress;

  const CustomButton(
      {Key key,
      @required this.buttonText,
      @required this.buttonColor,
      @required this.textColor,
      @required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sizeWidth(context) / 1.2,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: buttonColor,
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
            side: BorderSide(color: primaryColor),
            textStyle: TextStyle(color: textColor)),
        onPressed: onPress,
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  buttonText.toUpperCase(),
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: textColor),
                  // textAlign: TextAlign.center,
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: CircleAvatar(
                radius: 13,
                backgroundColor: primaryColor,
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: primaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
