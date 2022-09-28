import 'dart:io';

import 'package:booking/core/util/network/remote/dio_helper.dart';
import 'package:booking/core/util/network/remote/end_points.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../feature/about/model/profile_model.dart';
import '../../../feature/login/models/login_model.dart';
import '../../../feature/login/models/register_model.dart';
import '../../error/exceptions.dart';

abstract class Repository {
  Future<Either<PrimaryServerException, LoginModel>> login({
    required String email,
    required String password,
  });

  Future<Either<PrimaryServerException, RegisterModel>> register({
    required String name,
    required String email,
    required String password,
    required String configPassword,
  });

  Future<Either<PrimaryServerException, ProfileModel>> getProfile({
    String? token,
  });

  Future<Either<PrimaryServerException, ProfileModel>> updateProfile(
      {String? token, String? name, String? email, File? file});
}

class RepositoryImplementation extends Repository {
  final DioHelper dioHelper;

  RepositoryImplementation({
    required this.dioHelper,
  });

  @override
  Future<Either<PrimaryServerException, ProfileModel>> getProfile(
      {String? token}) async {
    return basicErrorHandling<ProfileModel>(
      onSuccess: () async {
        final response = await dioHelper.get(
          token: "mEbHlHnNAvI6mB15T4ZBzN19Y8Un5GxChAfLkYzugI2GhEXUcKiogp6BxLuH",
          endPoint: profileEndPoint,
        );

        return ProfileModel.fromJson(response);
      },
      onPrimaryServerException: (e) async {
        return e;
      },
    );
  }

  @override
  Future<Either<PrimaryServerException, ProfileModel>> updateProfile(
      {String? token, String? name, String? email, File? file}) async {
    return basicErrorHandling<ProfileModel>(
      onSuccess: () async {
        var response;
        if (file != null) {

          String fileName = file.path.split('/').last;

          FormData formData = FormData.fromMap({
            "image":
                await MultipartFile.fromFile(file.path, filename: fileName),
            'name': name,
            'email': email
          });
          response = await DioImpl().post(
              data: formData, endPoint: '/auth/update-info', token: token);
        } else {
          response = await dioHelper.post(
            token: token,
            query: {'name': name, 'email': email},
            endPoint: updateProfileEndPoint,
          );
        }

        return ProfileModel.fromJson(response);
      },
      onPrimaryServerException: (e) async {
        return e;
      },
    );
  }

  @override
  Future<Either<PrimaryServerException, LoginModel>> login({
    required String email,
    required String password,
  }) async {
    return basicErrorHandling<LoginModel>(
      onSuccess: () async {
        final response = await dioHelper.post(
          endPoint: loginEndPoint,
          data: {
            'email': email,
            'password': password,
          },
        );

        return LoginModel.fromJson(response);
      },
      onPrimaryServerException: (e) async {
        return e;
      },
    );

  }

  @override
  Future<Either<PrimaryServerException, RegisterModel>> register
      ({required String email,
    required String password,
    required String configPassword,
    required String name})async{
    return basicErrorHandling<RegisterModel>(
      onSuccess: () async {
        final response = await dioHelper.post(
          endPoint: registerEndPoint,
          data: {
            'email': email,
            'password': password,
            'name':name,
            'password_confirmation': configPassword
          },
        );

        return RegisterModel.fromJson(response);
      },
      onPrimaryServerException: (e) async {
        return e;
      },
    );

  }
}
  extension on Repository {
  Future<Either<PrimaryServerException, T>> basicErrorHandling<T>({
    required Future<T> Function() onSuccess,
    Future<PrimaryServerException> Function(PrimaryServerException exception)?
        onPrimaryServerException,
  }) async {
    try {
      final r = await onSuccess();
      return Right(r);
    } on PrimaryServerException catch (e, s) {
      debugPrint(s.toString());
      return Left(e);
    }
  }
}
