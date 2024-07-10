import 'dart:convert';

import 'package:cookpad_application/models/recipe_model.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class MealData {
  static Future<List<MealModel>> fetchMealByFirstChar(String firstChar) async {
    try {
      final response = await http.get(Uri.parse(
          'https://www.themealdb.com/api/json/v1/1/search.php?f=$firstChar'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        // print(data['meals']);
        return (data['meals'] as List)
            .map((e) => MealModel.fromJson(e))
            .toList();
      } else {
        print("Request failed with status: ${response.statusCode}");
        return [];
      }
    } catch (e) {
      print("handling error: $e");
      return [];
    }
  }

  static Future<List<MealModel>> GetMealByID(String ID) async {
    final url =
        Uri.parse('https://www.themealdb.com/api/json/v1/1/lookup.php?i=$ID');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> mealsJson = json.decode(response.body)['meals'];
      return mealsJson.map((e) => MealModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load meal by ID');
    }
  }

  static Future<void> printMealByID(String ID) async {
    final url =
        Uri.parse('https://www.themealdb.com/api/json/v1/1/lookup.php?i=$ID');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> mealsJson = json.decode(response.body)['meals'];
      print(mealsJson.map((e) => MealModel.fromJson(e)).toList());
    } else {
      throw Exception('Failed to load meal by ID');
    }
  }
}
