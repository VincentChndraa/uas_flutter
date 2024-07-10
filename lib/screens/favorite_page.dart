import 'package:cookpad_application/models/recipe_model.dart';
import 'package:cookpad_application/provider/meal_data.dart';
import 'package:cookpad_application/provider/recipe_provider.dart';
import 'package:cookpad_application/screens/detail_screen.dart';
import 'package:cookpad_application/screens/widget/recipe_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<RecipeProvider>(context);
    final meals = favoritesProvider.favoriteResep;

    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Color(0xFFF8F6F2),
        //   title: Text(
        //     "Tersimpan",
        //     style: TextStyle(
        //       fontSize: 14,
        //       fontWeight: FontWeight.bold,
        //     ),
        //   ),
        // ),
        backgroundColor: Color(0xFFF8F6F2),
        body: favoritesProvider.favoriteResep.isEmpty
            ? const Center(
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Belum ada resep yang disimpan',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Kamu belum menyimpan resep apa pun.',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Cari dan simpan resep untuk melihatnya disini',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ],
              ))
            : ListView(
                padding: const EdgeInsets.all(16.0),
                children: [RecipeCard(firstChar: "S", resep: MealModel())],
              ));
  }
}
