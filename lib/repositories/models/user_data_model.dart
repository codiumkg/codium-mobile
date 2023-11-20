class UserDataModel {
  final String? token;
  final String? message;
  final User? user;

  UserDataModel({this.token, this.user, this.message});

  UserDataModel.fromJson(Map<String, dynamic> json)
      : token = json['token'] as String?,
        user = User.fromJson(json['user']),
        message = json['message'] as String?;

  Map<String, dynamic> toJson() => {
        'token': token,
        'user': user?.toJson(),
      };
}

class User {
  final int? id;
  final String? username;
  final String? role;
  final String? subject;

  User({this.id, this.username, this.role, this.subject});

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        username = json['username'] as String?,
        role = json['role'] as String?,
        subject = json['subject'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'role': role,
        'subject': subject,
      };
}
