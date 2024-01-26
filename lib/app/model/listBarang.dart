part of "model.dart";

ListBarang listBarangFromJson(String str) =>
    ListBarang.fromJson(json.decode(str));

String listBarangToJson(ListBarang list) => json.encode(list.toJson());

class ListBarang {
  String status;
  String msg;
  List<Barang> list;
  Pagination pagination;

  ListBarang({
    required this.status,
    required this.msg,
    required this.list,
    required this.pagination,
  });

  factory ListBarang.fromJson(Map<String, dynamic> json) => ListBarang(
        status: json["status"],
        msg: json["msg"],
        list: List<Barang>.from(json["list"].map((x) => Barang.fromJson(x))),
        pagination: Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
        "pagination": pagination.toJson(),
      };
}

class Barang {
  int id;
  String nama;
  int harga;
  String rating;
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
        rating: json["rating"],
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

class Pagination {
  int total;

  Pagination({
    required this.total,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
      };
}
