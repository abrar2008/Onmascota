import 'package:flutter/material.dart';
import 'package:onmascota/utils/constants.dart';
import 'package:onmascota/views/widgets/custom_button.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context)),
        title: Text(
          "Edit Profile",
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
                width: double.infinity,
                height: 100.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Edit Account",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "You Can Edit Your Profile Here",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 100.0,
                child: lowerPortion(),
              ),
              SizedBox(
                height: 15.0,
              ),
              Column(
                children: <Widget>[
                  Row(
                    children: [
                      Text(
                        "Full name",
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  GetTextField(hintText: "Pet Test Shop"),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      Text(
                        "Address Line 1",
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  GetTextField(
                      hintText: "329, Lintang Sungai Ara 9, Kampung Darat"),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      Text(
                        "Address Line 2",
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  GetTextField(
                      hintText: "11900 Bayan Lepas, Pulau Pinang, Malaysia"),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      Text(
                        "Description",
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: double.infinity,
                    height: 110.0,
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        color: Colors.grey[200],
                        blurRadius: 2.0,
                        offset: const Offset(0, 5),
                      )
                    ]),
                    child: TextFormField(
                      enabled: false,
                      style: TextStyle(color: Colors.grey),
                      minLines: 4,
                      maxLines: 10,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText:
                            "Lorem ipsum dolor sit armet, consectetur adipiscing elit,sed do euismod tempor",
                        hintStyle: TextStyle(color: Colors.black),
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
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      Text(
                        "Experience",
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  GetTextField(hintText: "5+ Year Experience"),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      Text(
                        "Email",
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    enabled: false,
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade300,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                      hintText: "info@yourgmail.com",
                      hintStyle: TextStyle(
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      Text(
                        "Phone Number",
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  GetTextField(hintText: "+123 456 7890"),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      Text(
                        "Gender",
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  GetTextField(hintText: "Male"),
                  SizedBox(
                    height: 15.0,
                  ),
                  CustomButton(
                    buttonText: "Update".toUpperCase(),
                    buttonColor: primaryColor,
                    textColor: Colors.white,
                    onPress: () {},
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Container lowerPortion() {
  return Container(
    alignment: Alignment.topRight,
    width: double.infinity,
    height: double.infinity,
    child: Row(
      children: <Widget>[
        profieAvatar(),
        profileCard(),
      ],
    ),
  );
}

Container profieAvatar() {
  return Container(
    width: 100.0,
    height: 100.0,
    child: Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 10.0, top: 2.0),
          width: 80.0,
          height: 80.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40.0)),
              color: Colors.grey.shade300),
        ),
        Container(
          margin: EdgeInsets.only(left: 60.0, top: 62.0),
          width: 30.0,
          height: 30.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(40.0)),
            color: Colors.orangeAccent,
          ),
          child: Icon(
            Icons.camera_alt,
            size: 15.0,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}

Container profileCard() {
  return Container(
    alignment: Alignment.topLeft,
    width: 200.0,
    height: 100.0,
    decoration: BoxDecoration(),
    child: Column(
      children: [
        SizedBox(
          height: 5.0,
        ),
        Text("Upload Profile Image".toUpperCase(),
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16.0)),
        SizedBox(
          height: 3.0,
        ),
        Text(
            "Please Upload an Image to be\n"
            "recognize  by others",
            style: TextStyle(
                color: Colors.grey.shade600,
                fontWeight: FontWeight.bold,
                fontSize: 12.0)),
      ],
    ),
  );
}

class GetTextField extends StatelessWidget {
  final String hintText;

  const GetTextField({
    Key key,
    @required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      width: sizeWidth(context) / 1.2,
      child: TextFormField(
        enabled: false,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 1.0,
            ),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
