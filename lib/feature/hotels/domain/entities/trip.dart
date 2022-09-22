import 'package:equatable/equatable.dart';

// class Trip  extends Equatable{
//   String? type;
//     int? currentPage;
//   List<Data>? data;

//   Trip({this.type, this.data,this.currentPage});
//    @override
//   List<Object?> get props => [];
// }

class Trip {
  int currentPage;
  List<Data>? data;

  Trip({this.data,required this.currentPage});}


class Data extends Equatable {
  int id;
  String userId;
  String hotelId;
  String type;
  String createdAt;
  String updatedAt;
  User user;
  Hotel hotel;
  Data(
      {required this.id,
     required this.userId,
     required this.hotelId,
     required this.type,
     required this.createdAt,
     required this.updatedAt,
     required this.user,
    required  this.hotel});
      
        @override
        // TODO: implement props
        List<Object?> get props => []; 
}
class User {
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? apiToken;
  String? image;
  String? createdAt;
  String? updatedAt;
  String? googleId;
  String? provider;

  User(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.apiToken,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.googleId,
      this.provider});

 
}

class Hotel {
  int? id;
  String? name;
  String? description;
  String? price;
  String? address;
  String? longitude;
  String? latitude;
  String? rate;
  String? createdAt;
  String? updatedAt;
  List<HotelImages>? hotelImages;
  List<Facilities>? facilities;

  Hotel(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.address,
      this.longitude,
      this.latitude,
      this.rate,
      this.createdAt,
      this.updatedAt,
      this.hotelImages,
      this.facilities});


    
  }

 

class HotelImages {
  int? id;
  String? hotelId;
  String? image;
  String? createdAt;
  String? updatedAt;
  HotelImages(
      {this.id, this.hotelId, this.image, this.createdAt, this.updatedAt});
}

class Facilities {
  int? id;
  String? name;
  String? image;
  String? createdAt;
  String? updatedAt;

  Facilities({this.id, this.name, this.image, this.createdAt, this.updatedAt});
 
}


