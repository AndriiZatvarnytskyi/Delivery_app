import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const HomeScreen(),
        settings: const RouteSettings(name: routeName));
  }

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Home')),
        body: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor),
            child: Text('Location Screen',
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(color: Colors.white)),
            onPressed: () {
              Navigator.pushNamed(context, '/location');
            },
          ),
        ));
  }
}