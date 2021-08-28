// To parse this JSON data, do
//
//     final resetPasswordModel = resetPasswordModelFromJson(jsonString);

import 'dart:convert';

ResetPasswordModel resetPasswordModelFromJson(String str) => ResetPasswordModel.fromJson(json.decode(str));

String resetPasswordModelToJson(ResetPasswordModel data) => json.encode(data.toJson());

class ResetPasswordModel {
  ResetPasswordModel({
    this.error,
    this.code,
    this.data,
    this.message,
  });

  bool error;
  int code;
  dynamic data;
  String message;

  factory ResetPasswordModel.fromJson(Map<String, dynamic> json) => ResetPasswordModel(
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
