import 'package:cookpad_application/provider/meal_data.dart';
import 'package:cookpad_application/provider/recipe_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  final String mealId;

  const DetailScreen({
    Key? key,
    required this.mealId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<RecipeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(""),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Icon(Icons.share_outlined),
                const SizedBox(width: 25),
                Icon(Icons.chat),
                const SizedBox(width: 20),
                Icon(Icons.more_vert)
              ],
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: MealData.GetMealByID(mealId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final meal = snapshot.data![0];
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Section 1 - Gambar Resep
                  Container(
                    height: 280,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(meal.strMealThumb!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Section 2 - Info Resep
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    meal.strMeal!,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    favoritesProvider.toggleFavorite(meal);
                                  },
                                  icon: Icon(
                                    favoritesProvider.isExist(meal)
                                        ? Icons.bookmark
                                        : Icons.bookmark_outline,
                                  ),
                                ),
                              ],
                            ),
                            // Deskripsi Resep
                            Text(
                              meal.strArea!,
                              style: TextStyle(
                                color: const Color.fromARGB(255, 255, 89, 0),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Divider(
                              color: Colors.black,
                              thickness: 0.5,
                            ),
                            // Section 3 - Bahan Makanan
                            ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              itemCount: 20,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                if (index == 0) {
                                  return Text(
                                    "Ingredients : ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                } else {
                                  List<String?> ingredients = [
                                    meal.strIngredient1,
                                    meal.strIngredient2,
                                    meal.strIngredient3,
                                    meal.strIngredient4,
                                    meal.strIngredient5,
                                    meal.strIngredient6,
                                    meal.strIngredient7,
                                    meal.strIngredient8,
                                    meal.strIngredient9,
                                    meal.strIngredient10,
                                    meal.strIngredient11,
                                    meal.strIngredient12,
                                    meal.strIngredient13,
                                    meal.strIngredient14,
                                    meal.strIngredient15,
                                    meal.strIngredient16,
                                    meal.strIngredient17,
                                    meal.strIngredient18,
                                    meal.strIngredient19,
                                    meal.strIngredient20,
                                  ];

                                  List<String?> measures = [
                                    meal.strMeasure1,
                                    meal.strMeasure2,
                                    meal.strMeasure3,
                                    meal.strMeasure4,
                                    meal.strMeasure5,
                                    meal.strMeasure6,
                                    meal.strMeasure7,
                                    meal.strMeasure8,
                                    meal.strMeasure9,
                                    meal.strMeasure10,
                                    meal.strMeasure11,
                                    meal.strMeasure12,
                                    meal.strMeasure13,
                                    meal.strMeasure14,
                                    meal.strMeasure15,
                                    meal.strMeasure16,
                                    meal.strMeasure17,
                                    meal.strMeasure18,
                                    meal.strMeasure19,
                                    meal.strMeasure20,
                                  ];

                                  String ingredient =
                                      ingredients[index - 1] ?? "";
                                  String measure = measures[index - 1] ?? "";

                                  if (ingredient.isNotEmpty &&
                                      measure.isNotEmpty) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            ' - ' + ingredient,
                                            style: TextStyle(
                                              color: Colors.grey.shade800,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            ': ' + measure,
                                            style: TextStyle(
                                              color: Colors.grey.shade600,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w200,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  } else {
                                    return Container();
                                  }
                                }
                              },
                            ),
                            const SizedBox(height: 20),
                            // Section 4 - Langkah - Langkah Memasak
                            const Text(
                              'Steps',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              meal.strInstructions!,
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
