import 'package:cravings/models/food.dart';
import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget {
  final TabController tabController;
  const MyTabBar({super.key, required this.tabController});

  List<Tab> _buildCategoryTabs() {
    return FoodCategory.values.map((category) {
      return Tab(
        height: 50,
        text:
            category.toString().split('.').last.substring(0, 1).toUpperCase() +
                category
                    .toString()
                    .split('.')
                    .last
                    .substring(1, category.toString().split('.').last.length)
                    .toLowerCase(),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      tabAlignment: TabAlignment.start,
      splashFactory: InkSparkle.splashFactory,
      controller: tabController,
      tabs: _buildCategoryTabs(),
    );
  }
}
