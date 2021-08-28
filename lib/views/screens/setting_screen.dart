import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:onmascota/utils/constants.dart';
import 'package:onmascota/views/auth/reset_password.dart';
import 'package:onmascota/views/screens/about_us_screen.dart';
import 'package:onmascota/views/screens/change_password.dart';
import 'package:onmascota/views/screens/edit_profile_screen.dart';
import 'package:onmascota/views/screens/privacy_policy_screen.dart';
import 'package:onmascota/views/screens/support_screen.dart';
import 'package:onmascota/views/screens/terms_condition_screen.dart';
import 'package:onmascota/views/screens/upload_documnet_screen.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  List<String> _svgAssets = <String>[
    // 'assets/notfound.svg', // uncomment to test an asset that doesn't exist.
    "assets/icons/Setting/User.svg",
    "assets/icons/Setting/Change Email.svg",
    "assets/icons/Setting/Change Password.svg",
    "assets/icons/Setting/Update Document.svg",
    "assets/icons/Setting/App Version.svg",
    "assets/icons/Setting/Language.svg",
    "assets/icons/Setting/Terms & Conditions.svg",
    "assets/icons/Setting/Privacy Policy.svg",
    "assets/icons/Setting/About Us.svg",
  ];

  String version;
  var str;

  Future<void> getPackageInfo() async {
    PackageInfo _packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      version = _packageInfo.version;
      print(version);
    });
  }

  Future<void> getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    str = prefs.getString('email');
    print(str);
  }

  @override
  void initState() {
    super.initState();
    getPackageInfo();
    getEmail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context)),
        title: Text(
          "Setting",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 35.0),
              Row(
                children: <Widget>[
                  Text(
                    "General",
                    style:
                        TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              GestureDetector(
                onTap: () {
                  Get.to(() => EditProfileScreen());
                },
                child: Row(
                  children: <Widget>[
                    SvgPicture.asset(
                      _svgAssets[0],
                      color: primaryColor,
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      "Edit Profile",
                      style: TextStyle(
                        fontSize: 16.0,
                        // fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              GestureDetector(
                onTap: () {
                  Get.to(() => ResetPasswordScreen());
                },
                child: Row(
                  children: <Widget>[
                    SvgPicture.asset(
                      _svgAssets[1],
                      color: primaryColor,
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Change Email",
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        Text(
                          str ?? "",
                          style: TextStyle(fontSize: 12.0, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              GestureDetector(
                onTap: () {
                  Get.to(() => ChangePasswordScreen());
                },
                child: Row(
                  children: <Widget>[
                    SvgPicture.asset(
                      _svgAssets[2],
                      color: primaryColor,
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      "Change Password",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              GestureDetector(
                onTap: () {
                  Get.to(() => UploadDocumentScreen());
                },
                child: Row(
                  children: <Widget>[
                    SvgPicture.asset(
                      _svgAssets[3],
                      color: primaryColor,
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      "Update Document",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              SizedBox(height: 35.0),
              Row(
                children: <Widget>[
                  Text(
                    "Application".toUpperCase(),
                    style:
                        TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Row(
                children: <Widget>[
                  SvgPicture.asset(
                    _svgAssets[4],
                    color: primaryColor,
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "App Version",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        version ?? " ",
                        style: TextStyle(fontSize: 12.0, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Row(
                children: <Widget>[
                  SvgPicture.asset(
                    _svgAssets[5],
                    color: primaryColor,
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "App Language",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "English",
                        style: TextStyle(fontSize: 12.0, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              GestureDetector(
                onTap: () {
                  Get.to(() => TermsAndConditionScreen());
                },
                child: Row(
                  children: <Widget>[
                    SvgPicture.asset(
                      _svgAssets[6],
                      color: primaryColor,
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      "Terms & Conditions",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              GestureDetector(
                onTap: () {
                  Get.to(() => PrivacyPolicyScreen());
                },
                child: Row(
                  children: <Widget>[
                    SvgPicture.asset(_svgAssets[7], color: primaryColor),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      "Privacy Policy",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              GestureDetector(
                onTap: () {
                  Get.to(() => CustomerSupportScreen());
                },
                child: Row(
                  children: <Widget>[
                    Image.asset("assets/icons/Setting/Support.png"),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      "Support",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              GestureDetector(
                onTap: () {
                  Get.to(() => AboutUs());
                },
                child: Row(
                  children: <Widget>[
                    SvgPicture.asset(
                      _svgAssets[8],
                      color: primaryColor,
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      "About Us",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
