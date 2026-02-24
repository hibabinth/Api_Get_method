import 'package:fetch_products/model/models.dart';
import 'package:fetch_products/service/api_service.dart';
import 'package:flutter/material.dart';

class ProductViewmodel extends ChangeNotifier {
  final ApiService _ApiService = ApiService();
  List<Product> _allProducts = [];
  List<Product> _filteredProducts = [];
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List<Product> get products => _filteredProducts;

  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();
    try {
      _allProducts = await _ApiService.fetchProducts();
      _filteredProducts = _allProducts;
    } catch (e) {
      print(e);
    }
    _isLoading = false;
    notifyListeners();
  }

  void searchProducts(String query) {
    if (query.isEmpty) {
      _filteredProducts = _allProducts;
    } else {
      _filteredProducts = _allProducts.where((product) {
        return product.title.toLowerCase().contains(query.toLowerCase()) ||
            product.category.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }
}
