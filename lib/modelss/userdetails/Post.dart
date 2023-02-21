import 'Language.dart';
import 'PostCategory.dart';
import 'User.dart';

class Post {
  Post({
    this.id,
    this.title,
    this.uuid,
    this.image,
    this.description,
    this.postCategoryId,
    this.languageId,
    this.userId,
    this.createdAt,
    this.language,
    this.postCategory,
    this.user,
  });

  Post.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    uuid = json['uuid'];
    image = json['image'];
    description = json['description'];
    postCategoryId = json['post_category_id'];
    languageId = json['language_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    language =
        json['language'] != null ? Language.fromJson(json['language']) : null;
    postCategory = json['post_category'] != null
        ? PostCategory.fromJson(json['post_category'])
        : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  int? id;
  String? title;
  String? uuid;
  String? image;
  String? description;
  String? postCategoryId;
  String? languageId;
  String? userId;
  String? createdAt;
  Language? language;
  PostCategory? postCategory;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['uuid'] = uuid;
    map['image'] = image;
    map['description'] = description;
    map['post_category_id'] = postCategoryId;
    map['language_id'] = languageId;
    map['user_id'] = userId;
    map['created_at'] = createdAt;
    if (language != null) {
      map['language'] = language!.toJson();
    }
    if (postCategory != null) {
      map['post_category'] = postCategory!.toJson();
    }
    if (user != null) {
      map['user'] = user!.toJson();
    }
    return map;
  }
}
