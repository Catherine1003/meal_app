import 'package:flutter/material.dart';
import 'package:meal_app/core/extensions/navigation_extension.dart';
import 'package:meal_app/core/models/json_data.dart';
import 'package:meal_app/pages/meal_list_page.dart';

import '../core/app_styles/app_colors.dart';
import '../core/app_styles/app_styles.dart';
import 'app_drawer.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer: AppDrawer(),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: JsonData.categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 3 / 2,
        ),
        itemBuilder: (context, index) {
          final category = JsonData.categories[index];
          return InkWell(
            onTap: () {
              context.push(MealListPage(selectedCategory: category));
            },
            splashColor: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(15),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    category.color,
                    category.color.withAlpha(20),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category.title,
                    style: AppStyles.labelLarge(color: AppColors.whiteColor),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}