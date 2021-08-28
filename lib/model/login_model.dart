// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  Login({
    this.error,
    this.code,
    this.data,
    this.message,
  });

  bool error;
  int code;
  Data data;
  String message;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
    error: json["error"],
    code: json["code"],
    data: Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "code": code,
    "data": data.toJson(),
    "message": message,
  };
}

class Data {
  Data({
    this.token,
    this.fullName,
  });

  String token;
  String fullName;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    token: json["token"],
    fullName: json["full_name"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "full_name": fullName,
  };
}
