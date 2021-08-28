import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onmascota/utils/constants.dart';
import 'package:onmascota/views/screens/start_screen.dart';
import 'package:onmascota/views/widgets/custom_button.dart';
import 'package:onmascota/views/widgets/custom_textfield.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePAsswordScreenState createState() => _ChangePAsswordScreenState();
}

class _ChangePAsswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController newPassController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: sizeWidth(context),
            height: sizeHeight(context) / 1.06,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/images/Background2.jpg"),
              fit: BoxFit.cover,
            )),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Image.asset(
                        'assets/images/Logo.png',
                        height: 230,
                        width: 230,
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        CustomTextFormField(
                          controller: newPassController,
                          hintText: "New Password",
                          isObscure: false,
                          keyBoardType: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomTextFormField(
                          controller: confirmPassController,
                          hintText: "Confirm Password",
                          isObscure: false,
                          keyBoardType: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomButton(
                          buttonColor: primaryColor,
                          buttonText: "Next",
                          onPress: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content:
                                    Text("We are Working on this screen")));
                            Get.back();
                          },
                          textColor: Colors.white,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  left: 5,
                  top: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Change Password".toUpperCase(),
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> confirmPassword() async {}
}
