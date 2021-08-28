import 'package:flutter/material.dart';

class CusUpperPortion extends StatelessWidget {
  final String title;
  final String subtititle;

  CusUpperPortion({
    @required this.title,
    @required this.subtititle,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [bodyUpper(title,subtititle), avatarUpper()],
        ));
  }
}

Container bodyUpper(String title, String subtitle) {
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
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title.toUpperCase(),
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 32.0)),
                    Text(subtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0)),
          ],
        ),
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
