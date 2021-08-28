import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:onmascota/controllers/myController.dart';

import 'package:onmascota/utils/constants.dart';

import 'package:onmascota/config/cus_theme.dart';
import 'package:onmascota/views/screens/splash_gif/splash_screen.dart';


void main() async {
  Get.put(MyController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: primaryColor,
      statusBarIconBrightness: Brightness.light,
    ));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: SplashScreenWithGif(),
      title: 'Onmascota',
    );
  }
}
