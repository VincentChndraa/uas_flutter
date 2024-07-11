import 'package:cookpad_application/screens/favorite_page.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: Row(
            children: [
              SizedBox(width: 15),
              CircleAvatar(),
            ],
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Profile Page",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.analytics_outlined),
                  const SizedBox(width: 25),
                  Icon(Icons.settings_outlined),
                  const SizedBox(width: 20),
                  Icon(Icons.more_vert)
                ],
              ),
            )
          ],
        ),
        body: Column(
          children: [
            TabBar(
              indicatorColor: Color.fromRGBO(241, 158, 75, 1),
              indicatorWeight: 4,
              tabs: [
                Tab(text: "Tersimpan"),
                Tab(text: "Resep Saya"),
              ],
            ),
            Expanded(
                child: TabBarView(
              children: [
                // Halaman Tersimpan
                FavoriteScreen(),
                // Halaman Resep Saya
                Center(child: Text("Resep Saya")),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
