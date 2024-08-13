// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:collection/collection.dart';
import 'package:cravings/models/cart_item.dart';
import 'package:cravings/models/food.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Restaurant extends ChangeNotifier {
  final List<Food> _menu = [
    // Burgers

    Food(
        name: "BBQ Burger",
        description:
            "Smoked special BBQ burger serving with the finest Lettuce and things.",
        imagePath: "lib/images/burgers/bbq_burger.png",
        availableAddOns: [
          Addons(name: "Extra Cheese", price: 50),
          Addons(name: 'Extra Sauce', price: 30)
        ],
        category: FoodCategory.burgers,
        price: 650),
    Food(
        name: "Beef Burger",
        description:
            "For the Beef lovers out there with juciy meat and fresh sauce",
        imagePath: "lib/images/burgers/beef_burger.png",
        availableAddOns: [
          Addons(name: "Extra Cheese", price: 50),
          Addons(name: 'Extra Sauce', price: 30)
        ],
        category: FoodCategory.burgers,
        price: 550),
    Food(
        name: "Classic Cheese Burger",
        description:
            "A juciy patty with melted cheddar, lettuce, tomato, and a sot touch of onion and pickle",
        imagePath: "lib/images/burgers/cheesy_burger.png",
        availableAddOns: [
          Addons(name: "Extra Cheese", price: 50),
          Addons(name: 'Extra Sauce', price: 30),
          Addons(name: 'Extra Lettuce', price: 20),
        ],
        category: FoodCategory.burgers,
        price: 600),
    Food(
        name: "Hot Burger",
        description:
            "Coming up with the Spicy beef for the spice lovers, filled up with hotness of Red Chilli.",
        imagePath: "lib/images/burgers/Hot_beef_burger.png",
        availableAddOns: [
          Addons(name: "Extra Chilli", price: 40),
          Addons(name: 'Extra Ketchup', price: 30)
        ],
        category: FoodCategory.burgers,
        price: 500),
    Food(
        name: "Zinger Burger",
        description:
            "Double layered special Zinger for the eaters with two extra crispy patties.",
        imagePath: "lib/images/burgers/zinger_burger.png",
        availableAddOns: [
          Addons(name: "Extra Lettuce", price: 30),
          Addons(name: 'Extra Vegetables', price: 20)
        ],
        category: FoodCategory.burgers,
        price: 750),

    // Salad

    Food(
        name: "Caesar Salad",
        description:
            "Filled with the delightness of Chick Piece and Lettuce bringing the most refreshing Caeser salad you have ever tasted.",
        imagePath: "lib/images/salads/caesar_salad.png",
        availableAddOns: [
          Addons(name: "Extra Chick Piece", price: 30),
          Addons(name: 'Extra Onion', price: 20)
        ],
        category: FoodCategory.burgers,
        price: 550),
    Food(
        name: "Green Salad",
        description:
            "A refreshing mix of crisp lettuce, cucumbers, bell peppers, and green olives, topped with a zesty vinaigrette dressing.",
        imagePath: "lib/images/salads/green_salad.png",
        availableAddOns: [
          Addons(name: "Extra Avocado", price: 40),
          Addons(name: "Extra Olives", price: 20),
          Addons(name: "Extra Croutons", price: 30),
        ],
        category: FoodCategory.salads,
        price: 400),
    Food(
        name: "Orzo Salad",
        description:
            "A delightful salad featuring orzo pasta mixed with cherry tomatoes, cucumbers, feta cheese, and a lemon-herb dressing.",
        imagePath: "lib/images/salads/orzo_salad.png",
        availableAddOns: [
          Addons(name: "Extra Feta Cheese", price: 40),
          Addons(name: "Extra Olives", price: 20),
          Addons(name: "Extra Chicken", price: 60),
        ],
        category: FoodCategory.salads,
        price: 500),
    Food(
        name: "Pasta Salad",
        description:
            "A hearty pasta salad with penne pasta, sun-dried tomatoes, mozzarella, and a tangy balsamic vinaigrette.",
        imagePath: "lib/images/salads/pasta_salad.png",
        availableAddOns: [
          Addons(name: "Extra Mozzarella", price: 40),
          Addons(name: "Extra Sun-Dried Tomatoes", price: 30),
          Addons(name: "Extra Grilled Chicken", price: 60),
        ],
        category: FoodCategory.salads,
        price: 550),
    Food(
        name: "Tortellini Salad",
        description:
            "Delicious tortellini pasta mixed with fresh spinach, roasted red peppers, and a creamy pesto dressing.",
        imagePath: "lib/images/salads/tortellini_salad.png",
        availableAddOns: [
          Addons(name: "Extra Pesto", price: 30),
          Addons(name: "Extra Parmesan Cheese", price: 40),
          Addons(name: "Extra Grilled Chicken", price: 60),
        ],
        category: FoodCategory.salads,
        price: 600),

    // Desserts

    Food(
        name: "Chocolate Mousse",
        description:
            "A rich and creamy chocolate mousse made with high-quality cocoa, whipped to perfection, and topped with a sprinkle of chocolate shavings.",
        imagePath: "lib/images/desserts/chocolate_mousse.png",
        availableAddOns: [
          Addons(name: "Extra Whipped Cream", price: 30),
          Addons(name: "Extra Chocolate Shavings", price: 20),
          Addons(name: "Fresh Berries", price: 40),
        ],
        category: FoodCategory.desserts,
        price: 350),
    Food(
        name: "Cookie Bars",
        description:
            "Chewy and gooey cookie bars with chunks of chocolate chips and a hint of vanilla, baked to golden perfection.",
        imagePath: "lib/images/desserts/cookie_bars.png",
        availableAddOns: [
          Addons(name: "Extra Chocolate Chips", price: 20),
          Addons(name: "Vanilla Ice Cream Scoop", price: 40),
          Addons(name: "Caramel Sauce", price: 30),
        ],
        category: FoodCategory.desserts,
        price: 250),
    Food(
        name: "Falooda",
        description:
            "A traditional Pakistani dessert made with a blend of rose syrup, milk, vermicelli, basil seeds, and topped with a scoop of ice cream.",
        imagePath: "lib/images/desserts/falooda.png",
        availableAddOns: [
          Addons(name: "Extra Rose Syrup", price: 30),
          Addons(name: "Additional Ice Cream Scoop", price: 40),
          Addons(name: "Chopped Nuts", price: 20),
        ],
        category: FoodCategory.desserts,
        price: 400),
    Food(
        name: "Kheer",
        description:
            "A creamy rice pudding made with milk, sugar, and cardamom, garnished with almonds and saffron for a touch of elegance.",
        imagePath: "lib/images/desserts/kheer.png",
        availableAddOns: [
          Addons(name: "Extra Almonds", price: 20),
          Addons(name: "Extra Saffron", price: 30),
          Addons(name: "Additional Raisins", price: 25),
        ],
        category: FoodCategory.desserts,
        price: 300),
    Food(
        name: "Zarda",
        description:
            "A sweet and aromatic rice pudding cooked with saffron, raisins, nuts, and a blend of spices, offering a delightful and festive flavor.",
        imagePath: "lib/images/desserts/zarda.png",
        availableAddOns: [
          Addons(name: "Extra Nuts", price: 20),
          Addons(name: "Additional Saffron", price: 30),
          Addons(name: "Extra Raisins", price: 25),
        ],
        category: FoodCategory.desserts,
        price: 350),

    // Desi

    Food(
        name: "Biryani",
        description:
            "Fragrant basmati rice with tender meat or veggies, cooked with spices, saffron, and crispy onions.",
        imagePath: "lib/images/desi/biryani.png",
        availableAddOns: [
          Addons(name: "Extra Raita", price: 40),
          Addons(name: "Additional Salad", price: 30),
          Addons(name: "Extra Kebabs", price: 70),
          Addons(name: "Extra Fried Onions", price: 20),
        ],
        category: FoodCategory.desi,
        price: 300),
    Food(
        name: "Karahi",
        description:
            "Spicy meat or veggies stir-fried with tomatoes, green chilies, and traditional spices in a wok.",
        imagePath: "lib/images/desi/karahi.png",
        availableAddOns: [
          Addons(name: "Extra Naan", price: 30),
          Addons(name: "Additional Raita", price: 40),
          Addons(name: "Extra Green Chilies", price: 20),
        ],
        category: FoodCategory.desi,
        price: 350),
    Food(
        name: "Nihari",
        description:
            "Slow-cooked stew with tender meat, simmered in rich spices, best enjoyed with naan or parathas.",
        imagePath: "lib/images/desi/nihari.png",
        availableAddOns: [
          Addons(name: "Extra Naan", price: 30),
          Addons(name: "Additional Pickles", price: 20),
          Addons(name: "Extra Ginger", price: 20),
        ],
        category: FoodCategory.desi,
        price: 400),
    Food(
        name: "Pakoras",
        description:
            "Crispy, spiced fritters made with vegetables or meat, served with tangy chutneys.",
        imagePath: "lib/images/desi/pakoras.png",
        availableAddOns: [
          Addons(name: "Extra Chutney", price: 20),
          Addons(name: "Additional Onions", price: 30),
          Addons(name: "Extra Spicy Dip", price: 20),
        ],
        category: FoodCategory.desi,
        price: 250),
    Food(
        name: "Parathas",
        description:
            "Golden, flaky flatbreads made from whole wheat, perfect with any curry or yogurt.",
        imagePath: "lib/images/desi/paratha.png",
        availableAddOns: [
          Addons(name: "Extra Butter", price: 20),
          Addons(name: "Additional Stuffing", price: 30),
          Addons(name: "Extra Raita", price: 40),
        ],
        category: FoodCategory.desi,
        price: 100),

    // Sides

    Food(
        name: "Cauliflower Mash",
        description:
            "Creamy and buttery cauliflower mash, a low-carb twist on classic mashed potatoes, seasoned with a hint of garlic.",
        imagePath: "lib/images/sides/cauliflower_mash.png",
        availableAddOns: [
          Addons(name: "Extra Butter", price: 20),
          Addons(name: "Additional Herbs", price: 15),
        ],
        category: FoodCategory.sides,
        price: 300),
    Food(
        name: "Chicken Salad",
        description:
            "Tender chunks of chicken tossed with crisp greens, fresh veggies, and a tangy dressing for a light yet satisfying side.",
        imagePath: "lib/images/sides/chicken_salad.png",
        availableAddOns: [
          Addons(name: "Extra Dressing", price: 20),
          Addons(name: "Additional Chicken", price: 40),
          Addons(name: "Extra Avocado", price: 30),
        ],
        category: FoodCategory.sides,
        price: 350),
    Food(
        name: "Garlic Bread",
        description:
            "Toasted baguette slices topped with a buttery garlic spread and a sprinkle of parsley, perfect for dipping or enjoying on its own.",
        imagePath: "lib/images/sides/garlic_bread.png",
        availableAddOns: [
          Addons(name: "Extra Garlic Butter", price: 20),
          Addons(name: "Additional Cheese", price: 30),
        ],
        category: FoodCategory.sides,
        price: 250),
    Food(
        name: "Roasted Potatoes",
        description:
            "Crispy, golden roasted potatoes seasoned with herbs and spices, offering a delightful crunch and savory flavor.",
        imagePath: "lib/images/sides/roasted_potatoes.png",
        availableAddOns: [
          Addons(name: "Extra Herbs", price: 15),
          Addons(name: "Additional Dip", price: 20),
        ],
        category: FoodCategory.sides,
        price: 300),
    Food(
        name: "Smoky Sweet Potatoes",
        description:
            "Tender sweet potato cubes roasted with a smoky spice blend, offering a sweet and savory twist on a classic side.",
        imagePath: "lib/images/sides/smoky_sweet_potato.png",
        availableAddOns: [
          Addons(name: "Extra Smoky Spice", price: 20),
          Addons(name: "Additional Maple Syrup", price: 15),
        ],
        category: FoodCategory.sides,
        price: 320),

    // Drinks

    Food(
        name: "Chai",
        description:
            "A warm, aromatic tea brewed with spices and milk, offering a comforting and traditional Desi experience.",
        imagePath: "lib/images/drinks/chai.png",
        availableAddOns: [
          Addons(name: "Extra Sugar", price: 10),
          Addons(name: "Additional Spices", price: 15),
        ],
        category: FoodCategory.drinks,
        price: 100),
    Food(
        name: "Chocolate Shake",
        description:
            "Rich and creamy chocolate shake made with premium cocoa, blended with milk and ice cream for a decadent treat.",
        imagePath: "lib/images/drinks/chocolate_shake.png",
        availableAddOns: [
          Addons(name: "Extra Whipped Cream", price: 30),
          Addons(name: "Additional Chocolate Syrup", price: 20),
          Addons(name: "Marshmallows", price: 15),
        ],
        category: FoodCategory.drinks,
        price: 200),
    Food(
        name: "Kehwa",
        description:
            "Fragrant green tea infused with cardamom, saffron, and a touch of honey, offering a soothing and aromatic flavor.",
        imagePath: "lib/images/drinks/kehwa.png",
        availableAddOns: [
          Addons(name: "Extra Saffron", price: 20),
          Addons(name: "Additional Honey", price: 15),
        ],
        category: FoodCategory.drinks,
        price: 80),
    Food(
        name: "Lassi",
        description:
            "Refreshing and creamy yogurt-based drink, available in sweet or salted flavors, perfect for cooling down on a hot day.",
        imagePath: "lib/images/drinks/lassi.png",
        availableAddOns: [
          Addons(name: "Extra Mint", price: 15),
          Addons(name: "Additional Fruit Flavors", price: 20),
        ],
        category: FoodCategory.drinks,
        price: 200),
    Food(
        name: "Orange Juice",
        description:
            "Freshly squeezed orange juice, packed with vitamin C and a tangy, refreshing flavor to quench your thirst.",
        imagePath: "lib/images/drinks/orange_juice.png",
        availableAddOns: [
          Addons(name: "Extra Pulp", price: 15),
          Addons(name: "Additional Ice", price: 10),
        ],
        category: FoodCategory.drinks,
        price: 180),
  ];

  /*
  GETTERS
   */
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;

  // Delivery address (Which user can edit)
  String _deliveryAddress =
      "Appartment A-34,FB Area,Near Kainat Bakery, Karachi";
  /*
  OPERATIONS
   */

  //  User Cart
  final List<CartItem> _cart = [];

  // Add to Cart
  void addToCart(Food food, List<Addons> selectedAddons) {
    CartItem? cartitem = _cart.firstWhereOrNull((item) {
      // Check if the food items are the same
      bool isSameFood = item.food == food;

      // Check if the list of selected addons are the same
      bool isSameAddons =
          const ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;
    });

    // If item already exists
    if (cartitem != null) {
      cartitem.quantity++;
    }
    //Otherwise
    else {
      _cart.add(CartItem(food: food, selectedAddons: selectedAddons));
    }
    notifyListeners();
  }

  // Remove from Cart
  void removefromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);
    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  //Get Total price of Cart
  double getTotalPrice() {
    double total = 0;
    for (CartItem cartItem in _cart) {
      double itemtotal = cartItem.food.price;

      for (Addons addon in cartItem.selectedAddons) {
        itemtotal += addon.price;
      }

      total += itemtotal * cartItem.quantity;
    }

    return total;
  }

  // Total no. of items of the Cart
  int getTotalItemsInCart() {
    int totalItemCount = 0;
    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }

    return totalItemCount;
  }

  // Clear Cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  void updateDeliveryAddress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }

  /*
  HELPERS
   */

  //Generate Reciept
  String displayCartReciept() {
    final reciept = StringBuffer();
    reciept.writeln("Here's your reciept.");
    reciept.writeln();

    // Format the dateto includeup to seconds only
    String _formattedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    reciept.writeln(_formattedDate);
    reciept.writeln();

    reciept.writeln("----------");
    for (final cartItem in _cart) {
      reciept.writeln(
          "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
      if (cartItem.selectedAddons.isNotEmpty) {
        reciept.writeln("Addons: ${_formatAddons(cartItem.selectedAddons)}");
      }
    }
    reciept.writeln();
    reciept.writeln("----------");
    reciept.writeln();
    reciept.writeln("Total Items: ${getTotalItemsInCart()}");
    reciept.writeln("Total Price: ${_formatPrice((getTotalPrice()))}");
    reciept.writeln();
    reciept.writeln("Delivering to: $deliveryAddress");
    return reciept.toString();
  }

// Format Double Value into Money
  String _formatPrice(double price) {
    return "PKR +${price.toStringAsFixed(2)}";
  }
  // Format list of Addons into a string summary.

  String _formatAddons(List<Addons> addons) {
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
        .join(', ');
  }
}
