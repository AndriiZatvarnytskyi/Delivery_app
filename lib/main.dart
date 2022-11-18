import 'package:delivery_app/bloc/geolocation/geolocation_bloc.dart';
import 'package:delivery_app/config/app_router.dart';
import 'package:delivery_app/config/theme.dart';
import 'package:delivery_app/repositories/geolocation/geolocation_repository.dart';
import 'package:delivery_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/autocomplate/autocomplate_bloc.dart';
import 'maint.dart';
import 'repositories/places/place_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<GeolocationRepository>(
              create: (_) => GeolocationRepository()),
          RepositoryProvider<PlaceRepository>(create: (_) => PlaceRepository())
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => GeolocationBloc(
                    geolocationRepository:
                        context.read<GeolocationRepository>())
                  ..add(LoadGeolocation())),
            BlocProvider(
                create: (context) => AutocomplateBloc(
                    placeRepository: context.read<PlaceRepository>())
                  ..add(LoadAutocomplate()))
          ],
          child: MaterialApp(
            //home: Home(),
            title: 'Food Delivery',
            debugShowCheckedModeBanner: false,
            theme: theme(),
            onGenerateRoute: AppRouter.onGenerateRoute,
            initialRoute: HomeScreen.routeName,
          ),
        ));
  }
}
