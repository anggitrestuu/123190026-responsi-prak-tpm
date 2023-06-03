import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:food_app/model/category_model.dart';

class CategoryService extends ChangeNotifier {
  Future<List<CategoryModel>> getCategories() async {
    var result = await http.get(
        Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php'));

    if (result.statusCode == 200) {
      var data = json.decode(result.body);
      List<CategoryModel> categories = [];

      for (var item in data['categories']) {
        categories.add(CategoryModel.fromJson(item));
      }

      return categories;
    } else {
      throw Exception('Failed to load categories');
    }
  }
}
