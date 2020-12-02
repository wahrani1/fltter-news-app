import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/utilities/app_theme.dart';
import 'screens/on_boarding.dart';

void main() {
  runApp(NewsApp());
}
class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoadring(),
      theme: AppTheme.appTheme,
    );
  }
}

Widget makeDistance() {
  return SizedBox(
    height: 20,
  );
}
