import 'package:flutter/material.dart';

class MyDescriptionBox extends StatelessWidget {
  const MyDescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    var myPrimaryTextStyle = TextStyle(
        color: Theme.of(context).colorScheme.inversePrimary, fontSize: 10);
    var mySecondaryTextStyle =
        TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 12);

    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.secondary),
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Delivery Fee
            Column(
              children: [
                Text(
                  "99 PKR",
                  style: myPrimaryTextStyle,
                ),
                Text(
                  "Delivery fee",
                  style: mySecondaryTextStyle,
                )
              ],
            ),

            //delivery Time
            Column(
              children: [
                Text(
                  "15-30 mins",
                  style: myPrimaryTextStyle,
                ),
                Text(
                  "Delivery time",
                  style: mySecondaryTextStyle,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
