import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cookpad_application/models/mealbycategory.dart';

class MealByData {
  static Future<List<MealsByCategorie>> GetMealByCategory(
      String CategoryName) async {
    final url = Uri.parse(
        'https://www.themealdb.com/api/json/v1/1/filter.php?c=$CategoryName');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> mealsJson = json.decode(response.body)['meals'];
      return mealsJson.map((e) => MealsByCategorie.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load meals by category');
    }
  }

  static Future<List<MealsByCategorie>> GetMealByArea(String AreaName) async {
    final url = Uri.parse(
        'https://www.themealdb.com/api/json/v1/1/filter.php?a=$AreaName');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> mealsJson = json.decode(response.body)['meals'];
      return mealsJson.map((e) => MealsByCategorie.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load meals by area');
    }
  }

  static Future<List<MealsByCategorie>> GetMealByIngredient(
      String ingredientName) async {
    final url = Uri.parse(
        'https://www.themealdb.com/api/json/v1/1/filter.php?i=$ingredientName');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> mealsJson = json.decode(response.body)['meals'];
      return mealsJson.map((e) => MealsByCategorie.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load meals by ingredient');
    }
  }
}
