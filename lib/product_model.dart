import 'package:flutter/cupertino.dart';

class Product {
  final String id;
  final String name;
  final String photo;

  Product({required this.id, required this.name, required this.photo});

  factory Product.formJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        name: json['name'],
        photo: json['photo']
    );
  }

}
