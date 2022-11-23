import 'package:flutter/material.dart';

import '../models/models.dart';

class CustomPriceFilter extends StatelessWidget {
  final List<Price> prices;
  const CustomPriceFilter({super.key, required this.prices});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: prices
            .map((price) => InkWell(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Text(
                      price.price,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                ))
            .toList());
  }
}
