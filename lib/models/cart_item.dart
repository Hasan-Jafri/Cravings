import 'package:cravings/models/food.dart';

class CartItem {
  Food food;
  List<Addons> selectedAddons;
  int quantity;
  CartItem(
      {required this.food, this.quantity = 1, required this.selectedAddons});

  double get totalPrice {
    double addOnsPrice =
        selectedAddons.fold(0, (sum, addon) => sum + addon.price);
    return (food.price + addOnsPrice) * quantity;
  }
}
