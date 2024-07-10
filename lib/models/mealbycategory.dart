class MealsByCategorie {
  String? strMeal;
  String? strMealThumb;
  String? idMeal;
  String? strInstructions;

  MealsByCategorie(
      {this.strMeal, this.strMealThumb, this.idMeal, this.strInstructions});

  MealsByCategorie.fromJson(Map<String, dynamic> json) {
    strMeal = json['strMeal'];
    strMealThumb = json['strMealThumb'];
    idMeal = json['idMeal'];
    strInstructions = json['strInstructions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['strMeal'] = this.strMeal;
    data['strMealThumb'] = this.strMealThumb;
    data['idMeal'] = this.idMeal;
    data['strInstructions'] = this.strInstructions;
    return data;
  }
}
