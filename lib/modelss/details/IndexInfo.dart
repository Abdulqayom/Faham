class IndexInfo {
  IndexInfo({
    this.totalUsers,
    this.totalPosts,
    this.totalViews,
  });

  IndexInfo.fromJson(dynamic json) {
    totalUsers = json['totalUsers'];
    totalPosts = json['totalPosts'];
    totalViews = json['totalViews'];
  }
  int? totalUsers;
  int? totalPosts;
  int? totalViews;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['totalUsers'] = totalUsers;
    map['totalPosts'] = totalPosts;
    map['totalViews'] = totalViews;
    return map;
  }
}
