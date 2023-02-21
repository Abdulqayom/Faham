import 'Posts.dart';
import 'Users.dart';
import 'IndexInfo.dart';

class Postdetails {
  Postdetails({
    this.posts,
    this.users,
    this.indexInfo,
  });

  Postdetails.fromJson(dynamic json) {
    if (json['posts'] != null) {
      posts = [];
      json['posts'].forEach((v) {
        posts!.add(Posts.fromJson(v));
      });
    }
    if (json['users'] != null) {
      users = [];
      json['users'].forEach((v) {
        users!.add(Users.fromJson(v));
      });
    }
    indexInfo = json['indexInfo'] != null
        ? IndexInfo.fromJson(json['indexInfo'])
        : null;
  }
  List<Posts>? posts;
  List<Users>? users;
  IndexInfo? indexInfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (posts != null) {
      map['posts'] = posts!.map((v) => v.toJson()).toList();
    }
    if (users != null) {
      map['users'] = users!.map((v) => v.toJson()).toList();
    }
    if (indexInfo != null) {
      map['indexInfo'] = indexInfo!.toJson();
    }
    return map;
  }
}
