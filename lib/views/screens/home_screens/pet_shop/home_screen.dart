import 'package:flutter/material.dart';
import 'package:onmascota/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedColor = 0;
  List<Map> _productDetails = [
    {
      "image": "assets/images/test1.jpg",
      "status": "Being Reviewed",
      "productName": "Pro Plane",
      "price": "RM 13.36"
    },
    {
      "image": "assets/images/test1.jpg",
      "status": "Active",
      "productName": "Fido Dog Shampoo",
      "price": "RM 33.34"
    },
    {
      "image": "assets/images/test2.jpg",
      "status": "Being Reviewed",
      "productName": "Pro Plane",
      "price": "RM 03.33"
    },
    {
      "image": "assets/images/test1.jpg",
      "status": "Active",
      "productName": "Product Name 3",
      "price": "RM 60.00"
    },
    {
      "image": "assets/images/test2.jpg",
      "status": "Being Reviewed",
      "productName": "I am Product",
      "price": "RM 13.36"
    },
  ];
  List<Map> _homeData = [
    {
      'icon': 'assets/icons/home/Earnings.png',
      'count': "50%",
      'Text': "Earnings",
    },
    {
      'icon': 'assets/icons/home/New Products.png',
      'count': "05",
      'Text': "New Products",
    },
    {
      'icon': 'assets/icons/home/Sell Products.png',
      'count': "20",
      'Text': "Sell Products",
    },
    {
      'icon': 'assets/icons/home/Total Products.png',
      'count': "07",
      'Text': "Total Products",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Search Products!".toUpperCase(),
                    style: heading1,
                  ),
                ),
                SizedBox(
                  height: 3,
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
                  width: sizeWidth(context) / 1.1,
                  child: TextFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                      suffixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      hintText: "Search",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GridView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: _homeData.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 20,
                    ),
                    itemBuilder: (context, index) {
                      return Padding(
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
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              Image.asset(
                                _homeData[index]['icon'],
                                color: _selectedColor == index
                                    ? Colors.white
                                    : primaryColor,
                                height: 50,
                                width: 50,
                              ),
                              Text(
                                _homeData[index]["count"],
                                style: TextStyle(
                                    color: _selectedColor == index
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                _homeData[index]['Text'],
                                style: TextStyle(
                                  fontSize: 16,
                                  color: _selectedColor == index
                                      ? Colors.white
                                      : Colors.grey,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Latest Products!".toUpperCase(),
                    style: heading1,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          //Latest products listview builder in horizontal view
          Container(
            height: 200,
            width: sizeWidth(context),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _productDetails.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    width: 180,
                    child: Card(
                      elevation: 2,
                      shadowColor: Colors.grey[100],
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Container(
                              height: 100,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                child: Image.asset(
                                  _productDetails[index]['image'],
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              )),
                          SizedBox(
                            height: 3,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: _productDetails[index]
                                                    ["status"] ==
                                                "Being Reviewed"
                                            ? primaryColor
                                            : (_productDetails[index]
                                                        ["status"] ==
                                                    "Active"
                                                ? Colors.green
                                                : Colors.white),
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Text(
                                          _productDetails[index]["status"],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(_productDetails[index]["productName"]
                                    .toUpperCase()),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  _productDetails[index]["price"],
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}
