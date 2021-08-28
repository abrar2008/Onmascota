import 'dart:convert';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:onmascota/model/sign_up_partner_model.dart';
import 'package:onmascota/utils/constants.dart';
import 'package:onmascota/model/general_model.dart';
import 'package:onmascota/views/auth/login_screen.dart';
import 'package:onmascota/views/widgets/custom_button.dart';
import 'package:onmascota/views/widgets/custom_textfield.dart';
import 'package:http/http.dart' as http;

class BodyOfCreateAccountPartner extends StatefulWidget {
  final int index;
  final General allData;

  const BodyOfCreateAccountPartner({Key key, this.allData, this.index})
      : super(key: key);

  @override
  _BodyOfCreateAccountPartnerState createState() =>
      _BodyOfCreateAccountPartnerState();
}

class _BodyOfCreateAccountPartnerState
    extends State<BodyOfCreateAccountPartner> {
  List<String> experience = [];
  List<String> gender = [];
  List<String> countrycode = [];
  List<String> location = [];
  TextEditingController name = TextEditingController();
  TextEditingController business = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController zipcode = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController aboutbussiness = TextEditingController();
  TextEditingController address = TextEditingController();
  int slocation;
  int experince;
  String gende;
  String businessdetail;
  int code;
  int locat;

  int value = 0;

  @override
  void initState() {
    int numOfExperiences = widget.allData.data.experiences.length;
    for (int i = 0; i < numOfExperiences; i++) {
      experience.add(widget.allData.data.experiences[i].title);
    }
    int numOfGender = widget.allData.data.genders.length;
    for (int i = 0; i < numOfGender; i++) {
      gender.add(widget.allData.data.genders[i].text);
    }

    int numOfcountrycode = widget.allData.data.countryCodes.length;
    for (int i = 0; i < numOfcountrycode; i++) {
      countrycode.add(widget.allData.data.countryCodes[i].code.toString() +
          " - " +
          widget.allData.data.countryCodes[i].countryTitle);
    }

    int numOflocation = widget.allData.data.locations.length;
    for (int i = 0; i < numOflocation; i++) {
      location.add(widget.allData.data.locations[i].name);
    }
    value = widget.index;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 250.0,
          child: upperPortion(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 8.0),
          child: Container(
            width: double.infinity,
            height: 100.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Create Account".toUpperCase(),
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0)),
                Text("Please complete your profile, your information",
                    style: heading2),
                Text("will be shared with our expert team who will",
                    style: heading2),
                Text("verify your identity", style: heading2),
              ],
            ),
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(
        //       horizontal: 28.0, vertical: 8.0),
        //   child: Container(
        //     width: double.infinity,
        //     height: 100.0,
        //     child: lowerPortion(),
        //   ),
        // ),

        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 8.0),
        //   child: Container(
        //     width: double.infinity,
        //     height: 100.0,
        //     child: lowerPortion(),
        //   ),
        // ),
        Column(
          children: [
            CustomTextFormField(
              hintText: "Name",
              isObscure: false,
              keyBoardType: TextInputType.name,
              controller: name,
            ),
            SizedBox(
              height: 15,
            ),
            CustomTextFormField(
              hintText: "Business Name",
              isObscure: false,
              keyBoardType: TextInputType.name,
              controller: business,
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 150,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Colors.grey[200],
                  blurRadius: 2.0,
                  offset: const Offset(0, 5),
                )
              ]),
              width: sizeWidth(context) / 1.2,
              child: TextFormField(
                controller: aboutbussiness,
                style: TextStyle(color: secondaryTextColor),
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'business description'.toUpperCase(),
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            // Container(
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: BorderRadius.circular(5),
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.grey[200],
            //         blurRadius: 2,
            //         offset: const Offset(0, 5),
            //       ),
            //     ],
            //   ),
            //   width: sizeWidth(context) / 1.2,
            //   child:
            //   DropdownSearch<String>(
            //     maxHeight: 100.0,
            //     dropdownSearchDecoration:
            //     InputDecoration(border: InputBorder.none),
            //     mode: Mode.MENU,
            //     showSelectedItem: true,
            //     items: experience,
            //     hint: "Experience",
            //     popupItemDisabled: (String s) => s.startsWith('I'),
            //     onChanged: (_selectvalue) {
            //       experince = widget.allData.data.experiences[experience
            //           .indexOf(_selectvalue)].id;
            //     },
            //   ),
            // ),

            ///BottomSheet Mode with searchBox
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[200],
                    blurRadius: 2,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              width: sizeWidth(context) / 1.2,
              child: DropdownSearch<String>(
                mode: Mode.BOTTOM_SHEET,
                items: experience,
                label: "Experience",
                onChanged: (_selectValue) {
                  experince = widget.allData.data
                      .experiences[experience.indexOf(_selectValue)].id;
                },
                showSearchBox: true,
                dropdownSearchDecoration:
                    InputDecoration(border: InputBorder.none),
                searchFieldProps: TextFieldProps(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
                    labelText: "Search",
                  ),
                ),
                popupShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            CustomTextFormField(
              hintText: "Email",
              isObscure: false,
              keyBoardType: TextInputType.emailAddress,
              controller: email,
            ),
            SizedBox(
              height: 15,
            ),
            CustomTextFormField(
              hintText: "Password",
              isObscure: false,
              keyBoardType: TextInputType.name,
              controller: password,
            ),
            SizedBox(
              height: 15,
            ),
            CustomTextFormField(
              hintText: " Zip Code ",
              isObscure: false,
              keyBoardType: TextInputType.emailAddress,
              controller: zipcode,
            ),
            SizedBox(
              height: 15,
            ),
            CustomTextFormField(
              hintText: "Phone Number",
              isObscure: false,
              keyBoardType: TextInputType.name,
              controller: number,
            ),

            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 15,
            ),
            CustomTextFormField(
              hintText: "Address",
              isObscure: false,
              keyBoardType: TextInputType.name,
              controller: address,
            ),
            SizedBox(
              height: 15,
            ),
            // Container(
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: BorderRadius.circular(5),
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.grey[200],
            //         blurRadius: 2,
            //         offset: const Offset(0, 5),
            //       ),
            //     ],
            //   ),
            //   width: sizeWidth(context) / 1.2,
            //   child: DropdownSearch<String>(
            //     maxHeight: 100.0,
            //     dropdownSearchDecoration:
            //         InputDecoration(border: InputBorder.none),
            //     mode: Mode.MENU,
            //     showSelectedItem: true,
            //     items: gender,
            //     hint: "Gender",
            //     popupItemDisabled: (String s) => s.startsWith('I'),
            //     onChanged: (_selectvalue) {
            //       gende = _selectvalue;
            //     },
            //   ),
            // ),
            ///BottomSheet Mode with searchBox
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[200],
                    blurRadius: 2,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              width: sizeWidth(context) / 1.2,
              child: DropdownSearch<String>(
                mode: Mode.BOTTOM_SHEET,
                items: gender,
                label: "Gender",
                onChanged: (_selectValue) {
                  gende = _selectValue;
                },
                showSearchBox: true,
                dropdownSearchDecoration:
                    InputDecoration(border: InputBorder.none),
                searchFieldProps: TextFieldProps(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
                    labelText: "Search",
                  ),
                ),
                popupShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            // Container(
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: BorderRadius.circular(5),
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.grey[200],
            //         blurRadius: 2,
            //         offset: const Offset(0, 5),
            //       ),
            //     ],
            //   ),
            //   width: sizeWidth(context) / 1.2,
            //   child: DropdownSearch<String>(
            //     maxHeight: 100.0,
            //     dropdownSearchDecoration:
            //         InputDecoration(border: InputBorder.none),
            //     mode: Mode.MENU,
            //     showSelectedItem: true,
            //     items: countrycode,
            //     hint: "Select Country Code ",
            //     popupItemDisabled: (String s) => s.startsWith('I'),
            //     onChanged: (_selectvalue) {
            //       code = widget.allData.data
            //           .countryCodes[countrycode.indexOf(_selectvalue)].id;
            //     },
            //   ),
            // ),
            ///BottomSheet Mode with searchBox
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[200],
                    blurRadius: 2,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              width: sizeWidth(context) / 1.2,
              child: DropdownSearch<String>(
                mode: Mode.BOTTOM_SHEET,
                items: countrycode,
                label: "Select Country Code",
                onChanged: (_selectValue) {
                  code = widget.allData.data
                      .countryCodes[countrycode.indexOf(_selectValue)].id;
                },
                showSearchBox: true,
                dropdownSearchDecoration:
                    InputDecoration(border: InputBorder.none),
                searchFieldProps: TextFieldProps(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
                    labelText: "Search",
                  ),
                ),
                popupShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 15,
            ),
            // Container(
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: BorderRadius.circular(5),
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.grey[200],
            //         blurRadius: 2,
            //         offset: const Offset(0, 5),
            //       ),
            //     ],
            //   ),
            //   width: sizeWidth(context) / 1.2,
            //   child: DropdownSearch<String>(
            //     maxHeight: 50.0,
            //     dropdownSearchDecoration:
            //         InputDecoration(border: InputBorder.none),
            //     mode: Mode.MENU,
            //     showSelectedItem: true,
            //     items: location,
            //     hint: "Select Location ",
            //     popupItemDisabled: (String s) => s.startsWith('I'),
            //     onChanged: (_selectvalue) {
            //       locat = widget.allData.data
            //           .locations[location.indexOf(_selectvalue)].id;
            //     },
            //   ),
            // ),
            ///BottomSheet Mode with searchBox
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[200],
                    blurRadius: 2,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              width: sizeWidth(context) / 1.2,
              child: DropdownSearch<String>(
                mode: Mode.BOTTOM_SHEET,
                items: location,
                label: "Select Location",
                  onChanged: (_selectvalue) {
                          locat = widget.allData.data
                              .locations[location.indexOf(_selectvalue)].id;
                        },
                showSearchBox: true,
                dropdownSearchDecoration:
                InputDecoration(border: InputBorder.none),
                searchFieldProps: TextFieldProps(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
                    labelText: "Search",
                  ),
                ),
                popupShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            CustomButton(
              buttonColor: primaryColor,
              buttonText: "Next",
              onPress: () {
                createRegister();
                print("Button Pressed");
              },
              textColor: Colors.white,
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ],
    )));
  }

  Future<Response> createRegister() async {
    // if (name.text.isNotEmpty && business.text.isNotEmpty
    //  && email.text.isNotEmpty && password.text.isNotEmpty ) {
    var response = await http.post(
        Uri.parse("https://www.onmascota.thevistech.com/api/sign-up-partner"),
        body: ({
          'full_name': name.text,
          'email': email.text,
          'password': password.text,
          'business_name': business.text,
          'zip_code': zipcode.text,
          'number': number.text,
          'address': address.text,
          'experience': json.encode(experince),
          'about_business': aboutbussiness.text,
          'location': json.encode(locat),
          'country_code': json.encode(code),
          'gender': json.encode(gende),
          'company_type': json.encode(value),
        }));
    if (response.statusCode == 200) {
      print("Status code 200");
      String body = response.body;
      var accountData = accountpartnerFromJson(body);

      if (accountData.error) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Invalid Email or Password")));
        print("Status code 200 with error");
      } else {
        Get.off(() => LoginScreen());
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Invalid")));
      print("Other responce" + response.statusCode.toString());
    }
    // } else {
    //   ScaffoldMessenger.of(context)
    //       .showSnackBar(SnackBar(content: Text("Field not allowed")));
    // }
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
          children: [
            Text("Register".toUpperCase(),
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 32.0)),
            Text("Create Your Account",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0)),
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

  Container lowerPortion() {
    return Container(
      alignment: Alignment.topRight,
      width: double.infinity,
      height: double.infinity,
      child: Row(
        children: <Widget>[
          profieAvatar(),
          profileCard(),
        ],
      ),
    );
  }

  Container profieAvatar() {
    return Container(
      width: 100.0,
      height: 100.0,
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10.0, top: 2.0),
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40.0)),
                color: Colors.grey.shade300),
          ),
          Container(
            margin: EdgeInsets.only(left: 60.0, top: 62.0),
            width: 30.0,
            height: 30.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40.0)),
              color: Colors.orangeAccent,
            ),
            child: Icon(
              Icons.camera_alt,
              size: 15.0,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Container profileCard() {
    return Container(
      alignment: Alignment.topLeft,
      width: 200.0,
      height: 100.0,
      decoration: BoxDecoration(),
      child: Column(
        children: [
          SizedBox(
            height: 5.0,
          ),
          Text("Upload Profile Image".toUpperCase(),
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0)),
          SizedBox(
            height: 3.0,
          ),
          Text(
              "Please Upload an Image to be\n"
              "recognize  by others",
              style: TextStyle(
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0)),
        ],
      ),
    );
  }
}
