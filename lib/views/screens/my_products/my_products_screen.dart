import 'package:flutter/material.dart';

import 'package:onmascota/utils/constants.dart';

class MyProductScreen extends StatefulWidget {
  @override
  _MyProductScreenState createState() => _MyProductScreenState();
}

class _MyProductScreenState extends State<MyProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.list, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "My Products(0)",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 35.0,
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
                height: 85,
              ),
              avatarUpper(),
              SizedBox(
                height: 25.0,
              ),
              Text(
                "No Products!".toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                "Products will appear after you",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                ),
              ),
              Text(
                "upload products",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Increment',
          child: Icon(
            Icons.add_circle_outline,
            size: 33.0,
          ),
          backgroundColor: primaryColor),
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
