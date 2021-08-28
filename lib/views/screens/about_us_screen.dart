import 'package:flutter/material.dart';
import 'package:onmascota/views/widgets/cutom_upperPortion.dart';

class AboutUs extends StatelessWidget {
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
                  height: 300.0,
                  child: CusUpperPortion(
                    title: "About Us",
                    subtititle: "Onmascota is found and made in Malaysia",
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
                          Text("About US".toUpperCase(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24.0)),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore"
                        " magna aliqua.",
                        style: TextStyle(fontSize: 12.0),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "Fusce id velit ut tortor. Sit amet purus gravida quis blandit turpis cursus. Lectus magna fringilla urna "
                        "porttitor rhoncus dolor. Varius quam quisque. Lid diam vel quam elementum pulvinar etiam. Fusce ut placerat"
                        " orci nulla pellentesque dignissim enim sit amet. commodo nulla facilisi nullam vehicula. In nulla posuere "
                        "sollicitudin aliquam ultrices sagittis orci.",
                        style: TextStyle(fontSize: 12.0),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "Amet commodo nulla facilisi nullam vehicula. In nulla posuere sollicitudin aliquam ultrices sagittis orci."
                        " Scelerisque eleifend donec pretium vulputate sapien nec sagittis. Leo vel orci porta non. Phasellus "
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
                      SizedBox(height: 10.0),
                      Text(
                        "Aenean vel elit scelerisque mauris pellentesque. Nulla facilisi cras fermentum odio eu feugiat pretium nibh "
                        "ipsum. Non curabitur gravida arcu ac. Rutrum tellus pellentesque eu tincidunt. Nunc sed velit dignissim "
                        "sodales ut eu sem. Pellentesque eu tincidunt tortor aliquam nulla. Amet aliquam id diam maecenas ultricies "
                        "mi eget mauris. Dignissim diam quis enim lobortis. Sed risus ultricies tristique nulla aliquet enim tortor."
                        " Suspendisse sed nisi lacus sed viverra tellus in",
                        style: TextStyle(fontSize: 12.0),
                      ),
                      SizedBox(height: 10.0),
                    ],
                  ),
                ),
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
