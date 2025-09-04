import 'package:hive/hive.dart';
import '../models/meal_model.dart';

class HiveService {
  final Box _box = Hive.box('storageBox');

  List<Meal> getAllMeals() {
    final data = _box.get("meals", defaultValue: []);
    return (data as List)
        .map((e) => Meal.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }

  Future<void> saveMeals(List<Meal> meals) async {
    List<Map<String, dynamic>> jsonList =
    meals.map((meal) => meal.toJson()).toList();
    await _box.put('meals', jsonList);
  }

  Future<void> addMeal(Meal meal) async {
    List<Meal> existingMeals = getAllMeals();
    existingMeals.add(meal);
    await saveMeals(existingMeals);
  }

  Future<void> deleteMeal(String id) async {
    List<Meal> meals = getAllMeals();
    meals.removeWhere((u) => u.id == id);
    await saveMeals(meals);
  }

  Future<bool> doesMealExist (String id) async {
    List<Meal> existingMeals = getAllMeals();
    bool value = existingMeals.where((e) => e.id == id).isNotEmpty == true;
    return value;
  }

  void clearData (){
    _box.clear();
  }
}