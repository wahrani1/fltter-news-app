import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../models/navigation_menu.dart';
import '../screens/home_screen.dart';
import '../screens/headline_news.dart';
import '../screens/twitter_feeds.dart';

// ignore: camel_case_types
class navigationDrawer extends StatefulWidget {
  @override
  _navigationDrawerState createState() => _navigationDrawerState();
}

// ignore: camel_case_types
class _navigationDrawerState extends State<navigationDrawer> {
  List<NavMenuItem> navMenuItem = [
    NavMenuItem('Explore', () => HomeScreen()),
    NavMenuItem('HeadLine News', () => HeadLineNews()),
    NavMenuItem('Twitter Feeds', () => TwitterFeeds()),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(top: 75, left: 30),
        child: ListView.builder(
          itemBuilder: (context, position) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(
                  navMenuItem[position].title,
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 22,
                  ),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Colors.grey.shade500,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return navMenuItem[position].destination();
                      },
                    ),
                  );
                },
              ),
            );
          },
          itemCount: navMenuItem.length,
        ),
      ),
    );
  }
}
