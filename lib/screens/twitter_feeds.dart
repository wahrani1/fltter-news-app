import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/main.dart';
import 'package:news_app/shared_ui/navigation_drawer.dart';

class TwitterFeeds extends StatefulWidget {
  @override
  _TwitterFeedsState createState() => _TwitterFeedsState();
}

class _TwitterFeedsState extends State<TwitterFeeds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: navigationDrawer(),
      appBar: AppBar(
        title: Text('Twitter Feeds'),
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, position) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _cardHeader(),
                  _cardBody(),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 16,
                    ),
                    child: Container(
                      height: 1,
                      color: Colors.grey,
                    ),
                  ),
                  _cardFooter(),
                ],
              ),
            ),
          );
        },
        itemCount: 8,
      ),
    );
  }

  _cardHeader() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundImage:
                ExactAssetImage('assets/images/placeholder_pg.jpg'),
            radius: 24,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              children: <Widget>[
                Text(
                  "Mahmoud Wahrani",
                  style: TextStyle(
                    color: Colors.grey.shade900,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                makeDistance(),
                Text(
                  "Mahmoud Wahrani",
                  style: TextStyle(
                    color: Colors.grey.shade900,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _cardBody() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        ' lorem apesum lorem apesum lorem apesum lorem apesum lorem apesum',
        style: TextStyle(
          color: Colors.grey.shade700,
          fontWeight: FontWeight.w600,
          height: 1.5,
          fontSize: 18,
        ),
      ),
    );
  }

  _cardFooter() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.repeat,
              size: 30,
            ),
            onPressed: () {},
            color: Colors.orange,
          ),
          Row(
            children: <Widget>[
              FlatButton(
                onPressed: () {},
                child: Text(
                  'SHARE',
                  style: TextStyle(
                    color: Colors.orange,
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {},
                child: Text(
                  'OPEN',
                  style: TextStyle(
                    color: Colors.orange,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
