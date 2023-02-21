import 'User.dart';
import 'Language.dart';
import 'PostCategory.dart';

class Data {
  Data({
    this.uuid,
    this.title,
    this.userId,
    this.languageId,
    this.postCategoryId,
    this.image,
    this.description,
    this.createdAt,
    this.user,
    required this.language,
    this.postCategory,
  });

  Data.fromJson(dynamic json) {
    uuid = json['uuid'];
    title = json['title'];
    userId = json['user_id'];
    languageId = json['language_id'];
    postCategoryId = json['post_category_id'];
    image = json['image'];
    description = json['description'];
    createdAt = json['created_at'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    language =
        json['language'] != null ? Language.fromJson(json['language']) : null;
    postCategory = json['post_category'] != null
        ? PostCategory.fromJson(json['post_category'])
        : null;
  }
  String? uuid;
  String? title;
  String? userId;
  String? languageId;
  String? postCategoryId;
  String? image;
  String? description;
  String? createdAt;
  User? user;
  Language? language;
  PostCategory? postCategory;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uuid'] = uuid;
    map['title'] = title;
    map['user_id'] = userId;
    map['language_id'] = languageId;
    map['post_category_id'] = postCategoryId;
    map['image'] = image;
    map['description'] = description;
    map['created_at'] = createdAt;
    if (user != null) {
      map['user'] = user!.toJson();
    }
    if (language != null) {
      map['language'] = language!.toJson();
    }
    if (postCategory != null) {
      map['post_category'] = postCategory!.toJson();
    }
    return map;
  }
}
