import 'dart:ui';

import 'package:cookpad_application/models/recipe_model.dart';
import 'package:cookpad_application/provider/meal_data.dart';
import 'package:cookpad_application/screens/detail_screen.dart';
import 'package:flutter/material.dart';

class MealCard extends StatelessWidget {
  final String firstChar;

  const MealCard({
    Key? key,
    required this.firstChar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MealModel>>(
      future: MealData.fetchMealByFirstChar(firstChar),
      builder: (context, snapshot) {
        return SizedBox(
          width: 100,
          height: 90,
          child: ListView.builder(
            itemCount: !snapshot.hasData
                ? 1
                : snapshot.data!.length > 1
                    ? 1
                    : snapshot.data!.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
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
                  margin: const EdgeInsets.only(left: 15, top: 5, bottom: 20),
                  width: 70,
                  height: 90,
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
                        child: Stack(
                          children: [
                            Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)),
                                color: Colors.grey.shade300,
                                image: snapshot.hasData
                                    ? DecorationImage(
                                        image: NetworkImage(
                                          snapshot.data![index].strMealThumb!,
                                        ),
                                        fit: BoxFit.cover)
                                    : null,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            snapshot.hasData
                                ? Text(
                                    snapshot.data![index].strMeal!,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  )
                                : Container(
                                    height: 15,
                                    width: 130,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: Colors.grey.shade300,
                                    ),
                                  ),
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
      },
    );
  }
}
