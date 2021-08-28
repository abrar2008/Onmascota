import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onmascota/model/general_model.dart';
import 'package:onmascota/model/login_model.dart';
import 'package:onmascota/utils/constants.dart';
import 'package:onmascota/views/auth/reset_password.dart';
import 'package:onmascota/views/screens/navigation_screen.dart';
import 'package:onmascota/views/screens/start_screen2.dart';
import 'package:onmascota/views/widgets/custom_button.dart';
import 'package:onmascota/views/widgets/custom_textfield.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  final General generalData;

  const LoginScreen({Key key, this.generalData}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: sizeWidth(context),
            height: sizeHeight(context) / 1.06,
            decoration: BoxDecoration(
                color: Colors.pinkAccent,
                image: DecorationImage(
                  image: AssetImage("assets/images/Background2.jpg"),
                  fit: BoxFit.cover,
                )),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        CustomTextFormField(
                          controller: emailController,
                          hintText: "Email",
                          isObscure: false,
                          keyBoardType: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomTextFormField(
                          controller: passController,
                          hintText: "Password",
                          isObscure: true,
                          keyBoardType: TextInputType.visiblePassword,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: sizeWidth(context) / 1.2,
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(() => ResetPasswordScreen(generalData:widget.generalData));
                                },
                                child: Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomButton(
                          buttonColor: primaryColor,
                          buttonText: "login",
                          onPress: () {
                            login();
                          },
                          textColor: Colors.white,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: (){
                            Get.to(() => StartScreen2(generalData: widget.generalData));
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
                    left: 0,
                    top: 0,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.arrow_back_sharp,
                          size: 28,
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> login() async {

    if (passController.text.isNotEmpty && emailController.text.isNotEmpty) {
      String url="https://www.onmascota.thevistech.com/api/login";
      Map body ={
        'email': emailController.text,
        'password': passController.text,
      };
      var response = await http.post(Uri.parse(url), body: body);
      var result=jsonDecode(response.body);
      if(result['data']!= null)
        {
          print("data is present");
          var loginData = loginFromJson(response.body);
          if (loginData.code == 200 && loginData.error == false) {
            print("Response comes");
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs?.setBool("isLoggedIn", true,);
            prefs?.setString('email', emailController.text);
            print(prefs);
            Get.off(() => NavigationScreen(
              initialChangeIndex: 0,
            ));
          }
          else {
            print("data is not present");
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Invalid")));
          }
        }
      else{
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Incorrect email or password")));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Email or password is empty")));
    }
  }

}

