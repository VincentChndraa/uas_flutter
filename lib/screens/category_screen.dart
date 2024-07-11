import 'package:cookpad_application/models/mealbycategory.dart';
import 'package:cookpad_application/provider/categories_data.dart';
import 'package:cookpad_application/provider/meal_by_data.dart';
import 'package:cookpad_application/screens/detail_screen.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  final String name;
  final String filter;

  const CategoryScreen({
    super.key,
    required this.name,
    required this.filter,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          name + " " + 'Recipe',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder<List<MealsByCategorie>>(
        future: filter == 'Categories'
            ? MealByData.GetMealByCategory(name)
            : filter == 'Area'
                ? MealByData.GetMealByArea(name)
                : filter == 'Ingredient'
                    ? MealByData.GetMealByIngredient(name)
                    : null,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            print("Data received: ${snapshot.data}");
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            mealId: snapshot.data![index].idMeal.toString(),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 2),
                            blurRadius: 5,
                            color: Color.fromARGB(76, 0, 0, 0),
                          )
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: Colors.grey.shade300,
                                image: DecorationImage(
                                  image: NetworkImage(
                                    snapshot.data![index].strMealThumb!,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot.data![index].strMeal!,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                const SizedBox(height: 5),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
