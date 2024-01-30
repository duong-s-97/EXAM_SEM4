import 'dart:ffi';

class Travel {
  int? id;
  String? name;
  Double? star;
  String? image;

  Travel({this.id, this.name, this.star, this.image});

  factory Travel.valueFromJson(Map<String, dynamic> json) {
    return Travel(
      id: json["id"] as int,
      name: json["name"] as String,
      star: json["star"] as Double,
      image: json["image"] as String,
    );
  }
}
