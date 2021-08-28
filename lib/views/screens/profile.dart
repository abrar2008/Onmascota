import 'package:flutter/material.dart';
import 'package:onmascota/utils/constants.dart';
import 'package:onmascota/views/widgets/cutom_upperPortion.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   // leading: IconButton(
      //   //   icon: Icon(Icons.list, color: Colors.white),
      //   //   onPressed: () => Navigator.of(context).pop(),
      //   // ),
      //   title: Text(
      //     "My Profile",
      //     style: TextStyle(color: Colors.white),
      //   ),
      //   centerTitle: true,
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 250.0,
              child: CusUpperPortion(
                title: "",
                subtititle: "",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Text(
                      "TestPetShop".toUpperCase(),
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Text(
                      "329, Lintang Surgai Aro 9, Kampang",
                      style: TextStyle(color: Colors.grey, fontSize: 14.0),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Durat, 19900, Bayaan Lepas, Purau Pinang,",
                      style: TextStyle(color: Colors.grey, fontSize: 14.0),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Malaysia",
                      style: TextStyle(color: Colors.grey, fontSize: 14.0),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Row(
                    children: [
                      Text(
                        "About".toUpperCase(),
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  GetTextField(hintText: "Pet Test Shop"),
                  SizedBox(
                    height: 15,
                  ),
                  GetTextField(hintText: "5+ Year Experience"),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text(
                        "Description".toUpperCase(),
                        style: TextStyle(color: Colors.black, fontSize: 16.0),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: double.infinity,
                    height: 200.0,
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
                      minLines: 10,
                      maxLines: 10,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: "",
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
                    height: 95,
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
                      width: sizeWidth(context),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              width: 45.0,
                              height: 45.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Colors.green),
                              child: Icon(
                                Icons.call,
                                color: Colors.white,
                              ),
                            ),
                            GetTextField1(
                              hintText: "+123 456 7890",
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: 95,
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
                      width: sizeWidth(context),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              width: 45.0,
                              height: 45.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: primaryColor),
                              child: Icon(
                                Icons.mail,
                                color: Colors.white,
                              ),
                            ),
                            GetTextField1(
                              hintText: "info@yourgmail.com",
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: 95,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
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
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(5),
      ),
      width: sizeWidth(context) / 1.1,
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

class GetTextField1 extends StatelessWidget {
  final String hintText;

  const GetTextField1({
    Key key,
    @required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(5),
      ),
      width: sizeWidth(context) / 1.5,
      child: TextFormField(
        enabled: false,
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
