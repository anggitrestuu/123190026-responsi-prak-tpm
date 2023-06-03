class MealByCategory {
  final String strMeal;
  final String strMealThumb;
  final String idMeal;

  MealByCategory({
    required this.strMeal,
    required this.strMealThumb,
    required this.idMeal,
  });

  factory MealByCategory.fromJson(Map<String, dynamic> json) {
    return MealByCategory(
      strMeal: json['strMeal'],
      strMealThumb: json['strMealThumb'],
      idMeal: json['idMeal'],
    );
  }
}

// class Meals {
//   final List<MealByCategory> meals;

//   Meals({required this.meals});

//   factory Meals.fromJson(Map<String, dynamic> json) {
//     List<MealByCategory> mealList = List<MealByCategory>.from(
//       json['meals'].map((meal) => MealByCategory.fromJson(meal)),
//     );

//     return Meals(meals: mealList);
//   }
// }
