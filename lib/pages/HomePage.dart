import 'package:flutter/material.dart';

import 'SearchPage.dart';
import 'addpage.dart';

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

  Widget _bodywidget() {
    return Scaffold(
      body: Container(
        child: DefaultTabController(
          length: 3,
          child: CustomScrollView(
            slivers: [
              // 상단의 앱바 제목표시

              // const SliverAppBar(
              //   title: Text(
              //     "음뭐로할까",
              //     style: TextStyle(color: Colors.black),
              //   ),
              //   pinned: false,
              //   backgroundColor: Colors.white,
              // ),
              const SliverPersistentHeader(delegate: TabBarDelegate()),

              //탭 내부의 내용 표시하는 탭
              SliverFillRemaining(
                hasScrollBody: true,
                child: TabBarView(
                  children: [
                    Container(
                      color: Colors.white,
                    ),
                    Container(
                      color: Colors.white,
                    ),
                    Container(
                      color: Colors.white,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(

        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => addpage()));
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.add),

      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarwidget(),
      body: _bodywidget(),
    );
  }
}

//탭바 상단의 탭 항목, 이름 선택시 색상
class TabBarDelegate extends SliverPersistentHeaderDelegate {
  const TabBarDelegate();

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: TabBar(
        tabs: [
          Tab(
            child: Container(
              child: Text(
                "홈",
                style: TextStyle(color: Colors.black),
              ),
              color: Colors.white,
            ),
          ),
          Tab(
            child: Container(
              child: Text(
                "페이지",
                style: TextStyle(color: Colors.black),
              ),
              color: Colors.white,
            ),
          ),
          Tab(
            child: Container(
              child: Text(
                "추천",
                style: TextStyle(color: Colors.black),
              ),
              color: Colors.white,
            ),
          ),
        ],
        indicatorWeight: 2,
        unselectedLabelColor: Colors.grey,
        indicatorColor: Colors.black,
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: Colors.black,
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 48;

  @override
  // TODO: implement minExtent
  double get minExtent => 48;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
    // TODO: implement shouldRebuild
    throw UnimplementedError();
  }
}
