import 'package:flutter/material.dart';
import 'package:onmascota/utils/constants.dart';

class MyProducts extends StatefulWidget {
  @override
  _MyProductsState createState() => _MyProductsState();
}

class _MyProductsState extends State<MyProducts> {
  List<Map> _myProducts = [
    {
      "image": "assets/images/test1.jpg",
      "status": "Being Reviewed",
      "productName": "Pro Plane",
      "price": "Rm 13.36"
    },
    {
      "image": "assets/images/test1.jpg",
      "status": "Active",
      "productName": "Fido Dog Shampoo",
      "price": "Rm 33.34"
    },
    {
      "image": "assets/images/test2.jpg",
      "status": "Being Reviewed",
      "productName": "Pro Plane",
      "price": "Rm 03.33"
    },
    {
      "image": "assets/images/test1.jpg",
      "status": "Active",
      "productName": "Product Name 3",
      "price": "Rm 60.00"
    },
    {
      "image": "assets/images/test2.jpg",
      "status": "Being Reviewed",
      "productName": "I am Product",
      "price": "Rm 13.36"
    },
  ];
  @override
  Widget build(BuildContext context) {
    // final double itemHeight = (sizeHeight(context) - kToolbarHeight - 24) / 2;
    // final double itemWidth = sizeWidth(context) / 2;
    return Scaffold(
      // appBar: PreferredSize(
      //     preferredSize:
      //         Size(AppBar().preferredSize.width, AppBar().preferredSize.height),
      //     child: CusAppBar(
      //       withIcons: false,
      //       title: "My Products(${_myProducts.length})",
      //     )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
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
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: GridView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: _myProducts.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: sizeWidth(context) /
                        (sizeHeight(context) * resizeFactor(context) / 1.7),
                    crossAxisCount: 2,
                  ),
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
                                  height: sizeHeight(context) / 6,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                    child: Image.asset(
                                      _myProducts[index]['image'],
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                              SizedBox(
                                height: 3,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: _myProducts[index]
                                                        ["status"] ==
                                                    "Being Reviewed"
                                                ? primaryColor
                                                : (_myProducts[index]
                                                            ["status"] ==
                                                        "Active"
                                                    ? Colors.green
                                                    : Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Text(
                                              _myProducts[index]["status"],
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 8),
                                            )),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(_myProducts[index]["productName"]
                                        .toUpperCase()),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      _myProducts[index]["price"],
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
