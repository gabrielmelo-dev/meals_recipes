import 'package:flutter/material.dart';
import 'package:meals_recipes/data/dummy_data.dart';
import 'package:meals_recipes/models/category.dart';
import 'package:meals_recipes/widgets/meal_item.dart';

class CategoriesMealsScreen extends StatelessWidget {
  const CategoriesMealsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;

    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: (ctx, index) => MealItem(meal: categoryMeals[index]),
        ),
      ),
    );
  }
}
