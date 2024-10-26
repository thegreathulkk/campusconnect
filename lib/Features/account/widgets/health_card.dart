// events_screen.dart
import 'package:campusconnect/Constants/Global_veriable.dart';
import 'package:flutter/material.dart';

class HealthScreen extends StatefulWidget {
  @override
  _HealthScreenState createState() => _HealthScreenState();
}

class _HealthScreenState extends State<HealthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobaleVeriables.selectedNavBarColor,
        title: const Text('Health Camp'),
      ),
      body: ListView(
        children: [
          EventCard(
            eventName: 'Blood Donation ',
            eventDescription:
                'Blood donation is a noble act that saves lives. Donating blood, a vital resource, embodies compassion, community, and the power to heal.',
            authorName: 'City Hospital',
            location: 'Wing B, GF, Wipro Blr',
            date: ' 27 September 2023, 11AM to 12PM',
          ),
          EventCard(
            eventName: 'Yoga Session',
            eventDescription:
                'Yoga sessions promote well-being through mindfulness and physical harmony. They offer relaxation, stress relief, and holistic health benefits for body and mind.',
            authorName: 'Wipro Yoga Center',
            location: '1st Floor,B wing,kadathi blr',
            date: ' 21 September 2023, 9AM to 11PM',
          ),
          // Add more EventCards as needed
        ],
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String eventName;
  final String eventDescription;
  final String authorName;
  final String location;
  final String date;

  EventCard({
    required this.eventName,
    required this.eventDescription,
    required this.authorName,
    required this.location,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              eventName,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              eventDescription,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Orginized By: $authorName',
              style: TextStyle(fontSize: 14.0),
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Icon(Icons.location_on, size: 20.0),
                SizedBox(width: 4.0),
                Text(
                  location,
                  style: TextStyle(fontSize: 14.0),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.date_range_outlined),
                Text(date),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
