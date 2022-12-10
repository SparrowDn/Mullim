import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'SearchPage.dart';
import 'addpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  final List<Map<dynamic, dynamic>> products = [
    {'name': 'IPhone', 'rating': 3.0, 'image': 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80'},
    {'name': 'IPhone X 2', 'rating': 3.0, 'image': 'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80'},
    {'name': 'IPhone 11', 'rating': 4.0, 'image': 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'},
    {'name': 'IPhone 11', 'rating': 4.0, 'image': 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'},
    {'name': 'IPhone 11', 'rating': 4.0, 'image': 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'},
    {'name': 'IPhone 11', 'rating': 4.0, 'image': 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'},
    {'name': 'IPhone 11', 'rating': 4.0, 'image': 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'},
    {'name': 'IPhone 11', 'rating': 4.0, 'image': 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'},
    {'name': 'IPhone 11', 'rating': 4.0, 'image': 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'},
    {'name': 'IPhone 12', 'rating': 5.0, 'image': 'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80'},
  ];
  PreferredSizeWidget _appbarwidget() {
    return AppBar(
      title: Text("안녕하세요", style: TextStyle(color: Colors.black)),
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
                    Row(
                      children: [
                        Expanded(
                          child: ListView(
                            children: products.map((product) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return  InkWell(
                                    onTap: () {
                                      print('Card tapped.');
                                    },
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Divider(
                                          height: 0,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                                          child: ListTile(
                                            trailing: Icon(Icons.navigate_next),
                                            leading: ClipRRect(
                                              borderRadius: BorderRadius.circular(5.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.blue
                                                ),
                                                child: CachedNetworkImage(
                                                  fit: BoxFit.cover,
                                                  imageUrl: product['image'],
                                                  placeholder: (context, url) => Center(
                                                      child: CircularProgressIndicator()
                                                  ),
                                                  errorWidget: (context, url, error) => new Icon(Icons.error),
                                                ),
                                              ),
                                            ),
                                            title: Text(
                                              product['name'],
                                              style: TextStyle(
                                                  fontSize: 14
                                              ),
                                            ),
                                            subtitle: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Row(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 2.0, bottom: 1),
                                                      child: Text('\$200', style: TextStyle(
                                                        color: Theme.of(context).colorScheme.secondary,
                                                        fontWeight: FontWeight.w700,
                                                      )),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 6.0),
                                                      child: Text('(\$400)', style: TextStyle(
                                                          fontWeight: FontWeight.w700,
                                                          fontStyle: FontStyle.italic,
                                                          color: Colors.grey,
                                                          decoration: TextDecoration.lineThrough
                                                      )),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            }).toList(),
                          ),
                        ),
                      ],
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
