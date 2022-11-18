import 'package:flutter/material.dart';

class RestaurantDetailsScreen extends StatelessWidget {
  static const String routeName = '/restaurantDetails';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const RestaurantDetailsScreen(),
        settings: const RouteSettings(name: routeName));
  }

  const RestaurantDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Restaurant Details')),
        body: Center(
          child: ElevatedButton(
            child: const Text('Home Screen'),
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
          ),
        ));
  }
}
