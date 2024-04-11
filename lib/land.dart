import 'dart:math';
import 'package:flutter/material.dart';
import './goals.dart';
import './scan.dart';
import './maps.dart';
import './profile.dart';
import './leaderboard.dart';



class LandPage extends StatefulWidget {
  LandPage({Key? key}) : super(key: key);

  @override
  State<LandPage> createState() => _LandPageState();
}

class _LandPageState extends State<LandPage> {
  TextEditingController _searchController = TextEditingController();
  List<String> recyclingFacts = [
    "Recycling one aluminum can saves enough energy to run \na TV for three hours.",
    "Approximately 1 million sea birds die each\n year due to plastic ingestion.",
    "Recycling one glass bottle saves enough energy\n to power a computer for 30 minutes.",
    "Only 9% of plastic waste is recycled globally.",
    "Recycling one ton of paper saves\n 17 trees and 7,000 gallons of water."
  ];
  int reloadCount = 0;
  String currentFact = "";

  @override
  void initState() {
    super.initState();
    // Initialize the current fact with a random fact from the list
    currentFact = getRandomFact();
  }

  String getRandomFact() {
    Random random = Random();
    return recyclingFacts[random.nextInt(recyclingFacts.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'hi user',
          style: TextStyle(color: Colors.green),
        ),
      ),
      body: Column(
        children: [
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search for communities near you',
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green, width: 2),
              ),
              contentPadding: EdgeInsets.only(top: 25.0, left: 30.0),
            ),
          ),
          SizedBox(height: 20),
          // Stack widget to overlap the image and text
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'images/homeimage.png',
                width: 500,
                height: 300,
              ),
              // Positioned widget to position the text on top of the image
              Positioned(
                bottom: 200,
                left: 20,
                child: Text(
                  currentFact,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        blurRadius: 3.0,
                        color: Colors.black,
                        offset: Offset(1.0, 1.0),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: FooterWidget(),
    );
  }
}

class FooterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile()),
              );
            },
            icon: Icon(Icons.person),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LeaderboardPage()),
              );
            },
            icon: Icon(Icons.supervised_user_circle),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ScanWidget()),
              );
            },
            icon: Icon(Icons.camera_alt, size: 32),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MapsWidget()),
              );
            },
            icon: Icon(Icons.location_on),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GoalsWidget()),
              );
            },
            icon: Icon(Icons.check_circle),
          ),
        ],
      ),
    );
  }
}