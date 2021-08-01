import 'dart:convert';

List<Cat> catFromJson(dynamic data) =>
    List<Cat>.from(data.map((x) => Cat.fromJson(x)));

String catToJson(List<Cat> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cat {
  Cat({
    required this.id,
    required this.name,
    required this.age,
    required this.imageUrl,
    required this.type,
  });

  final int id;
  final String name;
  final int age;
  final String imageUrl;
  final String type;

  Cat copyWith({
    int? id,
    String? name,
    int? age,
    String? imageUrl,
    String? type,
  }) =>
      Cat(
        id: id ?? this.id,
        name: name ?? this.name,
        age: age ?? this.age,
        imageUrl: imageUrl ?? this.imageUrl,
        type: type ?? this.type,
      );

  factory Cat.fromJson(Map<String, dynamic> json) => Cat(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        age: json["age"] == null ? null : json["age"],
        imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
        type: json["type"] == null ? null : json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "age": age == null ? null : age,
        "imageUrl": imageUrl == null ? null : imageUrl,
        "type": type == null ? null : type,
      };
}