import 'dart:convert';
import 'package:http/http.dart' as http;

class IngredientData {
  static Future<List<String>> GetIngredientTitle() async {
    final url =
        Uri.parse('https://www.themealdb.com/api/json/v1/1/list.php?i=list');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> mealsJson = json.decode(response.body)['meals'];
      List<String> IngredientTitleList = [];
      for (var meal in mealsJson) {
        IngredientTitleList.add(meal['strIngredient']);
      }
      return IngredientTitleList;
    } else {
      throw Exception('Failed to load ingredient titles');
    }
  }
}
