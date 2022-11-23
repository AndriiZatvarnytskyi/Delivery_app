import 'package:delivery_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../models/models.dart';

class RestaurantListingScreen extends StatelessWidget {
  static const String routeName = '/restaurant-listing';

  static Route route({required List<Restaurant> restaurant}) {
    return MaterialPageRoute(
        builder: (_) => RestaurantListingScreen(restaurant: restaurant),
        settings: const RouteSettings(name: routeName));
  }

  final List<Restaurant> restaurant;

  const RestaurantListingScreen({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Restaurants')),
      body: ListView.builder(
          itemCount: restaurant.length,
          itemBuilder: (context, index) {
            return RestaurantCard(restaurant: restaurant[index]);
          }),
    );
  }
}
