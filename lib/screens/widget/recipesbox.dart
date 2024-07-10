import 'package:flutter/material.dart';
import 'package:cookpad_application/models/recipe_model.dart';
import 'package:cookpad_application/provider/meal_data.dart';

class RecipeBox extends StatefulWidget {
  final String? firstChar;

  const RecipeBox({
    Key? key,
    required this.firstChar,
  }) : super(key: key);

  @override
  _RecipeBoxState createState() => _RecipeBoxState();
}

class _RecipeBoxState extends State<RecipeBox> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MealModel>>(
      future: MealData.fetchMealByFirstChar(widget.firstChar!),
      builder: (context, AsyncSnapshot<List<MealModel>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          print('No data available: ${snapshot.data}');
          return Center(child: Text('No data available'));
        } else {
          List<MealModel> meals = snapshot.data!;
          return Column(
            children: meals.map((meal) {
              return Card(
                child: Column(
                  children: [
                    Image.network(
                      meal.strMealThumb!,
                      width: 50,
                      height: 50,
                    ),
                    Text(meal.strMeal ?? '-'),
                    Text('${meal.strCategory} - ${meal.strArea}'),
                  ],
                ),
              );
            }).toList(),
          );
        }
      },
    );
  }
}
