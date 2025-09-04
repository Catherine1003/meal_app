import 'package:flutter/material.dart';
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
        activeColor: AppColors.colorGrey,
      ),
    );
  }
}