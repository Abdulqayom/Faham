import 'PostCategory.dart';
import 'User.dart';

import 'Language.dart';

class UserRecentPost {
  UserRecentPost({
    this.title,
    this.uuid,
    this.languageId,
    this.image,
    this.createdAt,
    this.language,
    this.user,
    this.postCategory,
  });

  UserRecentPost.fromJson(dynamic json) {
    title = json['title'];
    uuid = json['uuid'];
    languageId = json['language_id'];
    image = json['image'];
    createdAt = json['created_at'];
    language =
        json['language'] != null ? Language.fromJson(json['language']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    postCategory = json['postcategory'] != null
        ? PostCategory.fromJson(json['postcategory'])
        : null;
  }
  String? title;
  String? uuid;
  User? user;
  String? languageId;
  String? image;
  String? createdAt;
  Language? language;
  PostCategory? postCategory;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['uuid'] = uuid;
    map['language_id'] = languageId;
    map['image'] = image;
    map['created_at'] = createdAt;
    if (language != null) {
      map['language'] = language!.toJson();
    }
    if (user != null) {
      map['user'] = user!.toJson();
    }
    if (postCategory != null) {
      map['postcategory'] = user!.toJson();
    }
    return map;
  }
}
