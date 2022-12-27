import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/geolocation/geolocation_bloc.dart';
import '../../widgets/custom_google_map.dart';

class LocationScreen extends StatefulWidget {
  static const String routeName = '/location';

  const LocationScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const LocationScreen(),
        settings: const RouteSettings(name: routeName));
  }

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SizedBox(
          child: BlocBuilder<GeolocationBloc, GeolocationState>(
            builder: (context, state) {
              if (state is GeolocationLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is GeolocationLoaded) {
                return const CustomGoogleMap();
              } else {
                return const Text('Something went wrong.');
              }
            },
          ),
        ),
        Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor),
                child: const Text('Save'),
                onPressed: () {},
              ),
            ))
      ],
    ));
  }
}
