import 'package:campusconnect/Constants/Global_veriable.dart';
import 'package:campusconnect/Features/account/widgets/cart_screen.dart';
import 'package:campusconnect/Features/account/widgets/orders.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class CafeMenu extends StatefulWidget {
  @override
  _CafeMenuState createState() => _CafeMenuState();
}

class _CafeMenuState extends State<CafeMenu> {
  List<MenuItem> menuItems = [
    MenuItem(name: 'Coffee', isVeg: true, price: 2.99),
    MenuItem(name: 'Tea', isVeg: false, price: 1.99),
    MenuItem(name: 'Burger', isVeg: false, price: 4.99),
    MenuItem(name: 'Kadhai Paneer', isVeg: false, price: 220)
    // Add more items as needed
  ];

  List<CartItem> cartItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobaleVeriables.selectedNavBarColor,
        title: const Text('Wipro Cafe'),
      ),
      body: ListView.builder(
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          // Check if the item is already in the cart
          bool isItemInCart = cartItems.any((cartItem) =>
              cartItem.name == menuItems[index].name &&
              cartItem.price == menuItems[index].price);

          // Get the CartItem object from cartItems if it exists
          CartItem? addedItem = cartItems.firstWhereOrNull((cartItem) =>
              cartItem.name == menuItems[index].name &&
              cartItem.price == menuItems[index].price);

          return ListTile(
            title: Row(
              children: [
                Text(menuItems[index].name),
                const SizedBox(width: 10),
                Icon(
                  Icons.circle,
                  color: isItemInCart ? Colors.green : Colors.red,
                  size: 10,
                ),
              ],
            ),
            subtitle:
                Text('Price: \₹${menuItems[index].price.toStringAsFixed(2)}'),
            trailing: isItemInCart
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            if (addedItem != null && addedItem.quantity > 0) {
                              addedItem.quantity--;
                            }
                          });
                        },
                      ),
                      Text(
                        addedItem != null ? addedItem.quantity.toString() : '0',
                      ),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            if (addedItem != null) {
                              addedItem.quantity++;
                            }
                          });
                        },
                      ),
                    ],
                  )
                : IconButton(
                    icon: const Icon(Icons.add_box_outlined),
                    onPressed: () {
                      setState(() {
                        cartItems.add(CartItem(
                          name: menuItems[index].name,
                          isVeg: menuItems[index].isVeg,
                          price: menuItems[index].price,
                          quantity: 1,
                        ));
                      });
                    },
                  ),
            onTap: () {
              // Logic to navigate to cart screen with cartItems
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartScreen(cartItems: cartItems),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: cartItems.isNotEmpty
          ? FloatingActionButton.extended(
              onPressed: () {
                // Handle checkout logic here
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CartScreen(cartItems: cartItems)),
                );
                // You can use cartItems list for processing the order
                // showDialog(
                //   context: context,
                //   builder: (BuildContext context) {
                //     return AlertDialog(
                //       title: const Text('Order Summary'),
                //       content: Container(
                //         height: 500,
                //         width: 500,
                //         child: Column(
                //           children: cartItems.map((item) {
                //             return ListTile(
                //               title: Text(item.name),
                //               subtitle: Text(
                //                   'Price: \$${item.price.toStringAsFixed(2)}'),
                //             );
                //           }).toList(),
                //         ),
                //       ),
                //       actions: [
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           children: [
                //             TextButton(
                //               onPressed: () {
                //                 Navigator.of(context).pop();
                //               },
                //               child: const Text('Close'),
                //             ),
                //             TextButton(
                //               onPressed: () {},
                //               child: const Text('Make Payment'),
                //             ),
                //           ],
                //         ),
                //       ],
                //     );
                //   },
                // );
              },
              label: Text('My Cart'),
            )
          : null,
    );
  }
}

class MenuItem {
  final String name;
  final bool isVeg;
  final double price;

  MenuItem({
    required this.name,
    required this.isVeg,
    required this.price,
  });
}

class CartItem {
  final String name;
  final bool isVeg;
  final double price;
  int quantity; // Quantity of the item added to the cart

  CartItem({
    required this.name,
    required this.isVeg,
    required this.price,
    this.quantity = 0,
  });
}
