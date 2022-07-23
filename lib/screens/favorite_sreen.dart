import 'package:flutter/material.dart';
import 'package:meals_recipes/models/meal.dart';
import 'package:meals_recipes/widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key, required this.favoriteMeals}) : super(key: key);

  final List<Meal> favoriteMeals;

  @override
  Widget build(BuildContext context) {
    if(favoriteMeals.isEmpty){
      return const Center(
        child: Text('No favorites added'),
      );
    } else {
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (ctx, index) {
          return  MealItem(meal: favoriteMeals[index]);
        },
      );
    }
  }
}
