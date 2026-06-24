import 'dart:convert';

class ProductModel {
  final String name;
  final String desc;
  final int price;
  final String image;

  ProductModel({
    required this.name,
    required this.desc,
    required this.price,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {'name': name, 'desc': desc, 'price': price, 'image': image};
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      name: map['name'] ?? '',
      desc: map['desc'] ?? '',
      price: map['price'] ?? 0,
      image: map['image'] ?? '',
    );
  }

  String toJson() => jsonEncode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(jsonDecode(source));
}
