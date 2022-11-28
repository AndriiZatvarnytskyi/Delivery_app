import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: false,
        leading: IconButton(icon: Icon(Icons.person), onPressed: () {}),
        title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'CURRENT LOCATION',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: Colors.white),
          ),
          Text(
            'Singapore, 1 Shenton Way',
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.white),
          )
        ]));
  }

  @override
  Size get preferredSize => Size.fromHeight(56.0);
}
