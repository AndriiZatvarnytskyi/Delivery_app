import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/voucher/voucher_bloc.dart';

class VoucherScreen extends StatelessWidget {
  static const String routeName = '/voucher';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const VoucherScreen(),
        settings: const RouteSettings(name: routeName));
  }

  const VoucherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Voucher'),
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
                Navigator.pop(context);
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
                  'Enter a Voucher Code',
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: TextFormField(
                                onChanged: (value) async {
                                  // print(await VoucherRepository()
                                  //     .searchVoucher(value));
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Voucher Code',
                                  contentPadding: const EdgeInsets.only(
                                      left: 20.0, bottom: 5.0, top: 12.5),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                )))
                      ]),
                ),
                Text(
                  'Your Vouchers',
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
                BlocBuilder<VoucherBloc, VoucherState>(
                  builder: (context, state) {
                    if (state is VoucherLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is VoucherLoaded) {
                      return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.vouchers.length,
                          itemBuilder: ((context, index) {
                            return Container(
                              width: double.infinity,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              margin: const EdgeInsets.only(top: 5, bottom: 5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('1x',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .primaryColor)),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: Text(
                                        state.vouchers[index].code,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        context.read<VoucherBloc>().add(
                                            SelectVoucher(
                                                voucher:
                                                    state.vouchers[index]));
                                      },
                                      child: Text('Apply',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6!
                                              .copyWith(
                                                  color: Theme.of(context)
                                                      .primaryColor)),
                                    )
                                  ]),
                            );
                          }));
                    }
                    if (state is VoucherSelected) {
                      return const Text('Voucher Selected)');
                    } else {
                      return const Text('Something went wrong');
                    }
                  },
                )
              ],
            ),
          ),
        ));
  }
}
