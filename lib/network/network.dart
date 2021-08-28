import 'dart:convert';

import 'package:onmascota/model/general_model.dart';
import 'package:http/http.dart' as http;

class Network{
  Future<General> getGeneralData() async {
    var finalUrl="https://www.onmascota.thevistech.com/api/general/sign-up";

    var response=await http.get(
        Uri.parse(finalUrl));

    print("URL: ${Uri.encodeFull(finalUrl)}");

    if (response.statusCode == 200) {
      print(response);

      return General.fromJson(json.decode(response.body));
    }else{
      throw Exception("Error getting weather forecast");

    }

  }
}