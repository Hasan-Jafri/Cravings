import 'package:cravings/components/my_button.dart';
import 'package:cravings/components/my_cart_tile.dart';
import 'package:cravings/models/restaurant.dart';
import 'package:cravings/pages/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context, restaurant, child) {
      //cart
      final userCart = restaurant.cart;
      // Scaffold UI
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading:
              BackButton(color: Theme.of(context).colorScheme.inversePrimary),
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(
            "Cart",
            style:
                TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
          ),
          actions: [
            // clear cart button
            IconButton(
              onPressed: () {
                showDialog(
                    barrierColor:
                        Theme.of(context).colorScheme.primary.withOpacity(0.1),
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const Text(
                            "Are you sure you want to clear the cart?",
                            style: TextStyle(fontSize: 14),
                          ),
                          actions: [
                            // cancels
                            TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text(
                                  "Cancel",
                                  style: TextStyle(fontSize: 14),
                                )),
                            // yex
                            TextButton(
                                onPressed: () {
                                  restaurant.clearCart();
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  "Yes",
                                  style: TextStyle(fontSize: 14),
                                ))
                          ],
                        ));
              },
              icon: const Icon(Icons.delete),
              color: Theme.of(context).colorScheme.inversePrimary,
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
          child: Column(
            children: [
              // List of Cart
              Expanded(
                child: Column(
                  children: [
                    userCart.isEmpty
                        ? const Expanded(
                            child: Center(
                            child: Text(
                              "Cart is Empty...",
                              style: TextStyle(fontSize: 16),
                            ),
                          ))
                        : Expanded(
                            child: ListView.builder(
                                shrinkWrap: true,
                                padding: EdgeInsets.only(bottom: 10),
                                itemCount: userCart.length,
                                itemBuilder: (context, index) {
                                  // get individual cart item
                                  final cartItem = userCart[index];

                                  // Return Cart Tile UI
                                  return MyCartTile(cartItem: cartItem);
                                }),
                          )
                  ],
                ),
              ),

              // Button to Pay
              MyButton(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PaymentPage())),
                text: "Go to Checkout",
              ),
              const SizedBox(
                height: 25,
              )
            ],
          ),
        ),
      );
    });
  }
}
