import 'package:flutter/material.dart';
import 'package:onmascota/utils/constants.dart';
import 'package:onmascota/views/widgets/custom_button.dart';
import 'package:onmascota/views/widgets/custom_textfield.dart';

class AddPetSitterService extends StatefulWidget {
  @override
  _AddPetSitterServiceState createState() => _AddPetSitterServiceState();
}

class _AddPetSitterServiceState extends State<AddPetSitterService> {
  int _selectedColor = -1;
  List<Map> _productDetails = [
    {
      "icon": "assets/images/Pet Sitter/Dog Walking.png",
      "productName": "dog walking",
    },
    {
      "icon": "assets/images/Pet Sitter/Pet Taxi.png",
      "productName": "pet taxi",
    },
    {
      "icon": "assets/images/Pet Sitter/Drop In Visit.png",
      "productName": "drop in visits",
    },
    {
      "icon": "assets/images/Pet Sitter/Overnight Setting.png",
      "productName": "overnight sitting",
    },
    {
      "icon": "assets/images/Pet Sitter/Overnight Board.png",
      "productName": "Overnight Board",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Container(
            alignment: Alignment.topLeft,
            width: sizeWidth(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  "Select Service Type".toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 140,
                  width: sizeWidth(context),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _productDetails.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedColor = index;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            width: 150,
                            child: Card(
                              elevation: 2,
                              shadowColor: Colors.grey[100],
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
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
                                  children: [
                                    Container(
                                        height: 100,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                          ),
                                          child: Image.asset(
                                            _productDetails[index]['icon'],
                                            color: _selectedColor == index
                                                ? Colors.white
                                                : primaryColor,
                                            width: double.infinity,
                                          ),
                                        )),
                                    Text(
                                      _productDetails[index]["productName"]
                                          .toUpperCase(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: _selectedColor == index
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: sizeWidth(context) / 1.6,
                  child: Text(
                    "I offer day walking services to pet owners".toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Rate".toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                    color: Colors.orange,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                CustomTextFormField(
                  hintText: "Per Day / Pet",
                  isObscure: false,
                  keyBoardType: TextInputType.name,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Maximum Number of Pets Allowed".toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                    color: Colors.orange,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                CustomTextFormField(
                  hintText: "2",
                  isObscure: false,
                  keyBoardType: TextInputType.name,
                ),
                SizedBox(
                  height: 30.0,
                ),
                CustomButton(
                  buttonText: "Add Services".toUpperCase(),
                  buttonColor: primaryColor,
                  textColor: Colors.white,
                  onPress: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
