import 'package:flutter/material.dart';
import 'package:onmascota/utils/constants.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<Map> _notification = [
    {
      'notificationImage': 'assets/icons/select_partner/Pet Shop.png',
      'notificationTitle': "Product Discount 10% off",
      'notificationSubtitle': 'Sell Your Products to Pet Lovers',
      'notificationDay': 'Today',
      'notificationTime': '12:30pm',
    },
    {
      'notificationImage': 'assets/icons/select_partner/Sitter.png',
      'notificationTitle': "Product Discount 10% offp",
      'notificationSubtitle': 'Sell Your Products to Pet Lovers',
      'notificationDay': 'Today',
      'notificationTime': '12:30pm',
    },
    {
      'notificationImage': 'assets/icons/select_partner/Vets Clinic.png',
      'notificationTitle': "Product Discount 10% off",
      'notificationSubtitle': 'Sell Your Products to Pet Lovers',
      'notificationDay': 'Today',
      'notificationTime': '12:30pm',
    },
    {
      'notificationImage': 'assets/icons/select_partner/Groomer.png',
      'notificationTitle': "Product Discount 10% off",
      'notificationSubtitle': 'Sell Your Products to Pet Lovers',
      'notificationDay': 'Today',
      'notificationTime': '12:30pm',
    },
    {
      'notificationImage': 'assets/icons/select_partner/Aglity Trainer.png',
      'notificationTitle': "Product Discount 10% off",
      'notificationSubtitle': 'Sell Your Products to Pet Lovers',
      'notificationDay': 'Today',
      'notificationTime': '12:30pm',
    },
    {
      'notificationImage': 'assets/icons/select_partner/Govertment.png',
      'notificationTitle': "Product Discount 10% off",
      'notificationSubtitle': 'Sell Your Products to Pet Lovers',
      'notificationDay': 'Today',
      'notificationTime': '12:30pm',
    },
    {
      'notificationImage': 'assets/icons/select_partner/Pet Shop.png',
      'notificationTitle': "Product Discount 10% off",
      'notificationSubtitle': 'Sell Your Products to Pet Lovers',
      'notificationDay': 'Today',
      'notificationTime': '12:30pm',
    },
    {
      'notificationImage': 'assets/icons/select_partner/Sitter.png',
      'notificationTitle': "Product Discount 10% offp",
      'notificationSubtitle': 'Sell Your Products to Pet Lovers',
      'notificationDay': 'Today',
      'notificationTime': '12:30pm',
    },
    {
      'notificationImage': 'assets/icons/select_partner/Vets Clinic.png',
      'notificationTitle': "Product Discount 10% off",
      'notificationSubtitle': 'Sell Your Products to Pet a a Lovers',
      'notificationDay': 'Today',
      'notificationTime': '12:30pm',
    },
    {
      'notificationImage': 'assets/icons/select_partner/Groomer.png',
      'notificationTitle': "Product Discount 10% off",
      'notificationSubtitle': 'Sell Your Products to Pet Lovers',
      'notificationDay': 'Today',
      'notificationTime': '12:30pm',
    },
    {
      'notificationImage': 'assets/icons/select_partner/Aglity Trainer.png',
      'notificationTitle': "Product Discount 10% off",
      'notificationSubtitle': 'Sell Your Products to Pet Lovers',
      'notificationDay': 'Today',
      'notificationTime': '12:30pm',
    },
    {
      'notificationImage': 'assets/icons/select_partner/Govertment.png',
      'notificationTitle': "Product Discount 10% off",
      'notificationSubtitle': 'Sell Your Products to Pet a Lovers',
      'notificationDay': 'Today',
      'notificationTime': '12:30pm',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context)),
        title: Text(
          "Notification",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: _notification.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[200],
                              blurRadius: 2,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex:3,
                              child: Image.asset(
                                _notification[index]['notificationImage'],
                                color: primaryColor,
                                width: sizeWidth(context) / 4,
                              ),
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            Expanded(
                              flex: 7,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _notification[index]['notificationTitle']
                                        .toUpperCase(),
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Container(
                                    width: sizeWidth(context) / 1.5,
                                    child: Text(
                                      _notification[index]
                                          ['notificationSubtitle'],
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text(
                                          _notification[index]['notificationDay'],
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                      SizedBox(width: 5.0),
                                      Container(
                                        child: Text(
                                          _notification[index]
                                              ['notificationTime'],
                                          style: TextStyle(
                                            color: primaryColor,
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
