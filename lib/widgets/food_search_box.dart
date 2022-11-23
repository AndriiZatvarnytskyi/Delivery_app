import 'package:flutter/material.dart';

class FoodSearchBox extends StatelessWidget {
  const FoodSearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'What would you like to eat?',
                  suffixIcon: Icon(
                    Icons.search,
                    color: Theme.of(context).primaryColor,
                  ),
                  contentPadding:
                      EdgeInsets.only(left: 20.0, bottom: 5.0, top: 12.5),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10.0),
                  )),
              onChanged: (value) {},
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5.0)),
            width: 50,
            height: 50,
            child: IconButton(
              icon: Icon(
                Icons.menu,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/filters');
              },
            ),
          )
        ],
      ),
    );
  }
}
