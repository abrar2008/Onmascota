import 'package:flutter/material.dart';
import 'package:onmascota/utils/constants.dart';
import 'package:onmascota/views/widgets/cutom_upperPortion.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: sizeWidth(context),
              height: 300.0,
              child: CusUpperPortion(
                title: "Privacy Policy",
                subtititle: "Read Privacy Policy",
              ),
            ),
            SizedBox(height: 25.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text("What Information you collect".toUpperCase(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0)),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "Lorem ipsum dolor sit amet consectetur. Urna nec tincidunt praesent semper feugiat nibh sed. Aliquam malesuada"
                        " bibendum arcu vitae elementum curabitur. Habitant morbi tristique senectus et. Vel pharetra vel turpis"
                        " nunc eget lorem dolor. Dictumst quisque sagittis purus sit amet volutpat consequat. Amet est placerat in"
                        " egestas erat. Natoque penatibus et magnis dis parturient montes nascetur. Morbi tristique senectus et"
                        " netus et malesuada fames ac turpis. Quis imperdiet massa tincidunt nunc pulvinar sapien et ligula. Duis"
                        " convallis convallis tellus id interdum velit laoreet id donec. Enim ut tellus elementum sagittis vitae et"
                        " leo duis ut. Ac placerat vestibulum lectus mauris ultrices.",
                    style: TextStyle(fontSize: 12.0),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "Amet commodo nulla facilisi nullam vehicula. Aliquam ultrices sagittis orci."
                        "faucibus scelerisque eleifend donec pretium.",
                    style: TextStyle(fontSize: 12.0),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "Amet commodo nulla facilisi nullam vehicula. Aliquam ultrices sagittis orci."
                        "faucibus scelerisque eleifend donec pretium.",
                    style: TextStyle(fontSize: 12.0),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "Amet commodo nulla facilisi nullam vehicula. Aliquam ultrices sagittis orci."
                        "faucibus scelerisque eleifend donec pretium.",
                    style: TextStyle(fontSize: 12.0),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "Amet commodo nulla facilisi nullam vehicula. Aliquam ultrices sagittis orci."
                        "faucibus scelerisque eleifend donec pretium.",
                    style: TextStyle(fontSize: 12.0),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "Amet commodo nulla facilisi nullam vehicula. Aliquam ultrices sagittis orci."
                        "faucibus scelerisque eleifend donec pretium.",
                    style: TextStyle(fontSize: 12.0),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "Lorem ipsum dolor sit amet consectetur. Urna nec tincidunt praesent semper feugiat nibh sed. Aliquam malesuada"
                        " bibendum arcu vitae elementum curabitur. Habitant morbi tristique senectus et. Vel pharetra vel turpis"
                        " nunc eget lorem dolor. Dictumst quisque sagittis purus sit amet volutpat consequat. Amet est placerat in"
                        " egestas erat. Natoque penatibus et magnis dis parturient montes nascetur. Morbi tristique senectus et"
                        " netus et malesuada fames ac turpis. Quis imperdiet massa tincidunt nunc pulvinar sapien et ligula. Duis"
                        " convallis convallis tellus id interdum velit laoreet id donec. Enim ut tellus elementum sagittis vitae et"
                        " leo duis ut. Ac placerat vestibulum lectus mauris ultrices.",
                    style: TextStyle(fontSize: 12.0),
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
