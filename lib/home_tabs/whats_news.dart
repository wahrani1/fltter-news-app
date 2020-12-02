import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/api/posts_api.dart';
import 'package:news_app/main.dart';
import 'package:news_app/api/authors_api.dart';
import 'package:news_app/models/post.dart';
import 'dart:math';
import 'package:timeago/timeago.dart' as timeago;

class WhatsNews extends StatefulWidget {
  @override
  _WhatsNewsState createState() => _WhatsNewsState();
}

class _WhatsNewsState extends State<WhatsNews> {
  AuthorsAPI authorsAPI = AuthorsAPI();
  PostsAPI postsAPI = PostsAPI();
  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _drawHeader(),
          _drawTopStories(),
        ],
      ),
    );
  }

  Widget _drawHeader() {
    TextStyle _headerTitle = TextStyle(
      color: Colors.red,
      fontSize: 22,
      fontWeight: FontWeight.w400,
    );
    TextStyle _headerDesc = TextStyle(
      color: Colors.red,
      fontSize: 18,
    );
    return Container(
      child: FutureBuilder(
        future: postsAPI.fetchAllPosts(),
        // ignore: missing_return
        builder: (context, AsyncSnapshot snapShot) {
          switch (snapShot.connectionState) {
            case ConnectionState.waiting:
              return _loading();
              break;

            case ConnectionState.active:
              return _loading();
              break;

            case ConnectionState.none:
              return _noData(Colors.white);
              break;

            case ConnectionState.done:
              if (snapShot.hasError) {
                return _connectionError(Colors.white, snapShot.error);
              } else {
                if (snapShot.hasData) {
                  var getRandomNum = random.nextInt(15);
                  Post post = snapShot.data[getRandomNum];
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage(
                          'assets/images/placeholder_pg.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          post.title,
                          style: _headerTitle,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24, right: 24),
                          child: Text(
                            post.content,
                            style: _headerDesc,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return _noData(Colors.white);
                }
              }
              break;
          }
        },
      ),
    );
  }

  Widget _drawTopStories() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _drawTitleHighLight("Top Stories"),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: FutureBuilder(
              future: postsAPI.fetchAllPosts(),
              // ignore: missing_return
              builder: (context, AsyncSnapshot snapShot) {
                switch (snapShot.connectionState) {
                  case ConnectionState.waiting:
                    return _loading();
                    break;
                  case ConnectionState.active:
                    return _loading();

                    break;
                  case ConnectionState.none:
                    return _noData(Colors.black);
                    break;
                  case ConnectionState.done:
                    if (snapShot.hasError) {
                      return _connectionError(Colors.black, snapShot.error);
                    } else {
                      if (snapShot.hasData) {

                        Post post = snapShot.data[0];
                        Post post1 = snapShot.data[1];
                        Post post2 = snapShot.data[2];

                        return Column(
                          children: <Widget>[
                            _drawSingleRow(post),
                            _drawDivider(),
                            _drawSingleRow(post1),
                            _drawDivider(),
                            _drawSingleRow(post2),
                            _drawDivider(),
                          ],
                        );
                      } else {
                        return _noData(Colors.black);
                      }
                    }
                    break;
                }
              },
            ),
          ),
        ),
        _drawTitleHighLight("Recent Updates"),
        _drawRecentUpdate('Sport', Colors.red),
        _drawRecentUpdate('Life Style ', Colors.green),
        makeDistance(),
      ],
    );
  }

  Widget _drawSingleRow([Post post, Authorflutterauthor]) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Image(
            image: ExactAssetImage(
              'assets/images/placeholder_pg.jpg',
            ),
            fit: BoxFit.cover,
            height: 125,
            width: 125,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    post.title,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(post.authorID),
                      Row(
                        children: <Widget>[
                          Icon(Icons.access_time),
                          Text(_humanTime(post.dateWritten)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  String _humanTime(var dateTime) {
    var aa = DateTime.now().difference(DateTime.parse(dateTime));
    DateTime theDifferace = DateTime.now().subtract(aa);
    return timeago.format(theDifferace, locale: 'en_short');
  }

  Widget _drawDivider() {
    return Container(
      height: 2,
      width: double.infinity,
      color: Colors.grey.shade50,
    );
  }

  Widget _drawTitleHighLight(String title) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        top: 16,
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }

  Widget _drawRecentUpdate(String text, MaterialColor color) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage(
                    'assets/images/placeholder_pg.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              height: MediaQuery.of(context).size.height * .30,
              width: MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.only(
                  left: 24,
                  right: 24,
                  top: 4,
                  bottom: 4,
                ),
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _loading() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 16),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  Widget _noData(Color colorMessage) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'No Data Available',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: colorMessage,
            ),
          ),
        ),
      ),
    );
  }

  _connectionError(Color colorMessage, var error) {
    return Center(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            error.toString(),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: colorMessage,
            ),
          ),
        ),
      ),
    );
    // return error.toString();
  }
}
