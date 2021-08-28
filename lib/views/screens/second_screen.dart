

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:onmascota/model/general_model.dart';

class SecondScreen extends StatefulWidget {
  final General countryData;

  const SecondScreen({Key key, this.countryData}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {

  List<String> countries = [];

  @override
  void initState() {
    int numOfCountries = widget.countryData.data.countryCodes.length;
    for(int i=0;i<numOfCountries-1;i++){
      countries.add(widget.countryData.data.countryCodes[i].countryTitle);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: DropdownSearch<String>(
            dropdownSearchDecoration:
            InputDecoration(border: InputBorder.none),
            mode: Mode.MENU,
            showSelectedItem: true,
            items: countries,
            // items: ["Male", "Female", "Other"],
            hint: "Gender",
            popupItemDisabled: (String s) => s.startsWith('I'),
            onChanged: print,
          )

        ),
      ),
    );
  }
}
