import 'package:flutter/material.dart';

class OrderReceivedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Order Received',
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text('Order Received'),
        // ),
        body: OrderDetails(),
      ),
    );
  }
}

class OrderDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order Details',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text('Order ID: #12345'),
            Text('Customer: Akash Sharma'),
            Text('Product:Chai'),
            Text('Total Amount: \$50.00'),
            SizedBox(height: 20.0),
            ActionButtons(),
          ],
        ),
      ),
    );
  }
}

class ActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.cyan[800], // Change the button color here
          ),
          onPressed: () => acceptOrder(context),
          child: Text('Accept Order'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.cyan[800], // Change the button color here
          ),
          onPressed: () => completeOrder(context),
          child: Text('Mark as Complete'),
        ),
      ],
    );
  }

  void acceptOrder(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Order Accepted!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        );
      },
    );
    // Additional logic to update order status in the backend
  }

  void completeOrder(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Order Marked as Complete!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        );
      },
    );
    // Additional logic to update order status in the backend
  }
}
