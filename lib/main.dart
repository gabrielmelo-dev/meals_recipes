import 'package:flutter/material.dart';
import 'package:meals_recipes/data/dummy_data.dart';
import 'package:meals_recipes/models/meal.dart';
import 'package:meals_recipes/models/settings.dart';
import 'package:meals_recipes/screens/categories_meals_screen.dart';
import 'package:meals_recipes/screens/meal_detail_screen.dart';
import 'package:meals_recipes/screens/settings_screen.dart';
import 'package:meals_recipes/utils/app_routes.dart';
import 'package:meals_recipes/screens/tabs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _avaliableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;
      _avaliableMeals = DUMMY_MEALS.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterLactoseFree = settings.isLactoseFree && !meal.isLactoseFree;
        return !filterGluten &&
            !filterVegetarian &&
            !filterVegan &&
            !filterLactoseFree;
      }).toList();
    });
  }

  void _toogleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Raleway',
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.pink,
        ).copyWith(
          secondary: Colors.amber,
        ),
      ),
      routes: {
        AppRoutes.HOME: (ctx) => TabsScreen(favoriteMeals: _favoriteMeals),
        AppRoutes.CATEGORIES_MEALS: (ctx) =>
            CategoriesMealsScreen(meals: _avaliableMeals),
        AppRoutes.MEAL_DETAIL: (ctx) => MealDetailScreen(
              onToogleFavorite: _toogleFavorite,
              isFavorite: _isFavorite,
            ),
        AppRoutes.SETTINGS: (ctx) => SettingsScreen(
              settings: settings,
              onSettingsChanged: _filterMeals,
            )
      },
    );
  }
}
