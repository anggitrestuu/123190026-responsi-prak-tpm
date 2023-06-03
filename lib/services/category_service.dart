import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:food_app/model/meal_by_category.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:food_app/model/category_model.dart';
import 'package:food_app/model/meal_model.dart';

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

  // https://www.themealdb.com/api/json/v1/1/filter.php?c=Chicken
  Future<List<MealByCategory>> getMealsByCategory(String category) async {
    var result = await http.get(Uri.parse(
        'https://www.themealdb.com/api/json/v1/1/filter.php?c=$category'));

    if (result.statusCode == 200) {
      var data = json.decode(result.body);
      List<MealByCategory> meals = [];

      for (var item in data['meals']) {
        meals.add(MealByCategory.fromJson(item));
      }

      return meals;
    } else {
      throw Exception('Failed to load meals');
    }
  }

  // https://www.themealdb.com/api/json/v1/1/lookup.php?i=52772
  Future<MealModel> getMealById(String id) async {
    var result = await http.get(
        Uri.parse('https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id'));

    if (result.statusCode == 200) {
      var data = json.decode(result.body);
      List<MealModel> meals = [];

      // print(data);

      for (var item in data['meals']) {
        meals.add(MealModel.fromJson(item));
      }

      print(meals);

      return meals[0];
    } else {
      throw Exception('Failed to load meals');
    }
  }
}
