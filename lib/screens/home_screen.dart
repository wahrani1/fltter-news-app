import 'package:flutter/material.dart';
import 'package:news_app/shared_ui/navigation_drawer.dart';
import 'package:news_app/home_tabs/whats_news.dart';
import 'package:news_app/home_tabs/popular.dart';
import 'package:news_app/home_tabs/favourites.dart';
import 'package:news_app/api/authors_api.dart';




class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{

  TabController  _tabController;

  AuthorsAPI authorsAPI=AuthorsAPI();
  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: navigationDrawer(),
      appBar: AppBar(
        title: Text(
          "Explore",
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
              text: "FAVOURITES",
            ),
          ],
          controller: _tabController,
        ),
      ),
      body: Center(
        child: TabBarView(children: [
          WhatsNews(),
          Popular(),
          Favourites()
        ], controller: _tabController),
      ),
    );
  }
}
