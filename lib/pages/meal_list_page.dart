import 'package:flutter/material.dart';
import 'package:meal_app/core/common_widgets/custom_network_image.dart';
import 'package:meal_app/core/extensions/navigation_extension.dart';
import 'package:meal_app/core/models/json_data.dart';
import 'package:meal_app/pages/meal_detail_page.dart';
import '../core/app_styles/app_colors.dart';
import '../core/app_styles/app_styles.dart';
import '../core/models/category.dart';
import '../core/models/meal_model.dart';

class MealListPage extends StatefulWidget {
  final Category selectedCategory;
  const MealListPage({super.key,
    required this.selectedCategory});

  @override
  State<MealListPage> createState() => _MealListPageState();
}

class _MealListPageState extends State<MealListPage> {
  List<Meal> filteredMeals = [];

  @override
  void initState(){
    super.initState();
    filteredMeals = JsonData.mealList.where((meal) {
      return meal.categories.contains(widget.selectedCategory.id);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.selectedCategory.title,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView.builder(
        itemCount: filteredMeals.length,
        itemBuilder: (context, index) {
          return MealCard(meal: filteredMeals[index]);
        },
      ),
    );
  }
}

class MealCard extends StatelessWidget {
  final Meal meal;

  const MealCard({
    required this.meal,
    super.key,
  });

  String get complexityText {
    switch (meal.complexity) {
      case Complexity.simple:
        return 'Simple';
      case Complexity.challenging:
        return 'Challenging';
      case Complexity.hard:
        return 'Hard';
      }
  }

  String get affordabilityText {
    switch (meal.affordability) {
      case Affordability.affordable:
        return 'Affordable';
      case Affordability.pricey:
        return 'Pricey';
      case Affordability.luxurious:
        return 'Luxurious';
      case Affordability.expensive:
        return 'Expensive';
      }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(MealDetailPage(selectedMeal: meal));
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CustomNetworkImage(
                imageUrl: meal.imageUrl,
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  decoration: BoxDecoration(
                    color: AppColors.blackColor.withOpacity(0.6),
                  ),
                  child: Column(
                    children: [
                      Text(
                        meal.title,
                        style: AppStyles.titleMedium(size: 16),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.access_time,
                              color: AppColors.whiteColor, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            '${meal.duration} min',
                            style: AppStyles.bodyMedium(),
                          ),
                          const SizedBox(width: 8),
                          Icon(Icons.local_dining,
                              color: AppColors.whiteColor, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            complexityText,
                            style: AppStyles.bodyMedium(),
                          ),
                          const SizedBox(width: 8),
                          Icon(Icons.attach_money,
                              color: AppColors.whiteColor, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            affordabilityText,
                            style: AppStyles.bodyMedium(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
