import 'package:flutter/material.dart';
import 'package:meals_recipes/models/category.dart';
import 'package:meals_recipes/screens/categories_meals_screen.dart';
import 'package:meals_recipes/utils/app_routes.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key, required this.category}) : super(key: key);

  final Category category;

  void _selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoutes.CATEGORIES_MEALS,
      arguments: category,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [category.color.withOpacity(0.5), category.color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}