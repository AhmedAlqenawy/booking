



import 'package:booking/feature/models/status_model.dart';
import 'package:booking/feature/models/user_model.dart';










class LoginModel {
  final StatusModel status;
  final UserModel? data;

  LoginModel({
    required this.status,
    required this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      status: StatusModel.fromJson(json['status']),
      data: UserModel.fromJson(json['data']),
    );
  }
}