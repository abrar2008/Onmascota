import 'package:flutter/material.dart';
import 'package:onmascota/utils/constants.dart';
import 'package:onmascota/views/widgets/custom_button.dart';

class UploadDocumentScreen extends StatefulWidget {
  @override
  _UploadDocumentScreenState createState() => _UploadDocumentScreenState();
}

class _UploadDocumentScreenState extends State<UploadDocumentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 250.0,
            child: upperPortion(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Text(
                    "Verify Your Identity".toUpperCase(),
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Text(
                    "Verification helps you to increase your",
                    style: TextStyle(color: Colors.grey, fontSize: 14.0),
                  ),
                ),
                Center(
                  child: Text(
                    "chances of getting selected, People will trust",
                    style: TextStyle(color: Colors.grey, fontSize: 14.0),
                  ),
                ),
                Center(
                  child: Text(
                    "you have verified badge on your profile",
                    style: TextStyle(color: Colors.grey, fontSize: 14.0),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Center(
                  child: Text(
                    "Identification card or Passports".toUpperCase(),
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Text(
                    "Upload Your identification Card on Passports",
                    style: TextStyle(color: Colors.grey, fontSize: 14.0),
                  ),
                ),
                Center(
                  child: Text(
                    "Phones so they know you are verified",
                    style: TextStyle(color: Colors.grey, fontSize: 14.0),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: Colors.grey.shade100, shadowColor: Colors.grey),
                  child: Text(
                    "upload File".toUpperCase(),
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 45,
                ),
                CustomButton(
                  buttonColor: primaryColor,
                  buttonText: "Complete Registration".toUpperCase(),
                  onPress: () {
                    // Navigator.pushNamed(context, 'LoginScreen');
                  },
                  textColor: Colors.white,
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Container upperPortion() {
  return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [bodyUpper(), avatarUpper()],
      ));
}

Container bodyUpper() {
  return Container(
    margin: EdgeInsets.only(bottom: 40.0),
    width: double.infinity,
    height: double.infinity,
    decoration: BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage("assets/images/Create Partner Page Background.png"),
      ),
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Upload Document".toUpperCase(),
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30.0),
          ),
          Text(
            "Verify Your Identity",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22.0),
          ),
        ],
      ),
    ),
  );
}

Container avatarUpper() {
  return Container(
    padding: EdgeInsets.only(top: 20.0),
    width: 90.0,
    height: 90.0,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(50.0)),
      image: DecorationImage(
        image: AssetImage("assets/images/Select Partner Icon.png"),
        fit: BoxFit.cover,
      ),
    ),
  );
}
