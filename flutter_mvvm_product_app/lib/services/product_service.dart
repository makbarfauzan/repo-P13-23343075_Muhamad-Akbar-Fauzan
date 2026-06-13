import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ProductService {
  Future<List<Product>> getProducts() async {
    final response = await http.get(
      Uri.parse('https://dummyjson.com/products'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List products = data['products'];
      return products.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception('Gagal mengambil data');
    }
  }
}
