import 'Post.dart';
import 'UserRecentPost.dart';

class Userdetailsview {
  Userdetailsview({
    this.post,
    this.userRecentPost,
    this.postViews,
  });

  Userdetailsview.fromJson(dynamic json) {
    post = json['post'] != null ? Post.fromJson(json['post']) : null;
    if (json['userRecentPost'] != null) {
      userRecentPost = [];
      json['userRecentPost'].forEach((v) {
        userRecentPost!.add(UserRecentPost.fromJson(v));
      });
    }
    postViews = json['post_views'];
  }
  Post? post;
  List<UserRecentPost>? userRecentPost;
  int? postViews;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (post != null) {
      map['post'] = post!.toJson();
    }
    if (userRecentPost != null) {
      map['userRecentPost'] = userRecentPost!.map((v) => v.toJson()).toList();
    }
    map['post_views'] = postViews;
    return map;
  }
}
