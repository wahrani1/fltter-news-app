import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/post.dart';
import 'package:news_app/utilities/utilities_api.dart';
class PostsAPI{
  // ignore: missing_return
  Future<List<Post>> fetchAllPosts() async{
    List<Post> posts = List<Post>();
    var url = base_api + all_posts_api;
    var response = await http.get(url);
    if(response.statusCode==200){
      var jsonData = jsonDecode(response.body);
      var data= jsonData['data'];
      for(var item  in data){
        Post post = Post(
        id: item['id'].toString(),
        title: item['title'].toString(),
        dateWritten: item['date_written'],
        content: item['content'].toString(),
        avatar: item['avatar'].toString(),
        voteUp : item['vote_up'],
        voteDown: item['vote_down'],
        authorID: item['author_id'].toString(),
        categoryID: item['category_id'].toString(),
    );
        posts.add(post);

      }
      return posts;
    }

  }
}