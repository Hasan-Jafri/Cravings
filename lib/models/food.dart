class Food {
  final String name; // Zinger Burger
  final String description; // Beef Zinger
  final String imagePath; // ./images/zinger.jpg
  final double price; // PKR 600
  final FoodCategory category; // Burger
  List<Addons> availableAddOns; // [Ketchup, Fries, Sauce]
  Food(
      {required this.name,
      required this.description,
      required this.imagePath,
      required this.availableAddOns,
      required this.category,
      required this.price});
}

// Food Categories

enum FoodCategory {
  burgers,
  desi,
  salads,
  sides,
  desserts,
  drinks,
}

// food Add-ons
class Addons {
  String name;
  double price;

  Addons({required this.name, required this.price});
}
