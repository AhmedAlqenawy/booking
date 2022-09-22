

import 'package:booking/feature/hotels/domain/entities/trip.dart';
import 'package:flutter/material.dart';

class BookingDetailsScreen extends StatelessWidget {
  const BookingDetailsScreen({super.key, required this.hotel});
final Hotel hotel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(hotel.name!),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}