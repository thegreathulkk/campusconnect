import 'package:campusconnect/Features/home/services/home_services.dart';
import 'package:flutter/material.dart';

class AdminProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome, Admin Name', // Replace with the actual admin's name
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            TextButton(
              onPressed: () {
                // Navigate to Account Info page
                // You can implement the navigation logic here
              },
              child: const Text(
                'Account Info',
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {
                // Navigate to Total Sales page
                // You can implement the navigation logic here
              },
              child: const Text(
                'Total Sales',
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {
                // Navigate to Password Change page
                // You can implement the navigation logic here
              },
              child: const Text(
                'Password Change',
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {
                // Navigate to Help page
                // You can implement the navigation logic here
              },
              child: const Text(
                'Help',
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {
                HomeServices().logOut(context);
                // Implement logout logic
                // You can show a confirmation dialog and handle the logout process
              },
              child: const Text(
                'Logout',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
