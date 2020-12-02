import 'package:http/http.dart' as http;
import 'package:news_app/models/author.dart';
import 'dart:convert';
import 'package:news_app/utilities/utilities_api.dart';

class AuthorsAPI {
  // ignore: missing_return
  Future<List<Author>> fetchAllAuthors() async {
    List<Author> authors = List<Author>();
    var url = base_api + all_authors_api;


    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var data = jsonData["data"];
      for (var item in data) {
        Author author = Author(
            item['id'].toString(),
            item['name'].toString(),
            item['email'].toString(),
            item['avatar'].toString(),
            item['created_at'].toString(),
            item['posts']);
        authors.add(author);
      }
      return authors;
    }
  }
}
