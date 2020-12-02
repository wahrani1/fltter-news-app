import 'package:news_app/models/post.dart';

class Author {
   String id;
   String name;
   String email;
   String avatar;
   String dateWritten;
   List<Post> posts;

   Author(this.id, this.name, this.email, this.avatar, this.dateWritten,
      this.posts);
}