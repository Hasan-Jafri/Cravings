import 'package:cravings/components/my_current_location.dart';
import 'package:cravings/components/my_description_box.dart';
import 'package:cravings/components/my_drawer.dart';
import 'package:cravings/components/my_food_tile.dart';
import 'package:cravings/components/my_silver_app_bar.dart';
import 'package:cravings/components/my_tab_bar.dart';
import 'package:cravings/models/food.dart';
import 'package:cravings/models/restaurant.dart';
import 'package:cravings/pages/food_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  //Sort out and return a list of food items that belong to a specific category.
  List<Food> _filterMenuByCetegory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  // Return list of foods in given category.
  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      // Get category menu
      List<Food> categoryMenu = _filterMenuByCetegory(category, fullMenu);
      return ListView.builder(
        itemBuilder: (context, index) {
          // Get Individual Food Item
          final food = categoryMenu[index];

          // Return Food Tile
          return MyFoodTile(
              food: food,
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FoodPage(food: food))));
        },
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                MySilverAppBar(
                  title: MyTabBar(tabController: _tabController),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Divider(
                          indent: 25,
                          endIndent: 25,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        // My Current Location
                        const MyCurrentLocation(),
                        // Description Box
                        const MyDescriptionBox(),
                        SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                  ),
                )
              ],
          body: Consumer<Restaurant>(
            builder: (context, restaurant, child) => TabBarView(
              controller: _tabController,
              children: getFoodInThisCategory(restaurant.menu),
            ),
          )),
    );
  }
}
