import 'package:cravings/components/my_button.dart';
import 'package:cravings/models/food.dart';
import 'package:cravings/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  final Map<Addons, bool> selectedAddons = {};
  final Food food;
  FoodPage({super.key, required this.food}) {
    for (Addons addon in food.availableAddOns) {
      selectedAddons[addon] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  void addToCart(Food food, Map<Addons, bool> selectedAddons) {
    List<Addons> currentAddons = [];
    for (Addons addon in widget.food.availableAddOns) {
      if (widget.selectedAddons[addon] == true) {
        currentAddons.add(addon);
      }
    }
    context.read<Restaurant>().addToCart(food, currentAddons);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Scaffold UI

        Scaffold(
          body: SingleChildScrollView(
            child: Column(children: [
              // Food Image
              ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5)),
                child: Image.asset(
                  widget.food.imagePath,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(
                    top: 25, bottom: 50, left: 25, right: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Food Name
                    Text(
                      widget.food.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Fod Price
                    Text(
                      "PKR ${widget.food.price}",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    // Fod Price
                    Text(
                      style: TextStyle(
                        fontSize: 12,
                      ),
                      widget.food.description,
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: Theme.of(context).colorScheme.secondary,
                    ),

                    SizedBox(
                      height: 25,
                    ),

                    Text(
                      "Add-ons",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    //AddOns
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color: Theme.of(context).colorScheme.secondary)),
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: widget.food.availableAddOns.length,
                        itemBuilder: (context, index) {
                          // get individial AddOn
                          Addons addon = widget.food.availableAddOns[index];

                          // return check box UI
                          return CheckboxListTile(
                              title: Text(
                                addon.name,
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              subtitle: Text(
                                "PKR ${addon.price}",
                                style: TextStyle(
                                    fontSize: 12,
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                              value: widget.selectedAddons[addon],
                              onChanged: (bool? value) {
                                setState(() {
                                  widget.selectedAddons[addon] = value!;
                                });
                              });
                        },
                      ),
                    ),
                    //Button => Add to Cart
                  ],
                ),
              ),
              MyButton(
                  onTap: () {
                    addToCart(widget.food, widget.selectedAddons);
                    showDialog(
                        barrierColor: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.1),
                        context: context,
                        builder: (context) => AlertDialog(
                              title: const Text(
                                "Item added to Cart",
                                style: TextStyle(fontSize: 14),
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text(
                                      "Ok",
                                      style: TextStyle(fontSize: 14),
                                    )),
                              ],
                            ));
                  },
                  text: "Add to Cart"),

              const SizedBox(
                height: 25,
              ),
            ]),
          ),
        ),

        // Back Button

        SafeArea(
            child: Opacity(
          opacity: 0.7,
          child: Container(
            margin: const EdgeInsets.only(left: 25),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                shape: BoxShape.circle),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_outlined),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ))
      ],
    );
  }
}
