import 'package:food_app/model/meal_by_category.dart';
import 'package:food_app/pages/detail_page.dart';
import 'package:food_app/shared/theme.dart';
import 'package:flutter/material.dart';

class MealCard extends StatelessWidget {
  final MealByCategory meal;
  const MealCard(this.meal, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage(
                      idMeal: meal.idMeal,
                    )));
      },
      child: Row(
        children: [
          SizedBox(
              width: 130,
              height: 110,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Stack(
                  children: [
                    Image.network(
                      meal.strMealThumb,
                      width: 130,
                      height: 110,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              )),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LayoutBuilder(
                  builder: (context, constraints) {
                    return Text(
                      meal.strMeal,
                      style: blackTextStyle.copyWith(
                        fontSize: 18,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
