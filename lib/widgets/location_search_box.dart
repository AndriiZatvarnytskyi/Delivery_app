import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/autocomplate/autocomplate_bloc.dart';

class LocationSearchBox extends StatefulWidget {
  const LocationSearchBox({
    Key? key,
  }) : super(key: key);

  @override
  State<LocationSearchBox> createState() => _LocationSearchBoxState();
}

class _LocationSearchBoxState extends State<LocationSearchBox> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AutocomplateBloc, AutocomplateState>(
      builder: (context, state) {
        if (state is AutocomplateLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is AutocomplateLoaded) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Enter Your Location',
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.search,
                  ),
                  onPressed: () {},
                ),
                contentPadding:
                    const EdgeInsets.only(left: 20, right: 5, bottom: 5),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white)),
              ),
              onChanged: (value) {
                context
                    .read<AutocomplateBloc>()
                    .add(LoadAutocomplate(searchInput: value));
              },
            ),
          );
        } else {
          return const Text('Something went wrong');
        }
      },
    );
  }
}
