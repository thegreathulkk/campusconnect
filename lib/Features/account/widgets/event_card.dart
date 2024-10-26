// events_screen.dart
import 'package:campusconnect/Constants/Global_veriable.dart';
import 'package:flutter/material.dart';

class EventsScreen extends StatefulWidget {
  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobaleVeriables.selectedNavBarColor,
        title: const Text('Events'),
      ),
      body: ListView(
        children: [
          EventCard(
            eventName: 'Workshop on Leadership',
            eventDescription:
                'A workshop on leadership is a transformative experience that equips individuals with the skills and mindset to inspire and guide others effectively. Participants learn essential leadership principles, communication strategies, and decision-making techniques.',
            authorName: 'John Doe',
            location: 'Wipro GNDC ',
            date: ' 27 September 2023',
          ),
          EventCard(
            eventName: 'Tech Show AI',
            eventDescription:
                'Tech shows featuring AI showcase groundbreaking innovations, from advanced algorithms to smart robotics. These events explore AI transformative potential, igniting curiosity and driving progress in various industries.',
            authorName: 'Alex andew',
            location: 'Wipro Grugram',
            date: ' 21 September 2023',
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
      margin: const EdgeInsets.all(16.0),
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
              'Author: $authorName',
              style: TextStyle(fontSize: 14.0),
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                Text(date)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
