import 'package:flutter/material.dart';
import 'package:food_app/model/category_model.dart';
import 'package:food_app/services/category_service.dart';
import 'package:food_app/shared/theme.dart';
import 'package:food_app/widgets/category_card_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var categoryService = Provider.of<CategoryService>(context);

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.only(
            left: edge,
          ),
          child: ListView(
            children: [
              const SizedBox(height: 24),
              //NOTE: TITLE/HEADER
              Text('Dapatkan rekomendasi makanan terbaikmu. ',
                  style: blackTextStyle.copyWith(
                    fontSize: 24,
                  )),
              const SizedBox(height: 2),
              Text(
                'Temukan makanan terbaikmu disini',
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 30),

              Text(
                'Categories',
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 16),

              const SizedBox(height: 16),

              FutureBuilder(
                  future: categoryService.getCategories(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var data = snapshot.data as List<CategoryModel>;
                      int index = 0;
                      return Column(
                        children: data.map((item) {
                          index++;
                          return Container(
                            margin: EdgeInsets.only(
                              top: index == 1 ? 0 : 30,
                            ),
                            child: CategoryCard(item),
                          );
                        }).toList(),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
