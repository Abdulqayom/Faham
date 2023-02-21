import 'User.dart';
import 'UserPosts.dart';

class Userprofile {
  Userprofile({
    this.user,
    this.userPosts,
  });

  Userprofile.fromJson(dynamic json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    userPosts = json['userPosts'] != null
        ? UserPosts.fromJson(json['userPosts'])
        : null;
  }
  User? user;
  UserPosts? userPosts;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['user'] = user!.toJson();
    }
    if (userPosts != null) {
      map['userPosts'] = userPosts!.toJson();
    }
    return map;
  }
}
