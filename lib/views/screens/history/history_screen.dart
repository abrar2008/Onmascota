import 'package:flutter/material.dart';
import 'package:onmascota/utils/constants.dart';


class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  int _selectedColor = -1;
  List<Map> _history = [
    {
      'historyImage': 'assets/icons/Order.png',
      'historyNumber': "0",
      'historyName': 'Orders',
    },
    {
      'historyImage': 'assets/icons/Earning.png',
      'historyNumber': "0",
      'historyName': 'Earnings',
    },
  ];

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
              GridView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: _history.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedColor = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Container(
                          width: sizeWidth(context) / 2.5,
                          decoration: BoxDecoration(
                            color: _selectedColor == index
                                ? primaryColor
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[200],
                                blurRadius: 2,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              Image.asset(
                                _history[index]['historyImage'],
                                color: _selectedColor == index
                                    ? Colors.white
                                    : primaryColor,
                                height: 50,
                                width: 50,
                              ),
                              Text(
                                _history[index]['historyNumber'].toUpperCase(),
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: _selectedColor == index
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              Container(
                                width: 150,
                                child: Text(
                                  _history[index]['historyName'],
                                  style: TextStyle(
                                    color: _selectedColor == index
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
              SizedBox(
                height: 85,
              ),
              avatarUpper(),
              SizedBox(
                height: 25.0,
              ),
              Text(
                "No History".toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                "History will appear after the customer",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                ),
              ),
              Text(
                "make any order with you",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                ),
              ),
              // FlatButton(
              //   onPressed: ()async {
              //     SharedPreferences prefs = await SharedPreferences.getInstance();
              //     prefs?.clear() ;
              //     Get.offAll(StartScreen());
              //   },
              //   child: Text(
              //     "Logout",
              //     style: TextStyle(color: Colors.red),
              //   ),
              // ),
            ],
          ),
        ),
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
        image: AssetImage("assets/images/Select Partner Icon.png"),
        fit: BoxFit.cover,
      ),
    ),
  );
}
