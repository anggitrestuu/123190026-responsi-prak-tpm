import 'package:flutter/material.dart';
import 'package:food_app/pages/home_page.dart';
import 'package:food_app/services/category_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CategoryService(),
        child: const MaterialApp(home: HomePage()));
  }
}
