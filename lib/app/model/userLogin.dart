part of "model.dart";

UserLogin userLoginFromJson(String str) => UserLogin.fromJson(json.decode(str));

String userLoginToJson(UserLogin data) => json.encode(data.toJson());

class UserLogin {
  String status;
  String msg;
  String token;
  String refreshToken;
  ListUser user;

  UserLogin({
    required this.status,
    required this.msg,
    required this.token,
    required this.refreshToken,
    required this.user,
  });

  factory UserLogin.fromJson(Map<String, dynamic> json) => UserLogin(
        status: json["status"],
        msg: json["msg"],
        token: json["token"],
        refreshToken: json["refresh_token"],
        user: ListUser.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "token": token,
        "refresh_token": refreshToken,
        "user": user.toJson(),
      };
}

class ListUser {
  int id;
  String email;
  String nama;
  String password;
  String phone;
  String alamat;
  String refreshToken;
  DateTime createdAt;
  DateTime updatedAt;

  ListUser({
    required this.id,
    required this.email,
    required this.nama,
    required this.password,
    required this.phone,
    required this.alamat,
    required this.refreshToken,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ListUser.fromJson(Map<String, dynamic> json) => ListUser(
        id: json["id"],
        email: json["email"],
        nama: json["nama"],
        password: json["password"],
        phone: json["phone"],
        alamat: json["alamat"],
        refreshToken: json["refresh_token"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "nama": nama,
        "password": password,
        "phone": phone,
        "alamat": alamat,
        "refresh_token": refreshToken,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
