import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onmascota/utils/constants.dart';
import 'package:onmascota/views/widgets/custom_button.dart';
import 'package:onmascota/views/widgets/custom_textfield.dart';

class CustomerSupportScreen extends StatefulWidget {
  @override
  _CustomerSupportScreenState createState() => _CustomerSupportScreenState();
}

class _CustomerSupportScreenState extends State<CustomerSupportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 250.0,
                  child: upperPortion(),
                ),
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Enter Your Name",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomTextFormField(
                      hintText: "",
                      isObscure: false,
                      keyBoardType: TextInputType.name,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Enter Your Phone Number",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomTextFormField(
                      hintText: "",
                      isObscure: false,
                      keyBoardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Enter Your Email",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomTextFormField(
                      hintText: "",
                      isObscure: false,
                      keyBoardType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Enter Subject",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomTextFormField(
                      hintText: "",
                      isObscure: false,
                      keyBoardType: TextInputType.name,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Enter Message",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 200.0,
                      decoration:
                          BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                          color: Colors.grey[200],
                          blurRadius: 2.0,
                          offset: const Offset(0, 5),
                        )
                      ]),
                      margin: EdgeInsets.symmetric(horizontal: 28.0),
                      child: TextFormField(
                        minLines: 10,
                        maxLines: 10,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomButton(
                      buttonColor: primaryColor,
                      buttonText: "Submit".toUpperCase(),
                      onPress: () {
                        // Navigator.pushNamed(context, 'LoginScreen');
                      },
                      textColor: Colors.white,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    // Text(
                    //   "Write Us Your Queries".toUpperCase(),
                    //   style: TextStyle(
                    //       color: Colors.black,
                    //       fontSize: 22.0),
                    // ),
                    // Text(
                    //   "Your words means a lot to us".toUpperCase(),
                    //   style: TextStyle(
                    //       color: Colors.black,
                    //       fontSize: 12.0),
                    // ),
                  ],
                )
              ],
            ),
            Positioned(
                top: 50,
                left: 20,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 28,
                    color: Colors.white,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

Container upperPortion() {
  return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [bodyUpper(), avatarUpper()],
      ));
}

Container bodyUpper() {
  return Container(
    margin: EdgeInsets.only(bottom: 40.0),
    width: double.infinity,
    height: double.infinity,
    decoration: BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage("assets/images/Create Partner Page Background.png"),
      ),
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Support".toUpperCase(),
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 32.0),
          ),
          Text(
            "What Is Your Queries",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24.0),
          ),
        ],
      ),
    ),
  );
}

Container avatarUpper() {
  return Container(
    padding: EdgeInsets.only(top: 20.0),
    width: 90.0,
    height: 90.0,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(50.0)),
      image: DecorationImage(
        image: AssetImage("assets/images/Select Partner Icon.png"),
        fit: BoxFit.cover,
      ),
    ),
  );
}
