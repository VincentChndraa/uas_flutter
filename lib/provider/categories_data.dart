import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cookpad_application/models/categories_model.dart';

class CategoriesData {
  static Future<List<Categories>> GetCategories() async {
    final url =
        Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> categoriesJson =
          json.decode(response.body)['categories'];
      return categoriesJson.map((e) => Categories.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  static Future<List<String>> GetCategorieTitle() async {
    final url =
        Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> categoriesJson =
          json.decode(response.body)['categories'];
      List<String> CategorieTitleList = [];
      for (var category in categoriesJson) {
        CategorieTitleList.add(category['strCategory']);
      }
      return CategorieTitleList;
    } else {
      throw Exception('Failed to load category titles');
    }
  }
}
