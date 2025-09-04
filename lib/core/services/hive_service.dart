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

  Future<void> setFilterValue (int type, bool value) async {
    switch (type) {
      case 1:
        _box.put("gluten_free", value);
        break;
      case 2:
        _box.put("lactose_free", value);
        break;
      case 3:
        _box.put("veg_free", value);
        break;
      case 4:
        _box.put("vegan_free", value);
        break;
      default:
        _box.put("gluten_free", value);
    }
  }

  Future<bool> getFilterValue (int type) async {
    switch (type) {
      case 1:
        return await _box.get("gluten_free", defaultValue: false);
      case 2:
        return await _box.get("lactose_free", defaultValue: false);
      case 3:
        return await _box.get("veg_free", defaultValue: false);
      case 4:
        return await _box.get("vegan_free", defaultValue: false);
      default:
        return await _box.get("gluten_free", defaultValue: false);
    }
  }

  Future<bool> isFilterAvailable () async {
    return await _box.get("gluten_free", defaultValue: false) ||
        await _box.get("lactose_free", defaultValue: false) ||
        await _box.get("veg_free", defaultValue: false) ||
        await _box.get("vegan_free", defaultValue: false);
  }
}