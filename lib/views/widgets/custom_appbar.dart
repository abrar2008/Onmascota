import 'package:flutter/material.dart';
import 'package:onmascota/utils/constants.dart';

class CusAppBar extends StatelessWidget {
  final String title;
  final bool withIcons;
  CusAppBar({@required this.title, @required this.withIcons, Key key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      brightness: Brightness.dark,
      backgroundColor: primaryColor,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      actions: withIcons
          ? [
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'DropOffDetails');
                  },
                  child: Icon(Icons.location_on_outlined)),
              SizedBox(
                width: 8,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'Notification');
                  },
                  child: Icon(Icons.notifications_on_outlined)),
              SizedBox(
                width: 12,
              )
            ]
          : null,
    );
  }
}
