import 'package:flutter/material.dart';

import '../core/app_styles/app_colors.dart';
import '../core/app_styles/app_styles.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.drawerColor,
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: AppColors.primaryColor,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset("assets/images/logo.png",
                height: 60,
                width: 60),
                const SizedBox(width: 16),
                Text(
                  'Cooking Up!',
                  style: AppStyles.headlineSmall(
                      color: AppColors.primaryColorLight),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.restaurant, color: AppColors.whiteColor),
            title: Text(
              'Meals',
              style: AppStyles.titleMedium(size: 20),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings, color: AppColors.whiteColor),
            title: Text(
              'Filters',
              style: AppStyles.titleMedium(size: 20),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}