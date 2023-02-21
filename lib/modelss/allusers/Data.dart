class Data {
  Data({
    this.uuid,
    this.firstName,
    this.lastName,
    this.job,
    this.image,
  });

  Data.fromJson(dynamic json) {
    uuid = json['uuid'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    job = json['job'];
    image = json['image'];
  }
  String? uuid;
  String? firstName;
  String? lastName;
  String? job;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uuid'] = uuid;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['job'] = job;
    map['image'] = image;
    return map;
  }
}
