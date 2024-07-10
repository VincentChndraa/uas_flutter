import 'package:cookpad_application/models/categories_model.dart';
import 'package:cookpad_application/provider/categories_data.dart';
import 'package:cookpad_application/screens/category_screen.dart';
import 'package:flutter/material.dart';

class CategorieBox extends StatelessWidget {
  const CategorieBox({
    Key? key,
    required this.BoxTitle,
    required this.onPressed,
  }) : super(key: key);

  final String BoxTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Categories>>(
      future: CategoriesData.GetCategories(),
      builder: (context, snapshot) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    snapshot.hasData
                        ? Text(
                            BoxTitle,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                            ),
                          )
                        : Container(
                            height: 15,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Colors.grey.shade300,
                            ),
                          ),
                    snapshot.hasData
                        ? TextButton(
                            onPressed: onPressed,
                            child: const Text(
                              'See All',
                              style: TextStyle(
                                color: Colors.deepOrangeAccent,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        : Container(
                            height: 15,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Colors.grey.shade300,
                            ),
                          )
                  ],
                ),
              ),
              SizedBox(
                height: 560, // Adjust height based on the number of categories
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    // mainAxisSpacing: 5,
                    // crossAxisSpacing: 5,
                    childAspectRatio: 2.5,
                  ),
                  itemCount: snapshot.hasData ? snapshot.data!.length : 0,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoryScreen(
                                name: snapshot.data![index].strCategory!,
                                filter: 'Categories',
                              ),
                            ));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(
                            left: 15, top: 5, bottom: 10, right: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(0, 2),
                              blurRadius: 5,
                              color: Color.fromARGB(117, 0, 0, 0),
                            )
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: snapshot.hasData
                                    ? Colors.white
                                    : Colors.grey.shade300,
                                image: snapshot.hasData
                                    ? DecorationImage(
                                        image: NetworkImage(
                                          snapshot
                                              .data![index].strCategoryThumb!,
                                        ),
                                        fit: BoxFit.cover)
                                    : null,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: snapshot.hasData
                                    ? Text(
                                        snapshot.data![index].strCategory!,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      )
                                    : Container(
                                        height: 15,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          color: Colors.grey.shade300,
                                        ),
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
