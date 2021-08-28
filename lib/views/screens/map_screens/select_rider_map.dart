import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:onmascota/utils/constants.dart';
import 'package:onmascota/views/widgets/custom_button.dart';

class SelectRiderMap extends StatefulWidget {
  @override
  _DropOffDetailsScreenState createState() => _DropOffDetailsScreenState();
}

class _DropOffDetailsScreenState extends State<SelectRiderMap> {
  int _radioValue = 0;
  int _paymentRadioValue = 0;

  void _handlePaymentRadioValueChange(int value) {
    setState(() {
      _paymentRadioValue = value;

      switch (_radioValue) {
        case 0:
          break;
        case 1:
          break;
      }
    });
  }

  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context)),
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
            height: sizeHeight(context) / 4.5,
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
                    "Vehicle Type".toUpperCase(),
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: <Widget>[
                      Radio(
                        activeColor: primaryColor,
                        value: 0,
                        groupValue: _paymentRadioValue,
                        onChanged: _handlePaymentRadioValueChange,
                      ),
                      Icon(
                        Icons.directions_car,
                        color: _paymentRadioValue == 0
                            ? primaryColor
                            : primaryColor.withOpacity(0.5),
                      ),
                      Text("CAR"),
                      Radio(
                        activeColor: primaryColor,
                        value: 1,
                        groupValue: _paymentRadioValue,
                        onChanged: _handlePaymentRadioValueChange,
                      ),
                      Icon(Icons.pedal_bike_outlined,
                          color: _paymentRadioValue == 1
                              ? primaryColor
                              : primaryColor.withOpacity(0.5)),
                      Text("BIKE"),
                      Radio(
                        activeColor: primaryColor,
                        value: 2,
                        groupValue: _paymentRadioValue,
                        onChanged: _handlePaymentRadioValueChange,
                      ),
                      Icon(Icons.local_shipping_sharp,
                          color: _paymentRadioValue == 2
                              ? primaryColor
                              : primaryColor.withOpacity(0.5)),
                      Text("VAN"),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  CustomButton(
                    buttonText: "Continue",
                    buttonColor: primaryColor,
                    textColor: Colors.white,
                    onPress: () {},
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
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
