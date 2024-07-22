import 'dart:convert';

import 'package:dio_product/data/models/category_model.dart';

class Product {
  int id;
  String title;
  int price;
  String description;
  Category category;
  List images;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.images,
  });

  // Map<String, dynamic> toMap() {
  //   final result = <String, dynamic>{};

  //   result.addAll({"id": id});
  //   result.addAll({"title": title});
  //   result.addAll({"price": price});
  //   result.addAll({"description": description});
  //   result.addAll({"category": category});
  //   result.addAll({"images": images});

  //   return result;
  // }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map["id"] ?? "",
      title: map["title"] ?? "",
      price: map["price"] ?? "",
      description: map["description"] ?? "",
      category:  Category.fromMap(map["category"]),
      images: map["images"] ?? "",
    );
  }

  // String toJson() => json.encode(toMap());
  // factory Product.fromJson(String source) =>
  //     Product.fromMap(json.decode(source));
}
