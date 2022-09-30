import 'dart:convert';

Facilities facilitiesFromJson(String str) =>
    Facilities.fromJson(json.decode(str));

class Facilities {
  Facilities({
    this.status,
    this.data,
  });

  Status? status;
  List<Datum>? data;

  factory Facilities.fromJson(Map<String, dynamic> json) => Facilities(
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );
}

class Datum {
  Datum({
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

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
        type: json["type"] == null ? null : json["type"],
      );
}
