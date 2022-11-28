import 'package:delivery_app/models/models.dart';
import 'package:flutter/material.dart';

class CategoryBox extends StatelessWidget {
  final Category category;

  const CategoryBox({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final List<Restaurant> restaurant = Restaurant.restaurant
        .where((restaurant) => restaurant.tags.contains(category.name))
        .toList();
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/restaurant-listing',
            arguments: restaurant);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 5.0),
        width: 80,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(5.0)),
        child: Stack(
          children: [
            Positioned(
              top: 10,
              left: 10,
              child: Container(
                height: 50,
                width: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.white),
                child: category.image,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    category.name,
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
