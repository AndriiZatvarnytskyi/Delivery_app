import 'package:delivery_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/basket/basket_bloc.dart';

class DeliveryTimeScreen extends StatelessWidget {
  static const String routeName = '/delivery-time';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const DeliveryTimeScreen(),
        settings: const RouteSettings(name: routeName));
  }

  const DeliveryTimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Delivery Time')),
        bottomNavigationBar: BottomAppBar(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: const RoundedRectangleBorder()),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Done'))
        ])),
        body: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Choose a Date',
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(children: [
                    ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Delivery is Today!'),
                            duration: Duration(seconds: 2),
                          ));
                        },
                        child: const Text('Today')),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Delivery is Tomorrow!'),
                            duration: Duration(seconds: 2),
                          ));
                        },
                        child: const Text('Tomorrow'))
                  ]),
                ),
                Text(
                  'Choose the time',
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
                Expanded(
                  child: SizedBox(
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3, childAspectRatio: 2.5),
                        itemCount: DeliveryTime.deliveryTimes.length,
                        itemBuilder: (context, index) {
                          return BlocBuilder<BasketBloc, BasketState>(
                            builder: (context, state) {
                              return Card(
                                child: TextButton(
                                  onPressed: () {
                                    context.read<BasketBloc>().add(
                                        SelectDeliveryTime(
                                            DeliveryTime.deliveryTimes[index]));
                                  },
                                  child: Text(
                                    DeliveryTime.deliveryTimes[index].value,
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                ),
                              );
                            },
                          );
                        }),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
