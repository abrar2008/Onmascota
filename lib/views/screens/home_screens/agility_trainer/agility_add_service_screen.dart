import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:onmascota/utils/constants.dart';
import 'package:onmascota/views/widgets/custom_button.dart';
import 'package:onmascota/views/widgets/custom_textfield.dart';

class AgilityTrainerAddService extends StatefulWidget {
  @override
  _AgilityTrainerAddServiceState createState() =>
      _AgilityTrainerAddServiceState();
}

class _AgilityTrainerAddServiceState extends State<AgilityTrainerAddService> {
  bool boldPressed = false;
  bool italicPressed = false;
  bool underlinePressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 35.0,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Service Name *",
                  style: TextStyle(
                    color: primaryColor,
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              CustomTextFormField(
                hintText: "",
                isObscure: false,
                keyBoardType: TextInputType.name,
              ),
              SizedBox(
                height: 20.0,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Category*",
                  style: TextStyle(
                    color: primaryColor,
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
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
                child: DropdownSearch<String>(
                  dropdownSearchDecoration:
                      InputDecoration(border: InputBorder.none),
                  mode: Mode.MENU,
                  showSelectedItem: true,
                  items: ["C1", "C2", "C3"],
                  hint: "Please Select",
                  popupItemDisabled: (String s) => s.startsWith('I'),
                  onChanged: print,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Related Pets*",
                  style: TextStyle(
                    color: primaryColor,
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
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
                child: DropdownSearch<String>(
                  dropdownSearchDecoration:
                      InputDecoration(border: InputBorder.none),
                  mode: Mode.MENU,
                  showSelectedItem: true,
                  items: ["R1", "R2", "R3"],
                  hint: "Please Select",
                  popupItemDisabled: (String s) => s.startsWith('I'),
                  onChanged: print,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Description*",
                  style: TextStyle(
                    color: primaryColor,
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Container(
                width: double.infinity,
                height: 150.0,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    color: Colors.grey[200],
                    blurRadius: 2.0,
                    offset: const Offset(0, 5),
                  )
                ]),
                child: TextFormField(
                  maxLines: null,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: "Write Your Services Description",
                    hintStyle: TextStyle(color: Colors.grey),
                    fillColor: Colors.white,
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              CustomButton(
                buttonText: "Add Services".toUpperCase(),
                buttonColor: primaryColor,
                textColor: Colors.white,
                onPress: () {},
              ),
              SizedBox(
                height: 15.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
