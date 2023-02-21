class Users {
  Users({
    this.uuid,
    this.firstName,
    this.lastName,
    this.image,
  });

  Users.fromJson(dynamic json) {
    uuid = json['uuid'];
    firstName = json['first_name'];
    lastName = json['last_name'];

    image = json['image'];
  }
  String? uuid;
  String? firstName;
  String? lastName;

  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uuid'] = uuid;
    map['first_name'] = firstName;
    map['last_name'] = lastName;

    map['image'] = image;
    return map;
  }
}
