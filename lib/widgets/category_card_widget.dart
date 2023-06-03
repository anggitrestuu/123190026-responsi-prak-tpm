import 'package:food_app/model/category_model.dart';
import 'package:food_app/pages/meal_page.dart';
import 'package:food_app/shared/theme.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;
  const CategoryCard(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MealPage(
                      strCategory: category.strCategory,
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
                      category.strCategoryThumb,
                      width: 130,
                      height: 110,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              )),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(category.strCategory,
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                  )),
              // const SizedBox(height: 2),
              // Text.rich(TextSpan(
              //     text: '\$${space.price}',
              //     style: purpleTextStyle.copyWith(fontSize: 16),
              //     children: [
              //       TextSpan(
              //           text: ' / month',
              //           style: greyTextStyle.copyWith(fontSize: 16))
              //     ])),
              // const SizedBox(height: 16),
              // Text(
              //   '${space.city}, ${space.country}',
              //   style: greyTextStyle.copyWith(fontSize: 14),
              // )
            ],
          )
        ],
      ),
    );
  }
}
