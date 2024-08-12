import 'package:cravings/components/my_reciept.dart';
import 'package:cravings/models/restaurant.dart';
import 'package:cravings/services/database/firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';

class DeliveryProgressPage extends StatefulWidget {
  const DeliveryProgressPage({super.key});

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage> {
  // Drivers List
  List<String> drivers = [
    "Farhan Azeem",
    "Arif Khan",
    "Zaki Ali",
    "Kamran Ahmed",
    "Areeb Mustafa",
    "Kamal Hasan"
  ];
  Random random = Random();
  // get access to the database.
  FireStoreService db = FireStoreService();
  @override
  void initState() {
    super.initState();
    // Submit order to the Database.
    String reciept = context.read<Restaurant>().displayCartReciept();
    db.saveOrderToDatabase(reciept);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        final userCart = restaurant.cart;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Delivery in Progess.."),
            backgroundColor: Colors.transparent,
            centerTitle: true,
            leading: BackButton(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          bottomNavigationBar:
              userCart.isEmpty ? null : _buildBottomNavBar(context),
          body: userCart.isEmpty
              ? Center(
                  child: Text("Nothing to deliver."),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      MyReciept(),
                      Icon(
                        Icons.delivery_dining,
                        size: 120,
                        color: Theme.of(context).colorScheme.primary,
                      )
                    ],
                  ),
                ),
        );
      },
    );
  }

  // Custom Bottom Navigation bar
  Widget _buildBottomNavBar(BuildContext context) {
    int randomIndex = random.nextInt(drivers.length);
    return Container(
      padding: const EdgeInsets.all(25),
      height: 100,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          border: Border.all(color: Theme.of(context).colorScheme.primary),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      child: Row(
        children: [
          //Profile Pic of Driver
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                shape: BoxShape.circle),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person),
            ),
          ),

          SizedBox(
            width: 10,
          ),
          //Driver Details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                drivers[randomIndex],
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
              Text(
                "Driver",
                style: TextStyle(
                    fontSize: 10, color: Theme.of(context).colorScheme.primary),
              )
            ],
          ),

          const Spacer(),
          Row(
            children: [
              // Message Button
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    shape: BoxShape.circle),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.message),
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),

              SizedBox(
                width: 5,
              ),
              // Call Buttom
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    shape: BoxShape.circle),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.call_outlined),
                  color: Colors.green,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
