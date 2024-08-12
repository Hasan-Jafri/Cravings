import 'package:cravings/pages/cart_page.dart';
import 'package:flutter/material.dart';

class MySilverAppBar extends StatelessWidget {
  final Widget title;
  final Widget child;
  const MySilverAppBar({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 320,
      collapsedHeight: 150,
      title: const Text("Sunset Diner"),
      floating: false,
      pinned: true,
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CartPage())),
            icon: const Icon(Icons.shopping_cart))
      ],
      backgroundColor: Theme.of(context).colorScheme.surface,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      flexibleSpace: FlexibleSpaceBar(
        background: child,
        title: title,
        centerTitle: true,
        titlePadding: const EdgeInsets.only(top: 0, left: 0, right: 0),
        expandedTitleScale: 1,
      ),
    );
  }
}
