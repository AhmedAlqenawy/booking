import 'package:booking/core/error/exceptions.dart';
import 'package:booking/core/util/network/remote/dio_helper.dart';
import 'package:booking/core/util/network/remote/end_points.dart';
import 'package:booking/feature/filtter/data/models/facilities.dart';
import 'package:booking/feature/filtter/data/models/filtter_hotels_model.dart';
import 'package:booking/feature/filtter/domian/repository/filtter_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';


class FiltterRepositoryImplementation extends FiltterRepository {
  final DioHelper dioHelper;

  FiltterRepositoryImplementation({
    required this.dioHelper,
  });

  @override
  Future<Either<PrimaryServerException, FiltterHotelsModel>> filtter({
    required int page,
    required double maxPrice,
    required double minPrice,
    required int distance,
    required List  facilitiesIds,
    required double longitude,
    required double latitude,
  }) async {
    return basicErrorHandling<FiltterHotelsModel>(
      onSuccess: () async {

        final response = await dioHelper.get(endPoint: filtterEndPoint, query: {
          'page': page,
          'max_price': maxPrice,
          'min_price': minPrice,
          'distance': distance,
          for(int i=0;i<facilitiesIds.length;i++)
          'facilities[$i]': facilitiesIds[i],
          'latitude': latitude,
          'longitude': longitude,
        });

        return FiltterHotelsModel.fromJson(response);
      },
      onPrimaryServerException: (e) async {
        return e;
      },
    );
  }



  @override
  Future<Either<PrimaryServerException, FiltterHotelsModel>> search(
      {required int page, required String name}) async {
    return basicErrorHandling<FiltterHotelsModel>(
      onSuccess: () async {
        final response = await dioHelper.get(endPoint: filtterEndPoint, query: {
          'page': page,
          'name': name,
        });

        return FiltterHotelsModel.fromJson(response);
      },
      onPrimaryServerException: (e) async {
        return e;
      },
    );
  }

  @override
  Future<Either<PrimaryServerException, Facilities>> getFacilities() {
    return basicErrorHandling<Facilities>(
      onSuccess: () async {
        final response =
            await dioHelper.get(endPoint: facilitiesFiltterEndPoint);

        return Facilities.fromJson(response);
      },
      onPrimaryServerException: (e) async {
        return e;
      },
    );
  }
}

extension on FiltterRepository {
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
