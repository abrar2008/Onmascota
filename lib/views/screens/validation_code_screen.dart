
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onmascota/utils/constants.dart';
import 'package:onmascota/views/screens/change_password.dart';
import 'package:onmascota/views/widgets/custom_button.dart';
import 'package:onmascota/views/widgets/custom_textfield.dart';

class ValidationCodeScreen extends StatefulWidget {
  @override
  _VAlidationCodeScreenState createState() => _VAlidationCodeScreenState();
}

class _VAlidationCodeScreenState extends State<ValidationCodeScreen> {
  TextEditingController codeController= TextEditingController();
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
                          controller: codeController,
                          hintText: "Code",
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
                            Get.to(() => ChangePasswordScreen());
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
                      "Validation Code".toUpperCase(),
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
}
