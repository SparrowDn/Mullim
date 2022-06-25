import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // _appbarwidget() {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text("hi"),
  //     ),
  //   );
  // }

  //_bodywidget() {
  //   return Scaffold(
  //     body: CustomScrollView(
  //       slivers: <Widget>[
  //         const SliverAppBar(
  //           title: Text('title'),
  //           floating: true,
  //         ),
  //         SliverList(delegate: SliverChildBuilderDelegate(
  //             (context, index) => Container(
  //               child: Column(
  //                 children: [],
  //               ),
  //             )
  //
  //         ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // _bottomnavigationbarwidget() {
  //   return Scaffold(
  //     bottomNavigationBar: null,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("hi"),
      // ),
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            title: Text('title'),
            floating: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) => Container(
                  child: Column(
                    children: [],
                  ),
                )),
          ),
        ],
      ),
      //bottomNavigationBar:  _bottomnavigationbarwidget(),
    );
  }
}
