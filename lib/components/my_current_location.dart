import 'package:cravings/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCurrentLocation extends StatelessWidget {
  const MyCurrentLocation({super.key});

  void openLocationSearchBox(BuildContext context) {
    TextEditingController textController = TextEditingController();
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              alignment: Alignment.center,
              title: const Text("Your Location"),
              content: TextField(
                controller: textController,
                decoration: const InputDecoration(hintText: "Enter address.."),
              ),
              actions: [
                // Cancel button
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                    textController.clear();
                  },
                  child: const Text("Cancel"),
                ),
                //Save button
                MaterialButton(
                  onPressed: () {
                    // Update Delivery Address
                    String newAddress = textController.text;
                    context
                        .read<Restaurant>()
                        .updateDeliveryAddress(newAddress);
                    Navigator.pop(context);
                    textController.clear();
                  },
                  child: const Text("Save"),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Deliver now",
          style: TextStyle(
              color: Theme.of(context).colorScheme.primary, fontSize: 14),
        ),
        GestureDetector(
          onTap: () => openLocationSearchBox(context),
          child: Row(
            children: [
              //Address
              Consumer<Restaurant>(
                builder: (context, restaurant, child) => Text(
                  restaurant.deliveryAddress,
                  style: TextStyle(fontSize: 12),
                ),
              ),

              //Drop down menu
              const Icon(Icons.keyboard_arrow_down_rounded),
            ],
          ),
        ),
      ]),
    );
  }
}
