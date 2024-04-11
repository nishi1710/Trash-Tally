import 'package:flutter/material.dart';

// class HistoryPage extends StatefulWidget {
//   const HistoryPage({super.key});

//   @override
//   State<HistoryPage> createState() => _HistoryPageState();
// }

// class _HistoryPageState extends State<HistoryPage> {
//   @override
//   Widget build(BuildContext context) {
//     return  MaterialApp(
//       title: 'Personal Goals',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.green, // Set primary color to green
//         backgroundColor: Colors.green.shade100, // Set background color to light green
//       ),
//       home: HistoryPage(),
//     );
//   }
// }

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History', style: TextStyle(color: Colors.black)), // Set title color to green
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                'Hello User',
                style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 10, 105, 14), fontWeight: FontWeight.bold), // Set text color to green, font size to 20, and bold
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                'Look at how much you have cleaned the earth',
                style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 10, 105, 14), fontWeight: FontWeight.bold), // Set text color to green, font size to 20, and bold
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RecyclingActivity(
                    imagePath: 'images/recycle1.jpg',
                    itemName: 'Plastic Bottle',
                    weight: '250 g',
                    pointsEarned: '10',
                    dateRecycled: 'April 1, 2024',
                  ),
                  RecyclingActivity(
                    imagePath: 'images/recycle2.jpg',
                    itemName: 'Newspaper',
                    weight: '500 g',
                    pointsEarned: '15',
                    dateRecycled: 'March 25, 2024',
                  ),
                  RecyclingActivity(
                    imagePath: 'images/recycle3.jpg',
                    itemName: 'Aluminum Cans',
                    weight: '350 g',
                    pointsEarned: '12',
                    dateRecycled: 'March 20, 2024',
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
  final String imagePath;
  final String itemName;
  final String weight;
  final String pointsEarned;
  final String dateRecycled;

  const RecyclingActivity({
    required this.imagePath,
    required this.itemName,
    required this.weight,
    required this.pointsEarned,
    required this.dateRecycled,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Image.asset(
            imagePath,
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
                  itemName,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Weight: $weight',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Points Earned: $pointsEarned',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Date Recycled: $dateRecycled',
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
  
