class Post {
  String id;
  String title;
  String dateWritten;
  String content;
  String avatar;
  int voteUp, voteDown;

  String authorID, categoryID;

  Post({this.id, this.title, this.dateWritten, this.content, this.avatar,
      this.voteUp, this.voteDown, this.authorID, this.categoryID});
}