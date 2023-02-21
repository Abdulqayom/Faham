import 'Users.dart';

class Allusers {
  Allusers({
    this.users,
  });

  Allusers.fromJson(dynamic json) {
    users = json['users'] != null ? Users.fromJson(json['users']) : null;
  }
  Users? users;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (users != null) {
      map['users'] = users!.toJson();
    }
    return map;
  }
}
