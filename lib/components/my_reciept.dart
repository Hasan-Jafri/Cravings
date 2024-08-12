import 'package:cravings/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MyReciept extends StatelessWidget {
  const MyReciept({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime time = DateTime.now().add(Duration(minutes: 20));
    DateFormat timeFormat = DateFormat('h:mm a');
    String formattedTime = timeFormat.format(time);
    return Padding(
      padding: const EdgeInsets.only(
        left: 25,
        right: 25,
        bottom: 25,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Thank you for your Order!"),
            const SizedBox(
              height: 25,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).colorScheme.secondary),
                  borderRadius: BorderRadius.circular(8)),
              padding: const EdgeInsets.all(25),
              child: Consumer<Restaurant>(
                  builder: (context, restaurant, child) =>
                      Text(restaurant.displayCartReciept())),
            ),
            const SizedBox(
              height: 25,
            ),
            Text("Estimated Delivery Time is ${formattedTime}")
          ],
        ),
      ),
    );
  }
}
