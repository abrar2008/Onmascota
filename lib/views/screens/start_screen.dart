import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onmascota/model/general_model.dart';
import 'package:onmascota/network/network.dart';
import 'package:onmascota/utils/constants.dart';
import 'package:onmascota/views/auth/login_screen.dart';
import 'package:onmascota/views/screens/start_screen2.dart';
import 'package:onmascota/views/widgets/custom_button.dart';


class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  Future<General> data;
  General generalData;

  @override
  void initState() {
    // navigateUser();
    super.initState();
    data = Network().getGeneralData();
    data.then((general) {
      generalData = general;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: sizeWidth(context),
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/Splash-Background.png"),
          fit: BoxFit.cover,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: SizedBox()),
            Container(
              child: Image.asset(
                'assets/images/Logo.png',
                height: 230,
                width: 230,
              ),
            ),
            Expanded(child: SizedBox()),
            Column(
              children: [
                SizedBox(
                  height: 50,
                  width: sizeWidth(context) / 1.2,
                  child: CustomButton(
                    buttonColor: primaryColor,
                    buttonText: "get started",
                    onPress: () {
                      Get.to(() => StartScreen2(generalData: generalData,));
                    },
                    textColor: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Already with an Account? ',
                    style: TextStyle(color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Login',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {// isConnected
                              Get.to(() => LoginScreen(generalData: generalData));
                            },
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: primaryColor)),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

}

