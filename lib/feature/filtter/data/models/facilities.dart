import 'dart:convert';

Facilities facilitiesFromJson(String str) =>
    Facilities.fromJson(json.decode(str));

class Facilities {
  Facilities({
    this.status,
    this.data,
  });

  Status? status;
  List<Facility>? data;

  factory Facilities.fromJson(Map<String, dynamic> json) => Facilities(
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
        data: json["data"] == null
            ? null
            : List<Facility>.from(json["data"].map((x) => Facility.fromJson(x))),
      );
}

class Facility {
  Facility({
    this.id,
    this.name,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Facility.fromJson(Map<String, dynamic> json) => Facility(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );
}

class Status {
  Status({
    this.type,
  });

  String? type;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        type: json["type"]  ,
      );
}
