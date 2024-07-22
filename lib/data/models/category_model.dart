import 'dart:convert';

class Category {
  int id;
  String name;
  String images;

  Category({
    required this.id,
    required this.name,
    required this.images,
  });

  // Map<String, dynamic> toMap() {
  //   final result = <String, dynamic>{};

  //   result.addAll({"id": id});
  //   result.addAll({"name": name});
  //   result.addAll({"images": images});
  //   return result;
  // }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map["id"] ?? "",
      name: map["name"] ?? "",
      images: map["images"] ?? "",
    );
  }


  // String toJson() => json.encode(toMap());
  // factory Category.fromJson(String source) =>
  //     Category.fromMap(json.decode(source));
}
