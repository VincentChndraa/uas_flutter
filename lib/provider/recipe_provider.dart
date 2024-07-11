import 'package:cookpad_application/models/recipe_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RecipeProvider with ChangeNotifier {
  List<MealModel> _favoriteResep = [];

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
}
