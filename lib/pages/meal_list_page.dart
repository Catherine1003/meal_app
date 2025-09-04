import 'package:flutter/material.dart';
import 'package:meal_app/core/common_widgets/custom_network_image.dart';
import 'package:meal_app/core/extensions/navigation_extension.dart';
import 'package:meal_app/core/models/json_data.dart';
import 'package:meal_app/core/services/hive_service.dart';
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
  bool isFilterAvailable = false;
  var _isVegan = false;
  var _isVegetarian = false;
  var _isLactoseFree = false;
  var _isGlutenFree = false;

  @override
  void initState(){
    super.initState();
    filteredMeals = JsonData.mealList.where((meal) {
      return meal.categories.contains(widget.selectedCategory.id);
    }).toList();
    loadData();
  }

  Future<bool> loadData() async {
    _isGlutenFree = await HiveService().getFilterValue(1);
    _isLactoseFree = await HiveService().getFilterValue(2);
    _isVegetarian = await HiveService().getFilterValue(3);
    _isVegan = await HiveService().getFilterValue(4);
    isFilterAvailable = _isGlutenFree || _isLactoseFree ||
        _isVegetarian || _isVegetarian;
    setState(() {});
    return true;
  }

  @override
  Widget build(BuildContext context) {
    var count = 0;

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
      body: (filteredMeals.isNotEmpty == true)
      ? ListView.builder(
        itemCount: filteredMeals.length,
        itemBuilder: (context, index) {
          if(isFilterAvailable){
            if((index == filteredMeals.length - 1) && count == 0 &&
                ((_isGlutenFree && filteredMeals[index].isGlutenFree) ||
                (_isLactoseFree && filteredMeals[index].isLactoseFree) ||
                (_isVegetarian && filteredMeals[index].isVegetarian) ||
                (_isVegan && filteredMeals[index].isVegan)) == false){
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.38),
                  Center(
                    child: Image.asset("assets/images/empty_data.png",
                        width: 100,
                        height: 100,
                    color: AppColors.primaryColorLight),
                  ),
                  const SizedBox(height: 12),
                  Center(
                    child: Text("No meals available for the filter!",
                        style: AppStyles.titleMedium(
                            size: 16
                        ),
                        textAlign: TextAlign.justify),
                  ),
                ],
              );
            } else if((_isGlutenFree && filteredMeals[index].isGlutenFree) ||
                (_isLactoseFree && filteredMeals[index].isLactoseFree) ||
                (_isVegetarian && filteredMeals[index].isVegetarian) ||
                (_isVegan && filteredMeals[index].isVegan)){
              count++;
              return MealCard(meal: filteredMeals[index],
                  onTap: (){
                    context.pushWithResult(MealDetailPage(
                        selectedMeal: filteredMeals[index])).then((val) {});
                  });}
          } else {
            return MealCard(meal: filteredMeals[index],
                onTap: (){
                  context.pushWithResult(MealDetailPage(
                      selectedMeal: filteredMeals[index])).then((val) {});
                });
          }
          return Container();
        },
      ) : SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset("assets/images/empty_data.png",
              width: 120,
              height: 120,
                  color: AppColors.primaryColorLight),
            ),
            const SizedBox(height: 12),
            Center(
              child: Text("No meals available in this category!",
                  style: AppStyles.titleMedium(
                      size: 16
                  ),
              textAlign: TextAlign.justify),
            ),
          ],
        ),
      ),
    );
  }
}

class MealCard extends StatefulWidget {
  final Meal meal;
  final bool? isFromFavorites;
  final Function() onTap;

  const MealCard({
    required this.meal,
    this.isFromFavorites,
    required this.onTap,
    super.key,
  });

  @override
  State<MealCard> createState() => _MealCardState();
}

class _MealCardState extends State<MealCard> {
  String get complexityText {
    switch (widget.meal.complexity) {
      case Complexity.simple:
        return 'Simple';
      case Complexity.challenging:
        return 'Challenging';
      case Complexity.hard:
        return 'Hard';
      }
  }

  String get affordabilityText {
    switch (widget.meal.affordability) {
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
      onTap: widget.onTap,
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
                imageUrl: widget.meal.imageUrl,
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
                        widget.meal.title,
                        style: AppStyles.titleMedium(size: 16,
                        weight: FontWeight.w700),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.access_time,
                              color: AppColors.whiteColor, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            '${widget.meal.duration} min',
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
