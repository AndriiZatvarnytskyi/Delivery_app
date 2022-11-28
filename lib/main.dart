import 'package:delivery_app/bloc/geolocation/geolocation_bloc.dart';
import 'package:delivery_app/bloc/filters/filters_bloc.dart';
import 'package:delivery_app/config/app_router.dart';
import 'package:delivery_app/config/theme.dart';
import 'package:delivery_app/repositories/geolocation/geolocation_repository.dart';
import 'package:delivery_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/basket/basket_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<GeolocationRepository>(
              create: (_) => GeolocationRepository()),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => GeolocationBloc(
                    geolocationRepository:
                        context.read<GeolocationRepository>())
                  ..add(LoadGeolocation())),
            BlocProvider(
              create: (context) => FiltersBloc()
                ..add(
                  LoadFilter(),
                ),
            ),
            BlocProvider(
              create: (context) => BasketBloc()
                ..add(
                  StartBasket(),
                ),
            ),
          ],
          child: MaterialApp(
            title: 'Food Delivery',
            debugShowCheckedModeBanner: false,
            theme: theme(),
            onGenerateRoute: AppRouter.onGenerateRoute,
            initialRoute: HomeScreen.routeName,
          ),
        ));
  }
}
