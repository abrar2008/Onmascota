import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onmascota/utils/constants.dart';
import 'package:onmascota/views/widgets/custom_button.dart';

class SendEmailScreen extends StatefulWidget {
  @override
  _SendEmailScreenState createState() => _SendEmailScreenState();
}

class _SendEmailScreenState extends State<SendEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: sizeWidth(context),
          height: sizeHeight(context),
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/Background2.jpg"),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    Spacer(),
                    avatarUpper(),
                    SizedBox(height: 15.0),
                    Text(
                      "Onmascota".toUpperCase(),
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 37.0,
                      ),
                    ),
                    Text(
                      "The service that your pets deserve".toUpperCase(),
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 10.0,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "Please".toUpperCase(),
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 32.0,
                      ),
                    ),
                    Text(
                      "Verify your email".toUpperCase(),
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 32.0,
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "Amazing pets deals, pets",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    Text(
                      "updates, interesting onmascota",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    Text(
                      "new right in your inbox",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(height: 25.0),
                    CustomButton(
                      buttonText: "Email verification".toUpperCase(),
                      buttonColor: primaryColor,
                      textColor: Colors.white,
                      onPress: () {},
                    ),
                    Spacer(),
                    Spacer(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Container avatarUpper() {
  return Container(
    padding: EdgeInsets.only(top: 20.0),
    width: 120.0,
    height: 120.0,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(60.0)),
      image: DecorationImage(
        image: AssetImage("assets/images/Select Partner Icon.png"),
        fit: BoxFit.cover,
      ),
    ),
  );
}
