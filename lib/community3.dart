import 'package:flutter/material.dart';



class CommunityWidget3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Nature Lovers',
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),
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
                    memberName: 'Kevin Malone',
                    position: 'President',
                    weightContributed: '500 g',
                  ),
                  SizedBox(height: 30),
                  RecyclingActivity(
                    memberName: 'Michael Scott',
                    position: 'Secretary',
                    weightContributed: '750 g',
                  ),
                  SizedBox(height: 30),
                  RecyclingActivity(
                    memberName: 'Jim Halpert',
                    position: 'Member',
                    weightContributed: '600 g',
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
  final String memberName;
  final String position;
  final String weightContributed;

  const RecyclingActivity({
    required this.memberName,
    required this.position,
    required this.weightContributed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          // Remove the image section
          // Expanded(
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Text(
          //         memberName,
          //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
          //       ),
          //       Text(
          //         'Position: $position',
          //         style: TextStyle(fontSize: 16),
          //       ),
          //       Text(
          //         'Weight Contributed: $weightContributed',
          //         style: TextStyle(fontSize: 16),
          //       ),
          //     ],
          //   ),
          // ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  memberName,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
                ),
                Text(
                  'Position: $position',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Weight Contributed: $weightContributed',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}