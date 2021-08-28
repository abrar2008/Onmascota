// To parse this JSON data, do
//
//     final accountpartner = accountpartnerFromJson(jsonString);

import 'dart:convert';

Accountpartner accountpartnerFromJson(String str) => Accountpartner.fromJson(json.decode(str));

String accountpartnerToJson(Accountpartner data) => json.encode(data.toJson());

class Accountpartner {
    Accountpartner({
        this.error,
        this.code,
        this.data,
        this.message,
    });

    bool error;
    int code;
    dynamic data;
    String message;

    factory Accountpartner.fromJson(Map<String, dynamic> json) => Accountpartner(
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
