import 'package:flutter/material.dart';

class BasketScreen extends StatelessWidget {
  static const String routeName = '/basket';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const BasketScreen(),
        settings: const RouteSettings(name: routeName));
  }

  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Bsket')),
        body: Center(
          child: ElevatedButton(
            child: const Text('Home Screen'),
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
          ),
        ));
  }
}
