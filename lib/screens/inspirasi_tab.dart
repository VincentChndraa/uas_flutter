import 'package:cookpad_application/models/recipe_model.dart';
import 'package:cookpad_application/provider/ingredients_data.dart';
import 'package:cookpad_application/provider/recipe_provider.dart';
import 'package:cookpad_application/screens/widget/card_title.dart';
import 'package:cookpad_application/screens/widget/ingredients_item.dart';
import 'package:cookpad_application/screens/widget/recipe_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InspirasiTab extends StatefulWidget {
  const InspirasiTab({super.key});

  @override
  State<InspirasiTab> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<InspirasiTab> {
  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<RecipeProvider>(context);
    return Scaffold(
      body: Consumer<RecipeProvider>(
        builder: (context, recipeProvider, child) {
          if (recipeProvider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return SingleChildScrollView(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [
                // Section 1
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 25, bottom: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Apa isi kulkasmu?",
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 16),
                      ),
                      Text("Pilih hingga 3 bahan"),
                    ],
                  ),
                ),

                IngredientsItem(
                  BoxTitle: 'Ingredients',
                  onPressed: () {},
                ),

                BoxTitle(
                  title: "Popular Meals",
                  onPressed: () {},
                  isLoading: false,
                ),

                RecipeCard(
                  firstChar: "s",
                  resep: MealModel(),
                ),

                BoxTitle(
                    title: "Top Search", onPressed: () {}, isLoading: false),

                RecipeCard(
                  firstChar: "h",
                  resep: MealModel(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
