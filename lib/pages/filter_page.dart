import 'package:flutter/material.dart';
import 'package:meal_app/core/services/hive_service.dart';
import '../core/app_styles/app_colors.dart';
import '../core/app_styles/app_styles.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  var _isVegan = false;
  var _isVegetarian = false;
  var _isLactoseFree = false;
  var _isGlutenFree = false;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<bool> loadData() async {
    _isGlutenFree = await HiveService().getFilterValue(1);
    _isLactoseFree = await HiveService().getFilterValue(2);
    _isVegetarian = await HiveService().getFilterValue(3);
    _isVegan = await HiveService().getFilterValue(4);
    setState(() {});
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          _buildSwitchListTile(
            title: 'Gluten-free',
            subtitle: 'Only include gluten-free meals',
            value: _isGlutenFree,
            onChanged: (newValue) {
              setState(() {
                _isGlutenFree = newValue;
                HiveService().setFilterValue(1, newValue);
              });
            },
          ),
          _buildSwitchListTile(
            title: 'Lactose-free',
            subtitle: 'Only include lactose-free meals',
            value: _isLactoseFree,
            onChanged: (newValue) {
              setState(() {
                _isLactoseFree = newValue;
                HiveService().setFilterValue(2, newValue);
              });
            },
          ),
          _buildSwitchListTile(
            title: 'Veg-free',
            subtitle: 'Only include veg meals',
            value: _isVegetarian,
            onChanged: (newValue) {
              setState(() {
                _isVegetarian = newValue;
                HiveService().setFilterValue(3, newValue);
              });
            },
          ),
          _buildSwitchListTile(
            title: 'Vegan-free',
            subtitle: 'Only include vegan meals',
            value: _isVegan,
            onChanged: (newValue) {
              setState(() {
                _isVegan = newValue;
                HiveService().setFilterValue(4, newValue);
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSwitchListTile({
    required String title,
    required String subtitle,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: SwitchListTile(
        title: Text(
          title,
          style: AppStyles.bodyLarge(size: 16),
        ),
        subtitle: Text(
          subtitle,
          style: AppStyles.bodyMedium(),
        ),
        value: value,
        onChanged: onChanged,
        activeColor: AppColors.primaryColorLight,
      ),
    );
  }
}