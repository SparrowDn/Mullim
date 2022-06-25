import 'package:flutter/material.dart';

import 'SearchPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PreferredSizeWidget _appbarwidget() {
    return AppBar(
      title: Text("hi", style: TextStyle(color: Colors.black)),
      backgroundColor: Colors.white,
      elevation: 1,
      actions: [
        IconButton(
          onPressed: () {
            showSearch(context: context, delegate: Mysearch());
          },
          icon: Icon(Icons.search),
          color: Colors.black,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.doorbell),
          color: Colors.black,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _appbarwidget());
  }
}
