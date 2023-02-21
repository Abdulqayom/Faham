class User {
  User({
    this.id,
    this.uuid,
    this.firstName,
    this.lastName,
    this.image,
  });

  User.fromJson(dynamic json) {
    id = json['id'];
    uuid = json['uuid'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    image = json['image'];
  }
  int? id;
  String? uuid;
  String? firstName;
  String? lastName;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['uuid'] = uuid;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['image'] = image;
    return map;
  }
}
