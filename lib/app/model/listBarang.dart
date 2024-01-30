part of "model.dart";

ListBarang listBarangFromJson(String str) =>
    ListBarang.fromJson(json.decode(str));

String listBarangToJson(ListBarang data) => json.encode(data.toJson());

class ListBarang {
  String status;
  String msg;
  List<Barang> list;

  ListBarang({
    required this.status,
    required this.msg,
    required this.list,
  });

  factory ListBarang.fromJson(Map<String, dynamic> json) => ListBarang(
        status: json["status"],
        msg: json["msg"],
        list: List<Barang>.from(json["data"].map((x) => Barang.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": List<dynamic>.from(list.map((x) => x.toJson())),
      };
}

class Barang {
  int id;
  String nama;
  int harga;
  double rating;
  int stok;

  Barang({
    required this.id,
    required this.nama,
    required this.harga,
    required this.rating,
    required this.stok,
  });

  factory Barang.fromJson(Map<String, dynamic> json) => Barang(
        id: json["id"],
        nama: json["nama"],
        harga: json["harga"],
        rating: json["rating"]?.toDouble(),
        stok: json["stok"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "harga": harga,
        "rating": rating,
        "stok": stok,
      };
}
