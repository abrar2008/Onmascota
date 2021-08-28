import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:onmascota/utils/constants.dart';
import 'package:onmascota/views/widgets/custom_button.dart';
import 'package:onmascota/views/widgets/custom_textfield.dart';

class PickUpDetailsScreen extends StatefulWidget {
  @override
  _DropOffDetailsScreenState createState() => _DropOffDetailsScreenState();
}

class _DropOffDetailsScreenState extends State<PickUpDetailsScreen> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Online",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          FlutterSwitch(
            width: 50.0,
            height: 25.0,
            toggleSize: 20.0,
            value: status,
            toggleColor: primaryColor,
            inactiveToggleColor: secondaryTextColor,
            inactiveColor: Colors.white,
            activeColor: Colors.white,
            onToggle: (value) {
              setState(() {
                status = value;
                print(status);
              });
            },
          ),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SizedBox(),
          ),
          Container(
            color: Colors.white,
            width: sizeWidth(context),
            height: sizeHeight(context) / 2.5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Pick up Details",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    "Address Details",
                    style: TextStyle(color: primaryColor),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  CustomTextFormField(
                      hintText: "Address",
                      isObscure: false,
                      keyBoardType: TextInputType.name),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    "Contact Details",
                    style: TextStyle(
                      color: primaryColor,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: sizeWidth(context) / 3,
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
                        child: TextFormField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1.0,
                                ),
                              ),
                              hintText: "JohnSmith",
                              hintStyle: TextStyle(
                                color: secondaryTextColor,
                              )),
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Container(
                        width: sizeWidth(context) / 2.3,
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
                        child: TextFormField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1.0,
                                ),
                              ),
                              hintText: "+123 456 7890",
                              hintStyle: TextStyle(
                                color: secondaryTextColor,
                              )),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomButton(
                      buttonText: "Continue",
                      buttonColor: primaryColor,
                      textColor: Colors.white,
                      onPress: () {
                        Navigator.pushNamed(context, 'SelectRider');
                      }),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
// Row(
// children: [
// Container(
// decoration: BoxDecoration(
// color: Colors.white,
// borderRadius: BorderRadius.circular(5),
// boxShadow: [
// BoxShadow(
// color: Colors.grey[200],
// blurRadius: 2,
// offset: const Offset(0, 5),
// ),
// ],
// ),
// width: sizeWidth(context) / 1.2,
// child: TextField(
// keyboardType: TextInputType.name,
// decoration: InputDecoration(
// enabledBorder: OutlineInputBorder(
// borderSide: BorderSide(
// color: Colors.white,
// width: 1.0,
// ),
// ),
// hintText: "John Smith",
// hintStyle: TextStyle(
// color: Colors.black,
// ),
// ),
// ),
// ),
// ],
// )
