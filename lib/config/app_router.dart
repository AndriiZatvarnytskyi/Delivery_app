import 'package:flutter/material.dart';

import '../models/models.dart';
import '../screens/screens.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case LocationScreen.routeName:
        return LocationScreen.route();
      case BasketScreen.routeName:
        return BasketScreen.route();
      case CheckoutScreen.routeName:
        return CheckoutScreen.route();
      case DeliveryTimeScreen.routeName:
        return DeliveryTimeScreen.route();
      case FilterScreen.routeName:
        return FilterScreen.route();
      case RestaurantDetailsScreen.routeName:
        return RestaurantDetailsScreen.route(
            restaurant: settings.arguments as Restaurant);
      case RestaurantListingScreen.routeName:
        return RestaurantListingScreen.route(
            restaurant: settings.arguments as List<Restaurant>);

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text('Error'),
              ),
            ),
        settings: const RouteSettings(name: '/error'));
  }
}
