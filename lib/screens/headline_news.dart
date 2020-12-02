import 'package:flutter/material.dart';
import 'package:news_app/home_tabs/favourites.dart';
import 'package:news_app/home_tabs/popular.dart';
import 'package:news_app/shared_ui/navigation_drawer.dart';

class HeadLineNews extends StatefulWidget {
  @override
  _HeadLineNewsState createState() => _HeadLineNewsState();
}

class _HeadLineNewsState extends State<HeadLineNews>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: navigationDrawer(),
      appBar: AppBar(
        title: Text(
          "HeadLine News",
        ),
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          )
        ],
        bottom: TabBar(
          indicatorColor: Colors.white,
          tabs: [
            Tab(
              text: "WHAT'S NEW",
            ),
            Tab(
              text: "POPULAR",
            ),
            Tab(
              text: 'Favourites',
            ),
          ],
          controller: _tabController,
        ),
      ),
      body: Center(
        child: TabBarView(children: [
          Favourites(),
          Popular(),
          Favourites(),
        ], controller: _tabController),
      ),
    );
  }
}
