import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));


class ProfileModel {
  ProfileModel({
    this.status,
    this.data,
  });

  Status? status;
  Data? data;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    status: json["status"] == null ? null : Status.fromJson(json["status"]),
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

 }

class Data {
  Data({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.apiToken,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.googleId,
    this.provider,
  });

  int ?id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  String? apiToken;
  String ?image;
  DateTime? createdAt;
  DateTime? updatedAt;
  String ?googleId;
  dynamic provider;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name:  json["name"],
    email:json["email"],
    emailVerifiedAt: json["email_verified_at"],
    apiToken:  json["api_token"],
    image: json["image"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    googleId:json["google_id"],
    provider: json["provider"],
  );

}

class Status {
  Status({
    this.type,
  });

  String? type;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
    type: json["type"],
  );

}
