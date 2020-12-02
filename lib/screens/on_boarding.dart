import 'package:flutter/material.dart';import 'package:news_app/screens/home_screen.dart';import 'package:page_view_indicator/page_view_indicator.dart';import 'home_screen.dart';class OnBoadring extends StatefulWidget {  @override  _OnBoardingState createState() => _OnBoardingState();}class _OnBoardingState extends State<OnBoadring> {  ValueNotifier<int> _pageViewNotifier = ValueNotifier(0);  List<String> images = [    'assets/images/bg.jpg',    'assets/images/bg2.jpg',    'assets/images/bg3.jpg',    'assets/images/bg4.jpg',  ];  List<IconData> icons = [    Icons.favorite_border,    Icons.map,    Icons.ac_unit,    Icons.cloud_queue,  ];  List<String> titles = ['Welcome', 'Map', 'Ac Unit', 'Cloud'];  @override  Widget build(BuildContext context) {    return Stack(      children: <Widget>[        Scaffold(          drawerScrimColor: Colors.red,          body: PageView.builder(            itemBuilder: (context, index) {              return Stack(                children: <Widget>[                  Container(                    decoration: BoxDecoration(                      image: DecorationImage(                        image: ExactAssetImage(images[index]),                        fit: BoxFit.cover,                      ),                    ),                  ),                  Column(                    crossAxisAlignment: CrossAxisAlignment.center,                    mainAxisAlignment: MainAxisAlignment.center,                    children: <Widget>[                      Transform.translate(                        child: Icon(                          icons[index],                          size: 150,                          color: Colors.white,                        ),                        offset: Offset(0, -75),                      ),                      Padding(                        padding: const EdgeInsets.only(                          bottom: 18,                        ),                        child: Text(                          titles[index],                          style: TextStyle(                              color: Colors.white,                              fontSize: 28.0,                              fontWeight: FontWeight.bold),                          textAlign: TextAlign.center,                        ),                      ),                      Padding(                        padding: const EdgeInsets.only(left: 8.0, right: 8),                        child: Text(                          "lorem apesum lorem apesum lorem apesum lorem apesum lorem apesum",                          style: TextStyle(                            color: Colors.white,                            fontSize: 18,                          ),                          textAlign: TextAlign.center,                        ),                      ),                    ],                  ),                ],              );            },            itemCount: images.length,            onPageChanged: (index) {              _pageViewNotifier.value = index;            },          ),        ),        Transform.translate(          offset: Offset(            0,            155,          ),          child: Align(            child: _displayPageIndecators(              images.length,            ),          ),        ),        Align(          alignment: Alignment.bottomCenter,          child: Padding(            padding: const EdgeInsets.only(left: 15, right: 15),            child: SizedBox(              width: double.infinity,              height: 55,              child: Transform.translate(                child: RaisedButton(                  color: Colors.red.shade900,                  child: Text(                    'GET STARTED',                    style: TextStyle(                      fontSize: 16,                      letterSpacing: 5,                      color: Colors.white,                    ),                  ),                  onPressed: () {                    Navigator.pop(context);                    Navigator.push(                      context,                      MaterialPageRoute(                        builder: (context) {                          return HomeScreen();                        },                      ),                    );                  },                ),                offset: Offset(0, -25),              ),            ),          ),        ),      ],    );  }  Widget _displayPageIndecators(int length) {    return PageViewIndicator(      pageIndexNotifier: _pageViewNotifier,      length: length,      normalBuilder: (animationController, index) => Circle(        size: 8.0,        color: Colors.grey,      ),      highlightedBuilder: (animationController, index) => ScaleTransition(        scale: CurvedAnimation(          parent: animationController,          curve: Curves.ease,        ),        child: Circle(          size: 12.0,          color: Colors.red,        ),      ),    );  }}