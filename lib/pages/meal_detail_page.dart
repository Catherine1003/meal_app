import 'package:flutter/material.dart';
import 'package:meal_app/core/common_widgets/custom_network_image.dart';

import '../core/app_styles/app_colors.dart';
import '../core/app_styles/app_styles.dart';
import '../core/models/meal_model.dart';

class MealDetailPage extends StatefulWidget {
  final Meal selectedMeal;
  const MealDetailPage({super.key,
  required this.selectedMeal});

  @override
  State<MealDetailPage> createState() => _MealDetailPageState();
}

class _MealDetailPageState extends State<MealDetailPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.selectedMeal.title,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.star),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomNetworkImage(
              imageUrl: widget.selectedMeal.imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 300,
            ),
            _buildSectionTitle(context, 'Ingredients'),
            _buildSectionContent(context, widget.selectedMeal.ingredients),
            _buildSectionTitle(context, 'Steps'),
            _buildSectionContent(context, widget.selectedMeal.steps),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
      child: Center(
        child: Text(
          title,
          style: AppStyles.titleMedium(size: 16,
          color: AppColors.primaryColorLight),
        ),
      ),
    );
  }

  Widget _buildSectionContent(BuildContext context, List<String> items) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 4),
        color: AppColors.colorCardPrimary.withOpacity(0.1),
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.circle, size: 10),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      items[index],
                      style: AppStyles.bodyMedium(),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}