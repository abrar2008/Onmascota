import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:onmascota/utils/constants.dart';

class MyOrdersScreen extends StatefulWidget {
  @override
  _MyOrdersScreenState createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context)),
        title: Text(
          "My Orders",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 35.0,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                        width: sizeWidth(context) / 2.5,
                        height: 50.0,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: primaryColor,
                          ),
                          child: Text(
                            "My ordrs".toUpperCase(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Container(
                        width: sizeWidth(context) / 2.5,
                        height: 50.0,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                          ),
                          child: Text(
                            "Past orders".toUpperCase(),
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 85,
                ),
                avatarUpper(),
                SizedBox(
                  height: 25.0,
                ),
                Text(
                  "No Orders".toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  "Orders will appear after the customer make",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                  ),
                ),
                Text(
                  "any purchase of your product",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Expanded(child: SizedBox()),
              Container(
                color: Colors.white,
                width: sizeWidth(context),
                height: 150.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: sizeWidth(context) / 1.9,
                      height: double.infinity,
                      alignment: Alignment.topLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Accepting Orders".toUpperCase(),
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "You are Offline and not accepting new orders",
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: sizeWidth(context) / 3,
                      height: double.infinity,
                      child: FlutterSwitch(
                        width: 100.0,
                        height: 55.0,
                        inactiveColor: Colors.grey.shade300,
                        activeColor: primaryColor,
                        valueFontSize: 25.0,
                        toggleSize: 45.0,
                        value: status,
                        borderRadius: 30.0,
                        padding: 8.0,
                        showOnOff: true,
                        onToggle: (val) {
                          setState(() {
                            status = val;
                          });
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

Container avatarUpper() {
  return Container(
    padding: EdgeInsets.only(top: 20.0),
    width: 120.0,
    height: 120.0,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(60.0)),
      image: DecorationImage(
        image: AssetImage("assets/images/profile_cover.png"),
        fit: BoxFit.cover,
      ),
    ),
  );
}
