import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/main.dart';

class Favourites extends StatefulWidget {
  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  List<Color> colorListRandom = [
    Colors.grey,
    Colors.blueAccent,
    Colors.deepOrange,
    Colors.green,
    Colors.brown,
    Colors.red
  ];
  Random random = Random();

  Color _getRandomColor() {
    return colorListRandom[random.nextInt(colorListRandom.length)];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, position) {
        return Card(
          child: _drawAuther(),
        );
      },
      itemCount: 20,
    );
  }

  Widget _drawAuther() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(20),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: ExactAssetImage(
                            'assets/images/placeholder_pg.jpg',
                          ),
                          fit: BoxFit.cover),
                      shape: BoxShape.circle),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Mahmoud Wahrani',
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 15,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '15 Min',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Text(
                                          ' Life Style',
                                          style: TextStyle(
                                              color: _getRandomColor()),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.bookmark_border,
                color: Colors.grey.shade500,
                size: 35,
              ),
            ),
          ],
        ),
        _drawNews()
      ],
    );
  }

  Widget _drawNews() {
    return Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            bottom: 20,
            right: 20,
            left: 20,
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage('assets/images/placeholder_pg.jpg'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          height: 125,
          width: 125,
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                  'lorem apesum lorem apesum lorem apesum',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                ' lorem apesum lorem apesum lorem apesum lorem apesum lorem apesum',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.grey,
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              makeDistance(),
            ],
          ),
        ),
      ],
    );
  }
}
