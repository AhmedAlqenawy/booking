import '../../domain/entities/trip.dart';

class TripModel extends Trip {
  TripModel({required super.pageData, required super.status});

  factory TripModel.fromJson(Map<String, dynamic> json) {
    return TripModel(
        pageData: DataPageModel.fromJson(json['data']),
        status: TripStatusModel.fromJson(json['status']));
  }
}

class TripStatusModel extends Status {
  TripStatusModel({required super.type});
  factory TripStatusModel.fromJson(Map<String, dynamic> json) {
    return TripStatusModel(type: json['type']);
  }
}

class DataPageModel extends DataClass {
  DataPageModel({required super.currentPage, required super.data});
  factory DataPageModel.fromJson(Map<String, dynamic> json) {
    List<DataModel> data1 = <DataModel>[];
    json['data'].forEach((v) {
      data1.add(DataModel.fromJson(v));
    });
    return DataPageModel(currentPage: json['current_page'], data: data1);
  }
}

class DataModel extends Data {
  DataModel(
      {required super.id,
      required super.userId,
      required super.hotelId,
      required super.type,
      required super.createdAt,
      required super.updatedAt,
      required super.user,
      required super.hotel});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json['id'],
      userId: json['user_id'],
      hotelId: json['hotel_id'],
      type: json['type'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      user: UserModel.fromJson(json['user']),
      hotel: HotelModel.fromJson(json['hotel']),
    );
  }
}

class UserModel extends User {
  UserModel({
    super.id,
    super.name,
    super.email,
    super.emailVerifiedAt,
    super.apiToken,
    super.image,
    super.createdAt,
    super.updatedAt,
    super.googleId,
    super.provider,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        emailVerifiedAt: json['email_verified_at'],
        apiToken: json['api_token'],
        image: json['image'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        googleId: json['google_id'] ?? '',
        provider: json['provider'] ?? '');
  }
}

class HotelModel extends Hotel {
  HotelModel({
    super.id,
    super.name,
    super.description,
    super.price,
    super.address,
    super.latitude,
    super.longitude,
    super.rate,
    super.createdAt,
    super.updatedAt,
    super.hotelImages,
    super.facilities,
  });
  factory HotelModel.fromJson(Map<String, dynamic> json) {
    return HotelModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        price: json['price'],
        address: json['address'],
        latitude: json['latitude'],
        longitude: json['longitude'],
        rate: json['rate'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        hotelImages: json['hotel_images']
            .map<HotelImages>((v) => HotelImagesModel.fromJson(v))
            .toList(),
        facilities: json['facilities']
            .map<Facilities>((v) => FacilitiesModel.fromJson(v))
            .toList());
  }
}

class HotelImagesModel extends HotelImages {
  HotelImagesModel(
      {super.id, super.hotelId, super.image, super.createdAt, super.updatedAt});

  HotelImagesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hotelId = json['hotel_id'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['hotel_id'] = hotelId;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class FacilitiesModel extends Facilities {
  FacilitiesModel(
      {super.id, super.name, super.image, super.createdAt, super.updatedAt});

  FacilitiesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
