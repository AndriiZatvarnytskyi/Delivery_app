import 'package:flutter/material.dart';

import '../models/models.dart';

class CustomCategoryFilter extends StatelessWidget {
  final List<Category> categories;
  const CustomCategoryFilter({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5.0)),
            width: double.infinity,
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    categories[index].name,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  SizedBox(
                    height: 25,
                    child: Checkbox(
                      value: false,
                      onChanged: (bool? newValue) {},
                    ),
                  )
                ]),
          );
        });
  }
}
