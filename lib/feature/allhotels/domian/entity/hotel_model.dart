class HotelModel {
  final int id;
  final String name;
  final String description;
  final String price;
  final String address;
  final dynamic rate;

  HotelModel({
    required this.price,
    required this.id,
    required this.name,
    required this.description,
    required this.address,
    required this.rate,
  });

  factory HotelModel.fromJson(Map<String, dynamic> json) {
    return HotelModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      address: json['address'],
      rate: json['rate'],
    );
  }
}
