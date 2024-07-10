import 'package:cookpad_application/models/ingredients_model.dart';
import 'package:cookpad_application/models/recipe_model.dart';
import 'package:cookpad_application/provider/recipe_provider.dart';
import 'package:cookpad_application/screens/detail_screen.dart';
import 'package:cookpad_application/screens/inspirasi_tab.dart';
import 'package:cookpad_application/screens/mengikuti_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final recipeProvider = Provider.of<RecipeProvider>(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Padding(
            padding: EdgeInsets.only(left: 10),
            child: Image.asset(
              'assets/images/cookpad_logo.png',
              width: 10,
              height: 10,
            ),
          ),
          title: Container(
            height: 40,
            child: TextField(
              onTap: () {
                // showSearch(
                //   context: context,
                //   delegate: MySearchDelegate(recipeProvider),
                // );
              },
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                hintText: "Search",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: IconButton(
                icon: Icon(Icons.chat_bubble_rounded),
                tooltip: "Activities",
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
              ),
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            TabBar(
              indicatorColor: Color.fromRGBO(241, 158, 75, 1),
              indicatorWeight: 4,
              tabs: [
                Tab(text: "Mengikuti"),
                Tab(text: "Inspirasi"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  MengikutiScreen(),
                  InspirasiTab(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class MySearchDelegate extends SearchDelegate {
//   final RecipeProvider recipeProvider;

//   MySearchDelegate(this.recipeProvider);

//   @override
//   Widget? buildLeading(BuildContext context) => IconButton(
//         onPressed: () => close(context, null),
//         icon: const Icon(Icons.arrow_back),
//       );

//   @override
//   List<Widget>? buildActions(BuildContext context) => [
//         IconButton(
//           onPressed: () {
//             if (query.isEmpty) {
//               close(context, null);
//             } else {
//               query = '';
//             }
//           },
//           icon: const Icon(Icons.clear),
//         ),
//       ];

//   @override
//   Widget buildResults(BuildContext context) => Center(
//         child: Text(
//           query,
//           style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
//         ),
//       );

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return FutureBuilder<void>(
//       future: recipeProvider.fetchAllRecipes(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Center(child: Text('Error fetching recipes'));
//         } else {
//           List<MealModel> suggestions =
//               recipeProvider.recipess.where((searchResult) {
//             final result = searchResult.strMeal;
//             final input = query.toLowerCase();
//             return result != null && result.contains(input);
//           }).toList();

//           return ListView.separated(
//             separatorBuilder: (context, index) => SizedBox(height: 2),
//             itemCount: suggestions.length,
//             itemBuilder: (context, index) {
//               final suggestion = suggestions[index];

//               return ListTile(
//                 tileColor: Colors.white,
//                 leading: Image.network(
//                   suggestion.strMealThumb ?? '',
//                   fit: BoxFit.cover,
//                   width: 50,
//                   height: 50,
//                 ),
//                 title: Text(suggestion.strMeal ?? ''),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) =>
//                           DetailScreen(mealId: suggestion.idMeal!),
//                     ),
//                   );
//                 },
//               );
//             },
//           );
//         }
//       },
//     );
//   }
// }
