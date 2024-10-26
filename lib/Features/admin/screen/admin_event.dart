import 'package:campusconnect/Features/admin/screen/admin_form.dart';
import 'package:campusconnect/Features/admin/screen/event/event_form.dart';
import 'package:campusconnect/Features/admin/screen/health/health_form.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ContainerButton(
              buttonText: 'Create Product',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductFormPage()),
                );
              },
            ),
            const SizedBox(height: 30),
            ContainerButton(
              buttonText: 'Create Event',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EventFormPage()),
                );
              },
            ),
            const SizedBox(height: 30),
            ContainerButton(
              buttonText: 'Create Health Camp',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HealthCampFormPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ContainerButton extends StatelessWidget {
  final String buttonText;
  final Function onPressed;

  ContainerButton({required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 70,
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        child: Text(
          buttonText,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan[800]),
      ),
    );
  }
}
