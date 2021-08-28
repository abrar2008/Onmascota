import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onmascota/model/general_model.dart';
import 'package:onmascota/model/reset_password_model.dart';
import 'package:onmascota/utils/constants.dart';
import 'package:onmascota/views/screens/start_screen2.dart';
import 'package:onmascota/views/screens/validation_code_screen.dart';
import 'package:onmascota/views/widgets/custom_button.dart';
import 'package:onmascota/views/widgets/custom_textfield.dart';
import 'package:http/http.dart' as http;

class ResetPasswordScreen extends StatefulWidget {
  final General generalData;

  const ResetPasswordScreen({Key key, this.generalData}) : super(key: key);
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController emailController = TextEditingController();

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
                          controller: emailController,
                          hintText: "Email",
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
                           Get.to(() => ValidationCodeScreen());
                          },
                          textColor: Colors.white,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: (){
                            Get.off(StartScreen2(generalData: widget.generalData,));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Create Account"),
                              Icon(Icons.arrow_forward),
                            ],
                          ),
                        )
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
                      "reset password".toUpperCase(),
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

  Future<void> sendResponse() async {
    if (emailController.text.isNotEmpty) {
      String url = "https://www.onmascota.thevistech.com/api/forgot?email";
      Map body = {
        'email': emailController.text,
      };
      var response = await http.post(Uri.parse(url), body: body);
      var result = jsonDecode(response.body);
      if (result['data'] != null) {
        print("data is present");
        var loginData = resetPasswordModelFromJson(response.body);
        if (loginData.code == 200 && loginData.error == false) {
          print("Response comes");
          Get.off(() {});
        } else {
          print("data is not present");
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Invalid")));
        }
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Incorrect email")));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Email is empty")));
    }
  }
}
