import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lift/api/dbservice.dart';
import 'package:lift/constants/constantManager.dart';
import 'dart:convert';

import 'package:lift/models/singleItem.dart';

class ProductProvider with ChangeNotifier {
  List<SingleItem> _products = [];
  List<SingleItem> get products => _products;
  Set<String> categories = {};
  bool loadedOnce = false;

  void filter(String type) async {
    if (type == 'All') {
      _products = [];
      fetchProducts();
    } else {
      List<SingleItem> _temp = [];
      await fetchProducts();
      for (var element in _products) {
        if (element.category.name == type) {
          _temp.add(element);
        }
      }
      _products = _temp;
    }
    notifyListeners();
  }

  Future<void> fetchProducts() async {
    try {
      final data = await getDataFromApi();
      if (data != null) {
        final List<SingleItem> loadedProducts = [];
        for (final item in data) {
          loadedProducts.add(SingleItem.fromJson(item));
          categories.add(item['category']['name']);
        }
        _products = loadedProducts;
        notifyListeners();
        loadedOnce = true;
      } else {
        print('Error: some error occured');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
