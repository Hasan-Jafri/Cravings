import 'package:cravings/models/food.dart';
import 'package:flutter/material.dart';

class MyQuantitySelector extends StatelessWidget {
  final int quantity;
  final Food food;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  const MyQuantitySelector(
      {super.key,
      required this.quantity,
      required this.food,
      required this.onIncrement,
      required this.onDecrement});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary,
          borderRadius: BorderRadius.circular(50)),
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Decrease Button
          GestureDetector(
            onTap: onDecrement,
            child: Icon(
              Icons.remove,
              size: 15,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),

          // Quantity count
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SizedBox(
              width: 10,
              child: Center(
                child: Text(quantity.toString()),
              ),
            ),
          ),

          // Increase Button

          GestureDetector(
            onTap: onIncrement,
            child: Icon(
              Icons.add,
              size: 15,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
