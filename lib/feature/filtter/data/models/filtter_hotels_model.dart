import 'package:booking/feature/filtter/data/models/filtter_stutsmodel.dart';
import 'package:booking/feature/filtter/domian/entity/filtter_hotel_model.dart';

class FiltterHotelsModel {
  final FiltterStatusModel status;
  final FiltterHotelsDataModel? data;

  FiltterHotelsModel({
    required this.status,
    required this.data,
  });

  factory FiltterHotelsModel.fromJson(Map<String, dynamic> json) {
    return FiltterHotelsModel(
      status: FiltterStatusModel.fromJson(json['status']),
      data: FiltterHotelsDataModel.fromJson(json['data']),
    );
  }
}

class FiltterHotelsDataModel {
  final List<FiltterHotelModel> data;

  FiltterHotelsDataModel({
    required this.data,
  });

  factory FiltterHotelsDataModel.fromJson(Map<String, dynamic> json) {
    return FiltterHotelsDataModel(
      data: List<FiltterHotelModel>.from(
        json['data'].map(
          (x) => FiltterHotelModel.fromJson(x),
        ),
      ),
    );
  }
}
