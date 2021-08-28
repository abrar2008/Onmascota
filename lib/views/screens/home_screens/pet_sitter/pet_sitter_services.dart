import 'package:flutter/material.dart';
import 'package:onmascota/utils/constants.dart';

class PetSitterServices extends StatefulWidget {
  @override
  _PetSitterServicesState createState() => _PetSitterServicesState();
}

class _PetSitterServicesState extends State<PetSitterServices> {
  List<Map> _productDetails = [
    {
      "image": "assets/images/Pet Sitter/Dog Walking.png",
      "status": "Being Reviewed",
      "productName": "dog walking",
      "type": "rate",
      "price": "RM 13.36"
    },
    {
      "image": "assets/images/Pet Sitter/Pet Taxi.png",
      "status": "Active",
      "productName": "pet taxi",
      "type": "rate",
      "price": "RM 33.34"
    },
    {
      "image": "assets/images/Pet Sitter/Drop In Visit.png",
      "status": "Being Reviewed",
      "productName": "drop in visits",
      "type": "rate",
      "price": "RM 03.33"
    },
    {
      "image": "assets/images/Pet Sitter/Overnight Setting.png",
      "status": "Active",
      "productName": "overnight sitting",
      "type": "rate",
      "price": "RM 60.00"
    },
    {
      "image": "assets/images/Pet Sitter/Overnight Board.png",
      "status": "Being Reviewed",
      "productName": "Overnight Board",
      "type": "rate",
      "price": "RM 13.36"
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
