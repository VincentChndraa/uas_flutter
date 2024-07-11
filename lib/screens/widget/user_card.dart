import 'dart:ui';

import 'package:cookpad_application/screens/widget/meal_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UsersCard extends StatefulWidget {
  // final ListUser listuser;

  const UsersCard({
    Key? key,
    // required this.listuser,
  }) : super(key: key);

  @override
  State<UsersCard> createState() => _UsersCardState();
}

class _UsersCardState extends State<UsersCard> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 310,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section 1
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                child: Row(
                  children: [
                    CircleAvatar(),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nama Pengguna",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 11,
                          ),
                        ),
                        Text(
                          "Username",
                          style: TextStyle(fontSize: 10),
                        ),
                        SizedBox(height: 3),
                        Row(
                          children: [
                            Icon(
                              Icons.food_bank_outlined,
                              size: 15,
                            ),
                            SizedBox(width: 2),
                            Text(
                              "5",
                              style: TextStyle(fontSize: 10),
                            ),
                            SizedBox(width: 2),
                            Icon(Icons.photo_camera_outlined, size: 15),
                            SizedBox(width: 2),
                            Text(
                              "5",
                              style: TextStyle(fontSize: 10),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 2),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Flexible(
                      child: MealCard(firstChar: "w"),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: MealCard(firstChar: "s"),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: MealCard(firstChar: "t"),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 1.24,
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Ikuti"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade700,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
