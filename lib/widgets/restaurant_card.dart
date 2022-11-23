import 'package:delivery_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantCard({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/restaurant-details',
              arguments: restaurant);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(restaurant.imageUrl))),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    height: 30,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        '${restaurant.deliveryTime} min',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  RestaurantTags(restaurant: restaurant),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${restaurant.distance}km - \$${restaurant.deliveryFee} delivery fee',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
