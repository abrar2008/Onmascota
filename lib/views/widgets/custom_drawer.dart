import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onmascota/utils/constants.dart';
import 'package:onmascota/views/screens/my_orders_screen.dart';
import 'package:onmascota/views/screens/navigation_screen.dart';
import 'package:onmascota/views/screens/notification_screen.dart';
import 'package:onmascota/views/screens/setting_screen.dart';
import 'package:onmascota/views/screens/start_screen.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDrawer extends StatefulWidget {
  final String strName;

  const CustomDrawer({Key key, this.strName}) : super(key: key);


  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {


  void share(BuildContext context) {
    final RenderBox box = context.findRenderObject();
    final text = "Hey, Check out onmascota the pet animal shop!";
    Share.share(text,
        subject: 'onmascota',
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }

  List<String> _svgAssets = <String>[
    // 'assets/notfound.svg', // uncomment to test an asset that doesn't exist.
    'assets/icons/Menu Bar/My Order.svg',
    'assets/icons/Menu Bar/My Product.svg',
    'assets/icons/Menu Bar/History.svg',
    'assets/icons/Menu Bar/User.svg',
    'assets/icons/Menu Bar/Notification.svg',
    'assets/icons/Menu Bar/Share.svg',
    'assets/icons/Menu Bar/Setting.svg',
    'assets/icons/Menu Bar/Logout.svg',
  ];

  List<Map> _drawerData = [
    {
      'icon': 'assets/icons/Menu Bar/My Order.svg',
      'iconText': "My Orders",
      'route': MyOrdersScreen(),
    },
    {
      'icon': 'assets/icons/Menu Bar/My Product.svg',
      'iconText': "My Products",
      'route': "MyProducts",
      "isTab": "true",
      "index": 1,
    },
    {
      'icon': 'assets/icons/Menu Bar/History.svg',
      'iconText': "History",
      'route': "History",
      "isTab": "true",
      "index": 3,
    },
    {
      'icon': 'assets/icons/Menu Bar/User.svg',
      'iconText': "My profile",
      'route': "MyProfile",
      "isTab": "true",
      "index": 4,
    },
    {
      'icon': 'assets/icons/Menu Bar/Notification.svg',
      'iconText': "Notification",
      'route': NotificationScreen(),
    },
    {
      'icon': 'assets/icons/Menu Bar/Share.svg',
      'iconText': "Share App",
      'route': "",
      'isShare': "yes",
    },
    {
      'icon': 'assets/icons/Menu Bar/Setting.svg',
      'iconText': "Setting",
      'route': SettingScreen(),
    },
    {
      'id': 1,
      'icon': 'assets/icons/Menu Bar/Logout.svg',
      'iconText': "Logout",
      'route': StartScreen(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: SizedBox(
        width: sizeWidth(context) / 1.4,
        child: Drawer(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 230,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 40.0),
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                              "assets/images/Create Partner Page Background.png"),
                        ),
                      ),
                    ),
                    avatarUpper()
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                widget.strName ?? "",
                style: heading1,
              ),
              SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.popAndPushNamed(context, "RatingAndReviews");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      color: primaryColor,
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text("Reviews 0.0"),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Divider(),
              Container(
                height: sizeHeight(context) / 1.8,
                child: ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: _drawerData.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () async {
                          if (_drawerData[index]['isTab'] == "true") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NavigationScreen(
                                        initialChangeIndex: _drawerData[index]
                                            ["index"],
                                      )),
                            );
                          } else {
                            if (_drawerData[index]['isShare'] == 'yes') {
                              Share.share('check out our app onmascota.');
                            } else {
                              if (_drawerData[index]["id"] == 1) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          _drawerData[index]["route"]),
                                );
                                SharedPreferences prefs = await SharedPreferences.getInstance();
                                prefs?.clear() ;
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          _drawerData[index]["route"]),
                                );
                              }
                            }
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8,0,16,8),
                                child: Container(
                                  child: SvgPicture.asset(
                                    _svgAssets[index],
                                    color: primaryColor,
                                    height: 20,
                                    width: 20,
                                  ),
                                ),
                              ),
                              Text(
                                _drawerData[index]["iconText"].toUpperCase(),
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
