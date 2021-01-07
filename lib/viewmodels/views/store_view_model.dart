import 'package:drohealth_assessment/models/product.dart';
import 'package:drohealth_assessment/services/mock_data.dart';
import 'package:drohealth_assessment/viewmodels/base_view_model.dart';
import 'package:flutter/material.dart';

class StoreViewModel extends BaseViewModel {
  MockData _mockData;
  bool _showSearch = false;

  List<Product> _products = [];
  List<Product> _filteredProducts = [];

  StoreViewModel({@required MockData mockData})
      : _mockData = mockData;

  List<Product> get products => _products;
  List<Product> get filteredProducts => _filteredProducts;
  bool get showSearch => _showSearch;

  loadProducts() async {
    setLoading(true);
    List<Product> res = await _mockData.getProducts();
    if (res != null) this.setProducts(res);
    setLoading(false);
  }

  onSearch(String query) {
    if (query.isEmpty) {
      _filteredProducts = _products;
    } else {
      _filteredProducts = _products.where((product) {
        return product.name.toLowerCase().contains(query.toLowerCase()) ||
            product.category.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }

  onSearchTapped() {
      _showSearch = !_showSearch;
      notifyListeners();
  }

  setProducts(List<Product> products) {
    _products = products;
    _filteredProducts  = products;
    notifyListeners();
  }
}
