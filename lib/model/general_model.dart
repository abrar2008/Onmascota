// To parse this JSON data, do
//
//     final general = generalFromJson(jsonString);

import 'dart:convert';

//     final login = loginFromJson(jsonString);

General generalFromJson(String str) => General.fromJson(json.decode(str));

String generalToJson(General data) => json.encode(data.toJson());

class General {
  General({
    this.error,
    this.code,
    this.message,
    this.url,
    this.data,
  });

  bool error;
  int code;
  String message;
  String url;
  Data data;

  factory General.fromJson(Map<String, dynamic> json) => General(
    error: json["error"],
    code: json["code"],
    message: json["message"],
    url: json["url"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "code": code,
    "message": message,
    "url": url,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.countryCodes,
    this.locations,
    this.partnerTypes,
    this.experiences,
    this.vehicleTypes,
    this.vehicleModels,
    this.genders,
  });

  List<CountryCode> countryCodes;
  List<Location> locations;
  List<Experience> partnerTypes;
  List<Experience> experiences;
  List<Experience> vehicleTypes;
  List<VehicleModel> vehicleModels;
  List<Gender> genders;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    countryCodes: List<CountryCode>.from(json["CountryCodes"].map((x) => CountryCode.fromJson(x))),
    locations: List<Location>.from(json["Locations"].map((x) => Location.fromJson(x))),
    partnerTypes: List<Experience>.from(json["PartnerTypes"].map((x) => Experience.fromJson(x))),
    experiences: List<Experience>.from(json["Experiences"].map((x) => Experience.fromJson(x))),
    vehicleTypes: List<Experience>.from(json["VehicleTypes"].map((x) => Experience.fromJson(x))),
    vehicleModels: List<VehicleModel>.from(json["VehicleModels"].map((x) => VehicleModel.fromJson(x))),
    genders: List<Gender>.from(json["Genders"].map((x) => Gender.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "CountryCodes": List<dynamic>.from(countryCodes.map((x) => x.toJson())),
    "Locations": List<dynamic>.from(locations.map((x) => x.toJson())),
    "PartnerTypes": List<dynamic>.from(partnerTypes.map((x) => x.toJson())),
    "Experiences": List<dynamic>.from(experiences.map((x) => x.toJson())),
    "VehicleTypes": List<dynamic>.from(vehicleTypes.map((x) => x.toJson())),
    "VehicleModels": List<dynamic>.from(vehicleModels.map((x) => x.toJson())),
    "Genders": List<dynamic>.from(genders.map((x) => x.toJson())),
  };
}

class CountryCode {
  CountryCode({
    this.id,
    this.countryId,
    this.countryTitle,
    this.countrySlug,
    this.countryTwoLetterCode,
    this.countryThreeLetterCode,
    this.countryFlag,
    this.countryLatitude,
    this.countryLongitude,
    this.code,
    this.status,
    this.orderBy,
    this.createdByCompId,
    this.createdByUserId,
    this.updatedByUserId,
    this.deletedByUserId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int id;
  int countryId;
  String countryTitle;
  dynamic countrySlug;
  dynamic countryTwoLetterCode;
  dynamic countryThreeLetterCode;
  dynamic countryFlag;
  double countryLatitude;
  double countryLongitude;
  int code;
  Status status;
  dynamic orderBy;
  int createdByCompId;
  int createdByUserId;
  dynamic updatedByUserId;
  dynamic deletedByUserId;
  DateTime createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  factory CountryCode.fromJson(Map<String, dynamic> json) => CountryCode(
    id: json["id"],
    countryId: json["country_id"],
    countryTitle: json["country_title"],
    countrySlug: json["country_slug"],
    countryTwoLetterCode: json["country_two_letter_code"],
    countryThreeLetterCode: json["country_three_letter_code"],
    countryFlag: json["country_flag"],
    countryLatitude: json["country_latitude"].toDouble(),
    countryLongitude: json["country_longitude"].toDouble(),
    code: json["code"],
    status: statusValues.map[json["status"]],
    orderBy: json["order_by"],
    createdByCompId: json["created_by_comp_id"],
    createdByUserId: json["created_by_user_id"],
    updatedByUserId: json["updated_by_user_id"],
    deletedByUserId: json["deleted_by_user_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"],
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "country_id": countryId,
    "country_title": countryTitle,
    "country_slug": countrySlug,
    "country_two_letter_code": countryTwoLetterCode,
    "country_three_letter_code": countryThreeLetterCode,
    "country_flag": countryFlag,
    "country_latitude": countryLatitude,
    "country_longitude": countryLongitude,
    "code": code,
    "status": statusValues.reverse[status],
    "order_by": orderBy,
    "created_by_comp_id": createdByCompId,
    "created_by_user_id": createdByUserId,
    "updated_by_user_id": updatedByUserId,
    "deleted_by_user_id": deletedByUserId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt,
    "deleted_at": deletedAt,
  };
}

enum Status { ACTIVE }

final statusValues = EnumValues({
  "Active": Status.ACTIVE
});

class Experience {
  Experience({
    this.id,
    this.title,
    this.slug,
    this.image,
    this.status,
    this.orderBy,
    this.createdByCompId,
    this.createdByUserId,
    this.updatedByUserId,
    this.deletedByUserId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.icon,
    this.description,
  });

  int id;
  String title;
  dynamic slug;
  dynamic image;
  Status status;
  dynamic orderBy;
  int createdByCompId;
  int createdByUserId;
  dynamic updatedByUserId;
  dynamic deletedByUserId;
  DateTime createdAt;
  dynamic updatedAt;
  dynamic deletedAt;
  dynamic icon;
  dynamic description;

  factory Experience.fromJson(Map<String, dynamic> json) => Experience(
    id: json["id"],
    title: json["title"],
    slug: json["slug"],
    image: json["image"],
    status: statusValues.map[json["status"]],
    orderBy: json["order_by"],
    createdByCompId: json["created_by_comp_id"] == null ? null : json["created_by_comp_id"],
    createdByUserId: json["created_by_user_id"] == null ? null : json["created_by_user_id"],
    updatedByUserId: json["updated_by_user_id"],
    deletedByUserId: json["deleted_by_user_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"],
    deletedAt: json["deleted_at"],
    icon: json["icon"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "slug": slug,
    "image": image,
    "status": statusValues.reverse[status],
    "order_by": orderBy,
    "created_by_comp_id": createdByCompId == null ? null : createdByCompId,
    "created_by_user_id": createdByUserId == null ? null : createdByUserId,
    "updated_by_user_id": updatedByUserId,
    "deleted_by_user_id": deletedByUserId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt,
    "deleted_at": deletedAt,
    "icon": icon,
    "description": description,
  };
}

class Gender {
  Gender({
    this.value,
    this.text,
  });

  String value;
  String text;

  factory Gender.fromJson(Map<String, dynamic> json) => Gender(
    value: json["value"],
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "text": text,
  };
}


class Location {
  Location({
    this.id,
    this.areaId,
    this.name,
    this.areaTitle,
    this.latitude,
    this.longitude,
    this.orderBy,
    this.status,
    this.createdByCompId,
    this.createdByUserId,
    this.updatedByUserId,
    this.deletedByUserId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int id;
  int areaId;
  String name;
  String areaTitle;
  dynamic latitude;
  dynamic longitude;
  dynamic orderBy;
  Status status;
  dynamic createdByCompId;
  dynamic createdByUserId;
  dynamic updatedByUserId;
  dynamic deletedByUserId;
  DateTime createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    id: json["id"],
    areaId: json["area_id"],
    name: json["name"],
    areaTitle: json["area_title"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    orderBy: json["order_by"],
    status: statusValues.map[json["status"]],
    createdByCompId: json["created_by_comp_id"],
    createdByUserId: json["created_by_user_id"],
    updatedByUserId: json["updated_by_user_id"],
    deletedByUserId: json["deleted_by_user_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"],
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "area_id": areaId,
    "name": name,
    "area_title": areaTitle,
    "latitude": latitude,
    "longitude": longitude,
    "order_by": orderBy,
    "status": statusValues.reverse[status],
    "created_by_comp_id": createdByCompId,
    "created_by_user_id": createdByUserId,
    "updated_by_user_id": updatedByUserId,
    "deleted_by_user_id": deletedByUserId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt,
    "deleted_at": deletedAt,
  };
}

class VehicleModel {
  VehicleModel({
    this.id,
    this.title,
    this.status,
    this.orderBy,
    this.createdByCompId,
    this.createdByUserId,
    this.updatedByUserId,
    this.deletedByUserId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int id;
  int title;
  Status status;
  dynamic orderBy;
  dynamic createdByCompId;
  dynamic createdByUserId;
  dynamic updatedByUserId;
  dynamic deletedByUserId;
  DateTime createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  factory VehicleModel.fromJson(Map<String, dynamic> json) => VehicleModel(
    id: json["id"],
    title: json["title"],
    status: statusValues.map[json["status"]],
    orderBy: json["order_by"],
    createdByCompId: json["created_by_comp_id"],
    createdByUserId: json["created_by_user_id"],
    updatedByUserId: json["updated_by_user_id"],
    deletedByUserId: json["deleted_by_user_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"],
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "status": statusValues.reverse[status],
    "order_by": orderBy,
    "created_by_comp_id": createdByCompId,
    "created_by_user_id": createdByUserId,
    "updated_by_user_id": updatedByUserId,
    "deleted_by_user_id": deletedByUserId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt,
    "deleted_at": deletedAt,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
