import 'package:flutter/material.dart';
import 'package:meal_app/core/extensions/navigation_extension.dart';
import 'package:meal_app/core/services/hive_service.dart';
import '../core/models/category.dart';
import '../core/models/meal_model.dart';
import 'meal_detail_page.dart';
import 'meal_list_page.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<Meal> favorites = [];

  @override
  void initState(){
    super.initState();
    favorites = HiveService().getAllMeals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your Favorite",
        ),
      ),
      body: (favorites.isNotEmpty == true)
          ? ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          return MealCard(
              meal: favorites[index],
              isFromFavorites: true,
            onTap: (){
              context.pushWithResult(MealDetailPage(
                  selectedMeal: favorites[index])).then((val) {
                setState(() {
                  favorites = HiveService().getAllMeals();
                });
              });
            },
          );
        },
      ) : SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text("No meals added yet!",
                  textAlign: TextAlign.justify),
            ),
          ],
        ),
      ),
    );
  }
}