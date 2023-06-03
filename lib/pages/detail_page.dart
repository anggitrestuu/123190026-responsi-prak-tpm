import 'package:flutter/material.dart';
import 'package:food_app/model/meal_model.dart';
import 'package:food_app/services/category_service.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  final String idMeal;

  const DetailPage({Key? key, required this.idMeal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var categoryService = Provider.of<CategoryService>(context);

    return Scaffold(
        appBar: AppBar(
            // title: Text(mealData['strMeal']),
            ),
        body: FutureBuilder(
          future: categoryService.getMealById(idMeal),
          builder: (context, snapshot) {
            // print(snapshot);

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error occurred'),
              );
            } else if (!snapshot.hasData) {
              return Center(
                child: Text('No data available'),
              );
            }

            var mealData = snapshot.data as MealModel;

            return SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    mealData.strMealThumb,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Category: ${mealData.strCategory}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Area: ${mealData.strArea}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Ingredients:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  // buildIngredientList(mealData),
                  SizedBox(height: 16),
                  Text(
                    'Instructions:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    mealData.strInstructions,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      String youtubeUrl = mealData.strYoutube;
                      // launchYoutubeVideo(youtubeUrl);
                      // Handle button click, e.g., open the YouTube video
                      // You can use the mealData['strYoutube'] to get the YouTube URL
                    },
                    child: Text('Watch Video'),
                  ),
                ],
              ),
            );
          },
        ));
  }

  // Widget buildIngredientList(MealModel mealData) {
  //   List<Widget> ingredientWidgets = [];
  //   for (int i = 1; i <= 20; i++) {
  //     String ingredient = mealData.
  //     String measure = mealData['strMeasure$i'];
  //     if (ingredient != null && ingredient.isNotEmpty) {
  //       ingredientWidgets.add(
  //         Text('$ingredient: $measure'),
  //       );
  //     }
  //   }
  //   return Column(children: ingredientWidgets);
  // }
}
