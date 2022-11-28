import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/filters/filters_bloc.dart';
import '../../models/models.dart';
import '../../widgets/widgets.dart';

class FilterScreen extends StatelessWidget {
  static const String routeName = '/filters';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const FilterScreen(),
        settings: const RouteSettings(name: routeName));
  }

  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Filter')),
        bottomNavigationBar: BottomAppBar(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          BlocBuilder<FiltersBloc, FiltersState>(
            builder: (context, state) {
              if (state is FiltersLoading) {
                return Center(
                  child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor),
                );
              }
              if (state is FiltersLoaded) {
                return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                        ),
                        backgroundColor: Theme.of(context).primaryColor,
                        shape: const RoundedRectangleBorder()),
                    onPressed: () {
                      var categories = state.filter.categoryFilters
                          .where((filter) => filter.value)
                          .map((filter) => filter.category.name)
                          .toList();

                      var prices = state.filter.priceFilters
                          .where((filter) => filter.value)
                          .map((filter) => filter.price.price)
                          .toList();

                      List<Restaurant> restaurant = Restaurant.restaurant
                          .where((restaurant) => categories.any(
                              (category) => restaurant.tags.contains(category)))
                          .where((restaurant) => prices.any((price) =>
                              restaurant.priceCategory.contains(price)))
                          .toList();
                      Navigator.pushNamed(context, '/restaurant-listing',
                          arguments: restaurant);
                    },
                    child: const Text('Apply'));
              } else {
                return const Text('Somethig went wrong');
              }
            },
          )
        ])),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Price',
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
                const CustomPriceFilter(),
                Text(
                  'Category',
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
                const CustomCategoryFilter()
              ],
            ),
          ),
        ));
  }
}
