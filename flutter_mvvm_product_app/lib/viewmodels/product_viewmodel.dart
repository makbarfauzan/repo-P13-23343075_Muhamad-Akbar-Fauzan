import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/product_service.dart';

class ProductViewModel extends ChangeNotifier {
  final ProductService _service = ProductService();

  List<Product> products = [];
  bool isLoading = false;
  String errorMessage = '';

  Future<void> fetchProducts() async {
    try {
      isLoading = true;
      notifyListeners();

      products = await _service.getProducts();
      errorMessage = '';
    } catch (e) {
      errorMessage = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}
