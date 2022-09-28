class HotelModel {
  final int id;
  final String name;
  final String description;
  final String price;
  final String address;
  final dynamic rate;
  final double longitude;
  final double latitude;
  List<HotelImages>? hotelImages;

  HotelModel({
    required this.price,
    required this.id,
    required this.name,
    required this.description,
    required this.address,
    required this.rate,
    required this.hotelImages,
    required this.longitude,
    required this.latitude,
  });

  factory HotelModel.fromJson(Map<String, dynamic> json) {
    return HotelModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      address: json['address'],
      rate: json['rate'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      hotelImages: (json['hotel_images'] as List<dynamic>?)
          ?.map((e) => HotelImages.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class HotelImages {
  final String image;

  HotelImages({required this.image});

  factory HotelImages.fromJson(Map<String, dynamic> json) {
    return HotelImages(
      image: json['image'],
    );
  }
}
