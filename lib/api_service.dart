import 'dart:convert';

import 'package:w3_jantira/product_model.dart';
import 'package:http/http.dart' as http;

class ApiService{
  // ฟังชั่นดึงข้อมูลสินค้า
  static Future<List<Product>> fetchproduct()async {
    final response = await http.get(Uri.parse("https://6964b1fae8ce952ce1f28b04.mockapi.io/products"));

    if(response.statusCode == 200){
      final List data = jsonDecode(response.body);
      return data.map((e) => Product.formJson(e)).toList();

    }else{
      throw Exception('โหลกข้มมูลไม่สำเร็จ');
    }
  }
}