import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onmascota/views/screens/navigation_screen.dart';
import 'package:onmascota/views/screens/start_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(milliseconds: 7500),
        () => navigateUser());
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: new BoxDecoration(color: Color(0xFFEBECEA)),
      child: Image.asset(
        'assets/images/logoanimation.gif',
        width: 200.0,
        height: 200.0,
      ),
    );
  }
  //NavigateUser fun call on init state;
  void navigateUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var status = prefs.getBool('isLoggedIn') ?? false;
    var str=prefs.getString('email');
    var strName=prefs.getString('name');
    print(strName);
    print(str);
    print(status);
    if (status) {
      // Navigation.pushReplacement(context, "/Home");
      Get.off(() => NavigationScreen(
        initialChangeIndex: 0,
      ));
    } else {
      // Navigation.pushReplacement(context, "/Login");
      Get.off(() => StartScreen());
    }
  }
}
