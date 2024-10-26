import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double rating;
  final Function()? onTap;

  ReusableCard({
    required this.imageUrl,
    required this.title,
    required this.rating,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: ListTile(
        onTap: onTap, // Added onTap function here
        leading: Container(
          width: 60,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(title),
        subtitle: Row(
          children: [
            Icon(Icons.star, color: Colors.blue),
            Text('$rating'),
          ],
        ),
      ),
    );
  }
}
