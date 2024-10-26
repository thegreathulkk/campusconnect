import 'package:campusconnect/Constants/Global_veriable.dart';
import 'package:campusconnect/Features/auth/services/auth_service.dart';
import 'package:campusconnect/Features/home/services/home_services.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: GlobaleVeriables.selectedNavBarColor,
          title: const Text('Account'),
        ),
        body: UserOptions(),
      ),
    );
  }
}

class UserOptions extends StatelessWidget {
  final List<String> options = [
    'Account Information',
    'Change Password',
    'Order History',
    'Help',
    'About Us',
    'Log Out',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Akash', // Replace with the actual user's name
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const Divider(thickness: 1, color: Colors.grey),
        ListView.builder(
          shrinkWrap: true,
          itemCount: options.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(options[index]),
              onTap: () {
                HomeServices().logOut(context);
                // Handle option selection here
                // You can use a Navigator to navigate to the respective screens
              },
            );
          },
        ),
      ],
    );
  }
}
