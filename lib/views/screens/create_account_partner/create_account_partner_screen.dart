import 'package:flutter/material.dart';
import 'package:onmascota/model/general_model.dart';
import 'components/body.dart';

class CreateAccountPartnerScreen extends StatelessWidget {
final General allData;
final int index;
  const CreateAccountPartnerScreen({Key key, this.allData,this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: BodyOfCreateAccountPartner(),
      ),
    );
  }
}
