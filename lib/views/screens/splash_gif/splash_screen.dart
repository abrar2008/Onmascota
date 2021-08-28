import 'package:flutter/material.dart';

import 'package:onmascota/utils/size_config.dart';
import 'package:onmascota/views/screens/splash_gif/componenets/body.dart';

class SplashScreenWithGif extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
