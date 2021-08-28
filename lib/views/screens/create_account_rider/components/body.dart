import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onmascota/model/general_model.dart';
import 'package:onmascota/model/sign_up_rider_model.dart';

import 'package:onmascota/utils/constants.dart';
import 'package:onmascota/views/auth/login_screen.dart';
import 'package:onmascota/views/widgets/custom_button.dart';
import 'package:onmascota/views/widgets/custom_textfield.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BodyOfCreateAccountRider extends StatefulWidget {
  final General allData;

  const BodyOfCreateAccountRider({Key key, this.allData}) : super(key: key);

  @override
  _BodyOfCreateAccountPartnerState createState() =>
      _BodyOfCreateAccountPartnerState();
}

class _BodyOfCreateAccountPartnerState extends State<BodyOfCreateAccountRider> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController numController = TextEditingController();
  TextEditingController zipController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController vehicleNumberController = TextEditingController();

  List<String> experience = [];
  List<String> gender = [];
  List<String> country = [];
  List<String> model = [];
  List<String> location = [];
  List<String> vehicle = [];

  //int _radioValue = 0;
  int selectedCountry;
  int selectedExperience;
  String selectedGender;
  int selectedLocation;
  int selectedVehicleModel;
  int selectedVehicleType;

  //int _paymentRadioValue = 0;

  // dynamic _handlePaymentRadioValueChange(int value) {
  //   setState(() {
  //     _paymentRadioValue = value;
  //     if (_paymentRadioValue == 1) {
  //       setState(() {
  //         selectedVehicleType = widget.allData.data.vehicleTypes[0].id;
  //       });
  //     } else if (_paymentRadioValue == 2) {
  //       setState(() {
  //         selectedVehicleType = widget.allData.data.vehicleTypes[1].id;
  //       });
  //     } else if (_paymentRadioValue == 3) {
  //       setState(() {
  //         selectedVehicleType = widget.allData.data.vehicleTypes[2].id;
  //       });
  //     }
  //     switch (_radioValue) {
  //       case 0:
  //         break;
  //       case 1:
  //         break;
  //     }
  //   });
  // }

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
    int numOfCountry = widget.allData.data.countryCodes.length;
    for (int i = 0; i < numOfCountry; i++) {
      country.add(widget.allData.data.countryCodes[i].code.toString() +
          " - " +
          widget.allData.data.countryCodes[i].countryTitle);
    }
    int numOfModel = widget.allData.data.vehicleModels.length;
    for (int i = 0; i < numOfModel; i++) {
      model.add(widget.allData.data.vehicleModels[i].title.toString());
    }
    int numOfLocation = widget.allData.data.locations.length;
    for (int i = 0; i < numOfLocation; i++) {
      location.add(widget.allData.data.locations[i].name);
    }
    int numOfVehicleType = widget.allData.data.vehicleTypes.length;
    for (int i = 0; i < numOfVehicleType; i++) {
      vehicle.add(widget.allData.data.vehicleTypes[i].title);
    }
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
        //   padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 8.0),
        //   child: Container(
        //     width: double.infinity,
        //     height: 100.0,
        //     // child: lowerPortion(),
        //   ),
        // ),
        Column(
          children: [
            CustomTextFormField(
              controller: nameController,
              hintText: "Full Name",
              isObscure: false,
              keyBoardType: TextInputType.name,
            ),
            SizedBox(
              height: 15,
            ),
            CustomTextFormField(
              controller: emailController,
              hintText: "Email",
              isObscure: false,
              keyBoardType: TextInputType.name,
            ),
            SizedBox(
              height: 15,
            ),
            CustomTextFormField(
              controller: newPassController,
              hintText: "New Password",
              isObscure: true,
              keyBoardType: TextInputType.name,
            ),
            SizedBox(
              height: 15,
            ),
            CustomTextFormField(
              controller: confirmPassController,
              hintText: "Confirm Password",
              isObscure: true,
              keyBoardType: TextInputType.name,
            ),
            SizedBox(
              height: 15,
            ),

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
                items: country,
                label: "Select Country Code",
                onChanged: (_selectedValue) {
                  selectedCountry = widget.allData.data
                      .countryCodes[country.indexOf(_selectedValue)].id;
                  print(selectedCountry);
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
            //     dropdownSearchDecoration:
            //     InputDecoration(border: InputBorder.none),
            //     mode: Mode.MENU,
            //     maxHeight: 150.0,
            //     showSelectedItem: true,
            //     items: country,
            //     hint: "Select Country Code",
            //     searchFieldProps: TextFieldProps(
            //       decoration: InputDecoration(
            //         border: OutlineInputBorder(),
            //         contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
            //         labelText: "Search a country",
            //       ),
            //     ),
            //     showSearchBox: true,
            //     popupItemDisabled: (String s) => s.startsWith('I'),
            //     onChanged: (_selectedValue) {
            //       selectedCountry = widget.allData.data.countryCodes[country.indexOf(_selectedValue)].id;
            //       print(selectedCountry);
            //     },
            //   ),
            // ),
            // SizedBox(
            //   height: 15,
            // ),
            CustomTextFormField(
              controller: numController,
              hintText: "Number",
              isObscure: false,
              keyBoardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 15,
            ),

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
                label: "Select Experience",
                onChanged: (_selectedValue) {
                  selectedExperience = widget.allData.data
                      .experiences[experience.indexOf(_selectedValue)].id;
                  print(selectedExperience);
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
            //     dropdownSearchDecoration:
            //     InputDecoration(border: InputBorder.none),
            //     mode: Mode.MENU,
            //     maxHeight: 150.0,
            //     showSelectedItem: true,
            //     items: experience,
            //     hint: "Experience",
            //     popupItemDisabled: (String s) => s.startsWith('I'),
            //     onChanged: (_selectedValue) {
            //       selectedExperience =  widget.allData.data.experiences[experience.indexOf(_selectedValue)].id;
            //       print(selectedExperience);
            //     },
            //   ),
            // ),
            SizedBox(
              height: 15,
            ),

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
                onChanged: (_selectedValue) {
                  selectedGender = _selectedValue;
                  print(selectedGender);
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
            //     dropdownSearchDecoration:
            //         InputDecoration(border: InputBorder.none),
            //     mode: Mode.MENU,
            //     showSelectedItem: true,
            //     maxHeight: 150.0,
            //     items: gender,
            //     // items: ["Male", "Female", "Other"],
            //     hint: "Gender",
            //     popupItemDisabled: (String s) => s.startsWith('I'),
            //     onChanged: (_selectedValue) {
            //       selectedGender = _selectedValue;
            //       print(selectedGender);
            //     },
            //   ),
            // ),
            SizedBox(
              height: 15,
            ),
            CustomTextFormField(
              controller: zipController,
              hintText: "Zip Code",
              isObscure: false,
              keyBoardType: TextInputType.name,
            ),
            SizedBox(
              height: 15,
            ),
            CustomTextFormField(
              controller: addressController,
              hintText: "Address",
              isObscure: false,
              keyBoardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 15,
            ),

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
                onChanged: (_selectedValue) {
                  selectedLocation = widget.allData.data
                      .locations[location.indexOf(_selectedValue)].id;
                  print(selectedLocation);
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
            //     dropdownSearchDecoration:
            //         InputDecoration(border: InputBorder.none),
            //     mode: Mode.MENU,
            //     showSelectedItem: true,
            //     maxHeight: 150.0,
            //     items: location,
            //     // items: ["Male", "Female", "Other"],
            //     hint: "Select Location",
            //     popupItemDisabled: (String s) => s.startsWith('I'),
            //     onChanged: (_selectedValue) {
            //       selectedLocation = widget.allData.data
            //           .locations[location.indexOf(_selectedValue)].id;
            //       print(selectedLocation);
            //     },
            //   ),
            // ),
            SizedBox(
              height: 15,
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 30.0),
            //   child: Container(
            //     alignment: Alignment.topLeft,
            //     width: double.infinity,
            //     height: 70.0,
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.start,
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.start,
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Text(
            //               "Vehicle Type",
            //               style: TextStyle(
            //                 color: Colors.grey.shade700,
            //                 fontSize: 16.0,
            //                 fontWeight: FontWeight.bold,
            //               ),
            //             ),
            //           ],
            //         ),
            //         SizedBox(
            //           height: 2.0,
            //         ),
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.start,
            //           children: <Widget>[
            //             Radio(
            //               activeColor: primaryColor,
            //               // value: 0,
            //               value: vehicle[0],
            //               groupValue: _paymentRadioValue,
            //               onChanged: (value){
            //                 _handlePaymentRadioValueChange;
            //               }
            //             ),
            //             Icon(Icons.local_shipping_sharp,
            //                 color: _paymentRadioValue == 1
            //                     ? primaryColor
            //                     : primaryColor.withOpacity(0.5)),
            //             Text("VAN"),
            //             Radio(
            //               activeColor: primaryColor,
            //               // value: 1,
            //               value: vehicle[1],
            //               groupValue: _paymentRadioValue,
            //                 onChanged: (value){
            //                   _handlePaymentRadioValueChange;
            //                 }
            //             ),
            //             Icon(Icons.pedal_bike_outlined,
            //                 color: _paymentRadioValue == 2
            //                     ? primaryColor
            //                     : primaryColor.withOpacity(0.5)),
            //             Text("BIKE"),
            //             Radio(
            //               activeColor: primaryColor,
            //               // value: 3,
            //               value: vehicle[2],
            //               groupValue: _paymentRadioValue,
            //               onChanged: _handlePaymentRadioValueChange,
            //             ),
            //             Icon(
            //               Icons.directions_car,
            //               color: _paymentRadioValue == 3
            //                   ? primaryColor
            //                   : primaryColor.withOpacity(0.5),
            //             ),
            //
            //             Text("CAR"),
            //
            //             // RadioGroup<String>.builder(
            //             //   direction: Axis.horizontal,
            //             //   groupValue: _verticalGroupValue,
            //             //   onChanged: (value) => setState(() {
            //             //     _verticalGroupValue = value;
            //             //   }),
            //             //   items: _status,
            //             //   itemBuilder: (item) => RadioButtonBuilder(
            //             //     item,
            //             //   ),
            //             //   activeColor: Colors.red,
            //             // ),
            //           ],
            //         )
            //       ],
            //     ),
            //   ),
            // ),
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
            //     dropdownSearchDecoration:
            //         InputDecoration(border: InputBorder.none),
            //     mode: Mode.MENU,
            //     showSelectedItem: true,
            //     maxHeight: 150.0,
            //     items: vehicle,
            //     // items: ["Male", "Female", "Other"],
            //     hint: "Select Vehicle Type",
            //     popupItemDisabled: (String s) => s.startsWith('I'),
            //     onChanged: (_selectedValue) {
            //       selectedVehicleType = widget.allData.data
            //           .vehicleTypes[vehicle.indexOf(_selectedValue)].id;
            //       print(selectedVehicleType);
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
                items: vehicle,
                label: "Select Vehicle Type",
                onChanged: (_selectedValue) {
                  selectedVehicleType = widget.allData.data
                      .vehicleTypes[vehicle.indexOf(_selectedValue)].id;
                  print(selectedVehicleType);
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
            //     dropdownSearchDecoration:
            //         InputDecoration(border: InputBorder.none),
            //     mode: Mode.MENU,
            //     showSelectedItem: true,
            //     maxHeight: 150.0,
            //     items: model,
            //     // items: ["Male", "Female", "Other"],
            //     hint: "Vehicle Model",
            //     popupItemDisabled: (String s) => s.startsWith('I'),
            //     onChanged: (_selectedValue) {
            //       selectedVehicleModel = widget.allData.data
            //           .vehicleModels[model.indexOf(_selectedValue)].id;
            //       print(selectedVehicleModel);
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
                items: model,
                label: "Vehicle Model",
                onChanged: (_selectedValue) {
                  selectedVehicleModel = widget.allData.data
                      .vehicleModels[model.indexOf(_selectedValue)].id;
                  print(selectedVehicleModel);
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
              controller: vehicleNumberController,
              hintText: "Vehicle Number",
              isObscure: false,
              keyBoardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Container(
                width: double.infinity,
                height: 50.0,
                child: Text(
                    "By registration, you agree with our\n"
                    "Terms & Conditions",
                    style:
                        TextStyle(color: Colors.grey.shade600, fontSize: 16.0)),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            CustomButton(
              buttonColor: primaryColor,
              buttonText: "Register".toUpperCase(),
              onPress: () {
                signUpRider();
                print("Register button pressed");
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

  Future<Response> signUpRider() async {
    if (nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        newPassController.text.isNotEmpty &&
        confirmPassController.text.isNotEmpty &&
        numController.text.isNotEmpty &&
        selectedGender.isNotEmpty &&
        zipController.text.isNotEmpty &&
        addressController.text.isNotEmpty &&
        vehicleNumberController.text.isNotEmpty) {
      String url = "https://www.onmascota.thevistech.com/api/sign-up-rider";
      Map body = {
        'full_name': nameController.text,
        'email': emailController.text,
        'password': newPassController.text,
        'country_code': json.encode(selectedCountry),
        'number': numController.text,
        'experience': json.encode(selectedExperience),
        'gender': json.encode(selectedGender),
        'vehicle_type': json.encode(selectedVehicleType),
        'vehicle_model': json.encode(selectedVehicleModel),
        'vehicle_number': vehicleNumberController.text,
        'address': addressController.text,
        'location': json.encode(selectedLocation),
        'zip_code': zipController.text
      };
      var response = await http.post(Uri.parse(url), body: body);
      if (response.statusCode == 200) {
        print("Response coming......... 200");
        String body = response.body;
        var sigUpData = signUpRiderModelFromJson(body);
        if (sigUpData.error) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Invalid")));
          print(
              "Response has been printed but with error................... 200");
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Account created successfully")));
          Get.off(LoginScreen());
          SharedPreferences prefs= await SharedPreferences.getInstance();
          prefs.setString('name', nameController.text);
          print("Response has been printed................... 200");
        }
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Invalid")));
        print("Response is not coming..................." +
            response.statusCode.toString());
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("All Fields Must Be Filled")));
    }
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
    width: 100.0,
    height: 100.0,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(50.0)),
      image: DecorationImage(
        image: AssetImage("assets/images/Select Partner Icon.png"),
        fit: BoxFit.fill,
      ),
    ),
  );
}
//
// Container lowerPortion() {
//   return Container(
//     alignment: Alignment.topRight,
//     width: double.infinity,
//     height: double.infinity,
//     child: Row(
//       children: <Widget>[
//         // profieAvatar(),
//         // profileCard(),
//       ],
//     ),
//   );
//}

// Container profieAvatar() {
//   return Container(
//     width: 100.0,
//     height: 100.0,
//     child: Stack(
//       children: <Widget>[
//         Container(
//           margin: EdgeInsets.only(left: 10.0, top: 2.0),
//           width: 80.0,
//           height: 80.0,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.all(Radius.circular(40.0)),
//               color: Colors.grey.shade300),
//         ),
//         Container(
//           margin: EdgeInsets.only(left: 58.0, top: 59.0),
//           width: 25.0,
//           height: 25.0,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.all(Radius.circular(40.0)),
//             color: Colors.orangeAccent,
//           ),
//           child: Icon(
//             Icons.camera_alt,
//             size: 15.0,
//             color: Colors.white,
//           ),
//         ),
//       ],
//     ),
//   );
// }

// Container profileCard() {
//   return Container(
//     alignment: Alignment.topLeft,
//     width: 200.0,
//     height: 100.0,
//     decoration: BoxDecoration(),
//     child: Column(
//       children: [
//         SizedBox(
//           height: 5.0,
//         ),
//         Text("Upload Profile Image".toUpperCase(),
//             style: TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 16.0)),
//         SizedBox(
//           height: 3.0,
//         ),
//         Text(
//             "Please Upload an Image to be\n"
//             "recognize  by others",
//             style: TextStyle(
//                 color: Colors.grey.shade600,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 12.0)),
//       ],
//     ),
//   );
// }
