import 'package:flutter/material.dart';
import 'package:onmascota/utils/constants.dart';

class AgilityTrainerService extends StatefulWidget {
  @override
  _AgilityTrainerServiceState createState() => _AgilityTrainerServiceState();
}

class _AgilityTrainerServiceState extends State<AgilityTrainerService> {
  List<Map> _productDetails = [
    {
      "image": "assets/images/Agility Trainer/Farwad Running.png",
      "status": "Being Reviewed",
      "productName": "forward running ",
      "type": "horse",
      "price": "RM 13.36"
    },
    {
      "image": "assets/images/Agility Trainer/Leteral Plyometric Jumps.png",
      "status": "Active",
      "productName": "leteral polymetric",
      "type": "Cat",
      "price": "RM 33.34"
    },
    {
      "image": "assets/images/Agility Trainer/Boarding.png",
      "status": "Being Reviewed",
      "productName": "Boarding",
      "type": "dog",
      "price": "RM 03.33"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "my services",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: _productDetails.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(9),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[200],
                            blurRadius: 2,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              _productDetails[index]['image'],
                              width: 100,
                              height: 100,
                            ),
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: _productDetails[index]["status"] ==
                                            "Being Reviewed"
                                        ? primaryColor
                                        : (_productDetails[index]["status"] ==
                                                "Active"
                                            ? Colors.green
                                            : Colors.white),
                                    borderRadius: BorderRadius.circular(4)),
                                child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Text(
                                      _productDetails[index]["status"],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 8),
                                    )),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                _productDetails[index]["productName"],
                                style: TextStyle(fontSize: 16),
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: sizeWidth(context) / 1.7,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Text(
                                        _productDetails[index]['type'],
                                        style: TextStyle(
                                            color: secondaryTextColor),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        _productDetails[index]['price'],
                                        style: TextStyle(),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
