import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/parser.dart';

import '../../bloc/basket/basket_bloc.dart';

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
        appBar: AppBar(
          title: const Text('Basket'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/edit-basket');
                },
                icon: const Icon(Icons.edit))
          ],
        ),
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
                //Navigator.pushNamed(context, '/edit-basket');
              },
              child: const Text('Apply'))
        ])),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Catlery',
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Row(children: [
                    Expanded(
                      child: Text(
                        'Do you need cutlery?',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    BlocBuilder<BasketBloc, BasketState>(
                      builder: (context, state) {
                        if (state is BasketLoading) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: Theme.of(context).primaryColor,
                            ),
                          );
                        } else if (state is BasketLoaded) {
                          return SizedBox(
                              width: 100,
                              child: SwitchListTile(
                                activeColor: Theme.of(context).primaryColor,
                                dense: false,
                                value: state.basket.cutlery,
                                onChanged: (bool? newValue) {
                                  context
                                      .read<BasketBloc>()
                                      .add(ToggleSwitch());
                                },
                              ));
                        } else {
                          return Text('Something went wrong');
                        }
                      },
                    ),
                  ]),
                ),
                Text(
                  'Items',
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
                BlocBuilder<BasketBloc, BasketState>(
                  builder: (context, state) {
                    if (state is BasketLoading) {
                      return CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      );
                    }
                    if (state is BasketLoaded) {
                      return state.basket.items.isEmpty
                          ? Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(top: 5.0),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'No Items in the Basket',
                                      textAlign: TextAlign.left,
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                    ),
                                  ]),
                            )
                          : ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: state.basket
                                  .itemQuantity(state.basket.items)
                                  .keys
                                  .length,
                              itemBuilder: (context, index) {
                                return Container(
                                  width: double.infinity,
                                  margin: const EdgeInsets.only(top: 5),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5.0)),
                                  child: Row(children: [
                                    Text(
                                      '${state.basket.itemQuantity(state.basket.items).entries.elementAt(index).value}x',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6!
                                          .copyWith(
                                              color: Theme.of(context)
                                                  .primaryColor),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Expanded(
                                      child: Text(
                                        '${state.basket.itemQuantity(state.basket.items).keys.elementAt(index).name}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      ),
                                    ),
                                    Text(
                                      '\$${state.basket.itemQuantity(state.basket.items).keys.elementAt(index).price}',
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                    ),
                                  ]),
                                );
                              });
                    } else {
                      return Text('Something went wrong');
                    }
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                          'assets/on_the_way.svg',
                          width: 70,
                          height: 70,
                        ),
                        BlocBuilder<BasketBloc, BasketState>(
                          builder: (context, state) {
                            if (state is BasketLoaded) {
                              return (state.basket.deliveryTime == null)
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text('Delivery in 20 minuts',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pushNamed(
                                                  context, '/delivery-time');
                                            },
                                            child: Text('Change',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6!
                                                    .copyWith(
                                                        color: Theme.of(context)
                                                            .primaryColor)))
                                      ],
                                    )
                                  : Text(
                                      'Delivery at ${state.basket.deliveryTime!.value}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6);
                            } else {
                              return Text('Something went wrong.');
                            }
                          },
                        )
                      ]),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BlocBuilder<BasketBloc, BasketState>(
                          builder: (context, state) {
                            if (state is BasketLoaded) {
                              return (state.basket.voucher == null)
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('Do you have a voucher?',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pushNamed(
                                                  context, '/voucher');
                                            },
                                            child: Text('Apply',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6!
                                                    .copyWith(
                                                        color: Theme.of(context)
                                                            .primaryColor)))
                                      ],
                                    )
                                  : Text('Your voucher is added!',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6);
                            } else {
                              return Text('Something went wrong');
                            }
                          },
                        ),
                        SvgPicture.asset(
                          'assets/voucher.svg',
                          width: 80,
                          height: 80,
                        ),
                      ]),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 5),
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0)),
                    child: BlocBuilder<BasketBloc, BasketState>(
                      builder: (context, state) {
                        if (state is BasketLoading) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is BasketLoaded) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Subtotal',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6),
                                  Text('\$${state.basket.subtotalString}',
                                      style:
                                          Theme.of(context).textTheme.headline6)
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Delivery Fee',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6),
                                  Text('\$5.0',
                                      style:
                                          Theme.of(context).textTheme.headline6)
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Total',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5!
                                          .copyWith(
                                              color: Theme.of(context)
                                                  .primaryColor)),
                                  Text('\$${state.basket.totalString}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5!
                                          .copyWith(
                                              color: Theme.of(context)
                                                  .primaryColor))
                                ],
                              )
                            ],
                          );
                        } else {
                          return Text('Something went wrong');
                        }
                      },
                    ))
              ],
            ),
          ),
        ));
  }
}
