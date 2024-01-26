part of "model.dart";

UserRegister userRegisterFromJson(String str) => UserRegister.fromJson(json.decode(str));

String userRegisterToJson(UserRegister data) => json.encode(data.toJson());

class UserRegister {
    String status;
    String msg;
    Data data;

    UserRegister({
        required this.status,
        required this.msg,
        required this.data,
    });

    factory UserRegister.fromJson(Map<String, dynamic> json) => UserRegister(
        status: json["status"],
        msg: json["msg"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": data.toJson(),
    };
}

class Data {
    String nama;
    String email;
    String alamat;
    String phone;
    String password;

    Data({
        required this.nama,
        required this.email,
        required this.alamat,
        required this.phone,
        required this.password,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        nama: json["nama"],
        email: json["email"],
        alamat: json["alamat"],
        phone: json["phone"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "nama": nama,
        "email": email,
        "alamat": alamat,
        "phone": phone,
        "password": password,
    };
}
