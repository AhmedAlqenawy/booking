import 'package:booking/core/error/exceptions.dart';
import 'package:booking/core/util/network/remote/dio_helper.dart';
import 'package:booking/core/util/network/remote/end_points.dart';
import 'package:booking/feature/allhotels/data/models/hotels_model.dart';
import 'package:booking/feature/allhotels/domian/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class HotelsRepositoryImplementation extends HotelsRepository {
  final DioHelper dioHelper;

  HotelsRepositoryImplementation({
    required this.dioHelper,
  });

  @override
  Future<Either<PrimaryServerException, HotelsModel>> getHotels({
    required int page,
  }) async {
    return basicErrorHandling<HotelsModel>(
      onSuccess: () async {
        final response = await dioHelper.get(endPoint: hotelsEndPoint, query: {
          'page': page,
          'count': 10,
        });

        print("herrrre");
        return HotelsModel.fromJson(response);
      },
      onPrimaryServerException: (e) async {
        return e;
      },
    );
  }
}

extension on HotelsRepository {
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
