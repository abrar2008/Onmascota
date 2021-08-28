// To parse this JSON data, do
//
//     final signUpRiderModel = signUpRiderModelFromJson(jsonString);

import 'dart:convert';

SignUpRiderModel signUpRiderModelFromJson(String str) => SignUpRiderModel.fromJson(json.decode(str));

String signUpRiderModelToJson(SignUpRiderModel data) => json.encode(data.toJson());

class SignUpRiderModel {
  SignUpRiderModel({
    this.error,
    this.code,
    this.data,
    this.message,
  });

  bool error;
  int code;
  dynamic data;
  String message;

  factory SignUpRiderModel.fromJson(Map<String, dynamic> json) => SignUpRiderModel(
    error: json["error"],
    code: json["code"],
    data: json["data"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "code": code,
    "data": data,
    "message": message,
  };
}
