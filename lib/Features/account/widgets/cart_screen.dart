import 'package:campusconnect/Constants/Global_veriable.dart';
import 'package:campusconnect/Features/account/widgets/cafe_menu.dart';
import 'package:campusconnect/Features/account/widgets/payment_page.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  final List<CartItem> cartItems;

  CartScreen({required this.cartItems});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late List<CartItem> cartItems;

  @override
  void initState() {
    super.initState();
    cartItems = widget.cartItems;
  }

  double calculateTotal() {
    double total = 0;
    for (var item in cartItems ?? []) {
      total +=
          item.price * item.quantity; // Calculate total price for each item
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobaleVeriables.selectedNavBarColor,
        title: Text('Your Cart'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final item = cartItems[index];
          return ListTile(
            title: Text(cartItems[index].name),
            subtitle: Text('\₹${cartItems[index].price.toStringAsFixed(2)}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (item.quantity > 1) {
                        item.quantity--;
                      }
                    });
                  },
                ),
                Text(item.quantity.toString()),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      item.quantity++;
                    });
                  },
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total: \₹${calculateTotal().toStringAsFixed(2)}'),
                ElevatedButton(
                  onPressed: () {
                    // Extracting names of items from cartItems
                    List<String> itemNames =
                        cartItems.map((item) => item.name).toList();

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentPage(
                          totalAmount: calculateTotal(),
                          items: itemNames, // Passing item names to PaymentPage
                        ),
                      ),
                    );
                    // You can handle checkout logic here if needed
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: GlobaleVeriables.selectedNavBarColor,
                  ),
                  child: Text('Checkout'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
//In the onPressed handler of the ElevatedButton used for checkout, the code extracts the names of items from cartItems and stores them in the itemNames list. Then, when navigating to the PaymentPage, it passes this list of item names (items) as a parameter to the PaymentPage constructor.

//Ensure that the PaymentPage widget has a constructor that accepts the items list:
