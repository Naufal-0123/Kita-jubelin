part of 'model.dart';
CreateBarang createBarangFromJson(String str) => CreateBarang.fromJson(json.decode(str));

String createBarangToJson(CreateBarang data) => json.encode(data.toJson());

class CreateBarang {
    String status;
    String message;
    Data data;

    CreateBarang({
        required this.status,
        required this.message,
        required this.data,
    });

    factory CreateBarang.fromJson(Map<String, dynamic> json) => CreateBarang(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
    };
}

class Create {
    int id;
    String nama;
    int harga;
    double rating;
    int stok;
    DateTime updatedAt;
    DateTime createdAt;

    Create({
        required this.id,
        required this.nama,
        required this.harga,
        required this.rating,
        required this.stok,
        required this.updatedAt,
        required this.createdAt,
    });

    factory Create.fromJson(Map<String, dynamic> json) => Create(
        id: json["id"],
        nama: json["nama"],
        harga: json["harga"],
        rating: json["rating"]?.toDouble(),
        stok: json["stok"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "harga": harga,
        "rating": rating,
        "stok": stok,
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
    };
}
