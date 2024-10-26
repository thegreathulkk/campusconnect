import 'package:campusconnect/Constants/Global_veriable.dart';
import 'package:campusconnect/Features/account/widgets/order_confirm.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  final double totalAmount; // Total order amount
  final List<String> items; // List of ordered items

  PaymentPage({required this.totalAmount, required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobaleVeriables.selectedNavBarColor,
        title: const Text('Payment Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Order Summary',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Items:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: items
                  .map(
                    (item) => Text(
                      '- $item',
                      style: const TextStyle(fontSize: 16),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 16),
            Text(
              'Total Amount: \$${totalAmount.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            const Text(
              'Payment Options:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Container(
              height: 60,
              width: 400,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: GlobaleVeriables.selectedNavBarColor,
                ),
                onPressed: () {
                  // Handle Google Pay payment
                  // You can implement the payment logic here
                  _onGooglePayPressed(context);
                },
                child: const Text('Pay with Google Pay'),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              height: 60,
              width: 400,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: GlobaleVeriables.selectedNavBarColor,
                ),
                onPressed: () {
                  // Handle Apple Pay payment
                  // You can implement the payment logic here
                },
                child: const Text('Pay with Apple Pay'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to handle Google Pay button press
  void _onGooglePayPressed(BuildContext context) {
    // Perform actions related to Google Pay here (e.g., payment processing)
    // After successful payment, navigate to the confirmation screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => OrderConfirmationScreen()),
    );
  }
}
