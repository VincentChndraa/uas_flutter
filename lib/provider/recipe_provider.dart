import 'package:cookpad_application/models/recipe_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RecipeProvider with ChangeNotifier {
  List<MealModel> _favoriteResep = [];
  List<MealModel> _recipess = [];

  List<MealModel> get recipess {
    return [..._recipess];
  }

  bool _isLoading = false;
  MealModel _recipes = MealModel();

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  MealModel get recipes => _recipes;
  set setRecipes(val) {
    _recipes = val;
    notifyListeners();
  }

  List<MealModel> get favoriteResep => _favoriteResep;
  void toggleFavorite(MealModel meal) {
    final isExist = _favoriteResep.contains(meal);
    if (isExist) {
      _favoriteResep.remove(meal);
    } else {
      _favoriteResep.add(meal);
    }
    notifyListeners();
  }

  bool isExist(MealModel meal) {
    final isExist = _favoriteResep.contains(meal);
    return isExist;
  }

  void clearFavorite() {
    _favoriteResep = [];
    notifyListeners();
  }

  Future<void> fetchAllRecipes() async {
    _isLoading = true;
    notifyListeners();

    final response = await http.get(Uri.parse(
        'https://www.themealdb.com/api/json/v1/1/search.php?s=')); // Ganti dengan URL API yang sesuai

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['meals'] != null) {
        final _allRecipes = (data['meals'] as List)
            .map((meal) => MealModel.fromJson(meal))
            .toList();
      }
    } else {
      throw Exception('Failed to load recipes');
    }

    _isLoading = false;
    notifyListeners();
  }

  // void removeFavorite(int index) {
  //   if (index >= 0 && index < _favoriteResep.length) {
  //     _favoriteResep.removeAt(index);
  //     notifyListeners();
  //   }
  // }

  // void removeFavorite(MealModel meal) {
  //   if (favoriteResep.contains(meal)) {
  //     favoriteResep.remove(meal);
  //     notifyListeners();
  //   }
  // }

  // bool isFavorite(MealModel meal) {
  //   return favoriteResep.contains(meal);
  // }
}
