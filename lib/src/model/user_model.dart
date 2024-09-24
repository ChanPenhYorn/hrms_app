import 'dart:convert';

class UserModel {
  String? firstname;
  String? lastname;
  String? gender;
  DateTime? dob;
  bool? active;
  String? departmentId;
  int? roleId;
  String? projectId;
  String? positionId;
  String? photo;
  String? email;
  String? password;

  UserModel({
    this.firstname,
    this.lastname,
    this.gender,
    this.dob,
    this.active,
    this.departmentId,
    this.roleId,
    this.projectId,
    this.positionId,
    this.photo,
    this.email,
    this.password,
  });

  // Factory method to create a UserModel object from a JSON map
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstname: json['firstname'],
      lastname: json['lastname'],
      gender: json['gender'],
      dob: DateTime.parse(json['dob']),
      active: json['active'],
      departmentId: json['department_id'],
      roleId: json['role_id'],
      projectId: json['project_id'],
      positionId: json['position_id'],
      photo: json['photo'],
      email: json['email'],
      password: json['password'],
    );
  }

  // Method to convert a UserModel object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'firstname': firstname,
      'lastname': lastname,
      'gender': gender,
      'dob': dob!.toIso8601String(),
      'active': active,
      'department_id': departmentId,
      'role_id': roleId,
      'project_id': projectId,
      'position_id': positionId,
      'photo': photo,
      'email': email,
      'password': password,
    };
  }

  // Optional: Convert UserModel object to a JSON string
  String toJsonString() => jsonEncode(toJson());

  // Optional: Create UserModel object from a JSON string
  static UserModel fromJsonString(String jsonString) =>
      UserModel.fromJson(jsonDecode(jsonString));
}
