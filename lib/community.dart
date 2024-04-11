import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:recycle/community2.dart';
import 'package:recycle/community3.dart';
import './community1.dart'; // Assuming this is your next page

class MyCommunityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Communities', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RecyclingActivity(
                    communityName: 'Green Society',
                    weightRecycled: '500 g',
                    communityImage: 'images/team1.jpg',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CommunityWidget1()), // Replace with your target page
                    ),
                  ),
                  SizedBox(height: 30),
                  RecyclingActivity(
                    communityName: 'Eco Warriors',
                    weightRecycled: '750 g',
                    communityImage: 'images/team2.jpg',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CommunityWidget2()), // Replace with your target page
                    ),
                  ),
                  SizedBox(height: 30),
                  RecyclingActivity(
                    communityName: 'Nature Lovers',
                    weightRecycled: '600 g',
                    communityImage: 'images/team3.jpg',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CommunityWidget3()), // Replace with your target page
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RecyclingActivity extends StatelessWidget {
  final String communityName;
  final String weightRecycled;
  final String communityImage;
  final Function() onTap; // Added a callback function for navigation

  const RecyclingActivity({
    required this.communityName,
    required this.weightRecycled,
    required this.communityImage,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector( // Wrap with GestureDetector
        onTap: onTap, // Call the onTap function on tap
        child: Row(
          children: [
            Image.asset(
              communityImage,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    communityName,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                  Text(
                    'Weight Recycled: $weightRecycled',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
