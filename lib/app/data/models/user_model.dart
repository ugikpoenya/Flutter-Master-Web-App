class User {
  String? userId;
  String? fullName;
  String? email;
  dynamic phone;
  String? password;
  String? level;
  String? status;
  dynamic image;
  String? createdAt;
  dynamic createdBy;
  String? updatedAt;
  dynamic updatedBy;
  dynamic deletedAt;
  dynamic deletedBy;
  dynamic restoredAt;
  dynamic restoredBy;
  dynamic verifiedAt;
  dynamic verifiedBy;
  dynamic approvedAt;
  dynamic approvedBy;

  User(
      {this.userId,
      this.fullName,
      this.email,
      this.phone,
      this.password,
      this.level,
      this.status,
      this.image,
      this.createdAt,
      this.createdBy,
      this.updatedAt,
      this.updatedBy,
      this.deletedAt,
      this.deletedBy,
      this.restoredAt,
      this.restoredBy,
      this.verifiedAt,
      this.verifiedBy,
      this.approvedAt,
      this.approvedBy});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    fullName = json['full_name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    level = json['level'];
    status = json['status'];
    image = json['image'];
    createdAt = json['created_at'];
    createdBy = json['created_by'];
    updatedAt = json['updated_at'];
    updatedBy = json['updated_by'];
    deletedAt = json['deleted_at'];
    deletedBy = json['deleted_by'];
    restoredAt = json['restored_at'];
    restoredBy = json['restored_by'];
    verifiedAt = json['verified_at'];
    verifiedBy = json['verified_by'];
    approvedAt = json['approved_at'];
    approvedBy = json['approved_by'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['user_id'] = userId;
    data['full_name'] = fullName;
    data['email'] = email;
    data['phone'] = phone;
    data['password'] = password;
    data['level'] = level;
    data['status'] = status;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['created_by'] = createdBy;
    data['updated_at'] = updatedAt;
    data['updated_by'] = updatedBy;
    data['deleted_at'] = deletedAt;
    data['deleted_by'] = deletedBy;
    data['restored_at'] = restoredAt;
    data['restored_by'] = restoredBy;
    data['verified_at'] = verifiedAt;
    data['verified_by'] = verifiedBy;
    data['approved_at'] = approvedAt;
    data['approved_by'] = approvedBy;
    return data;
  }

  static List<User> fromJsonList(List data) {
    if (data == null || data.length == 0) return [];
    return data.map((e) => User.fromJson(e)).toList();
  }
}
