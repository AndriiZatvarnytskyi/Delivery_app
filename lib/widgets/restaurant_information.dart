import 'package:delivery_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';

class RestaurantInformation extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantInformation({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              restaurant.name,
              style: Theme.of(context).textTheme.headline1!.copyWith(
                  color: Theme.of(context).primaryColor, letterSpacing: 2.5),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            '${restaurant.distance}km away - \$${restaurant.deliveryFee} delivery fee',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Restaurant Information',
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Lorem ipsum dolor amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore mogno aliqua.',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
