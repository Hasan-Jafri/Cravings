import 'package:cravings/models/food.dart';
import 'package:flutter/material.dart';

class MyFoodTile extends StatelessWidget {
  final Food food;
  final void Function() onTap;
  const MyFoodTile({super.key, required this.food, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: Column(
              children: [
                Row(
                  children: [
                    //Text Food Details
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          food.name,
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                          "PKR ${food.price}",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          food.description,
                          style: TextStyle(
                              fontSize: 10,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary),
                        ),
                      ],
                    )),

                    SizedBox(
                      width: 5,
                    ),

                    // Food Image
                    ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          food.imagePath,
                          height: 120,
                          width: 120,
                        )),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
