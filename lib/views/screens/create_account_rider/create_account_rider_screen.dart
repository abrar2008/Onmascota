import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onmascota/model/general_model.dart';
import 'package:onmascota/views/screens/create_account_rider/components/body.dart';

class CreateAccountRiderScreen extends StatelessWidget {
  final General allData;

  const CreateAccountRiderScreen({Key key, this.allData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: BodyOfCreateAccountRider(allData: allData,),
      ),
    );
  }
}
