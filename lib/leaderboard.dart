import 'package:flutter/material.dart';

// class Leaderboard extends StatefulWidget {
//   const Leaderboard({super.key});

//   @override
//   State<Leaderboard> createState() => _LeaderboardState();
// }

// class _LeaderboardState extends State<Leaderboard> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

//import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import './land.dart';

class LeaderboardPage extends StatefulWidget {
  @override
  _LeaderboardPageState createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  final List<LeaderboardEntry> leaderboardEntries = [
    LeaderboardEntry(name: 'Community 1', score: 250),
    LeaderboardEntry(name: 'Community 2', score: 200),
    LeaderboardEntry(name: 'Community 3', score: 180),
    LeaderboardEntry(name: 'Community 4', score: 150),
    LeaderboardEntry(name: 'Community 5', score: 120),
  ];

  String selectedCommunity1 = 'Community 1';
  String selectedCommunity2 = 'Community 2';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leaderboard'),
        actions: [
          DropdownButton<String>(
            value: selectedCommunity1,
            onChanged: (String? newValue) {
              setState(() {
                selectedCommunity1 = newValue!;
              });
            },
            items: leaderboardEntries.map((entry) {
              return DropdownMenuItem<String>(
                value: entry.name,
                child: Text(entry.name),
              );
            }).toList(),
          ),
          SizedBox(width: 10),
          DropdownButton<String>(
            value: selectedCommunity2,
            onChanged: (String? newValue) {
              setState(() {
                selectedCommunity2 = newValue!;
              });
            },
            items: leaderboardEntries.map((entry) {
              return DropdownMenuItem<String>(
                value: entry.name,
                child: Text(entry.name),
              );
            }).toList(),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Recycling Leaderboard',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: getMaxScore(),
                  barGroups: [
                    getBarChartGroup(selectedCommunity1),
                    getBarChartGroup(selectedCommunity2),
                  ],
                  titlesData: FlTitlesData(
                    bottomTitles: SideTitles(
                      showTitles: true,
                      getTextStyles: (value) => const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      margin: 10,
                      getTitles: (double value) {
                        if (value == 0) return selectedCommunity1;
                        if (value == 1) return selectedCommunity2;
                        return '';
                      },
                    ),
                    leftTitles: SideTitles(
                      showTitles: true,
                      getTextStyles: (value) => const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      margin: 10,
                      reservedSize: 30,
                      interval: getMaxScore() / 5,
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  gridData: FlGridData(
                    show: true,
                    drawHorizontalLine: true,
                    horizontalInterval: getMaxScore() / 5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: FooterWidget(),
    );
  }

  BarChartGroupData getBarChartGroup(String communityName) {
    final entry = leaderboardEntries.firstWhere((entry) => entry.name == communityName);
    return BarChartGroupData(
      x: leaderboardEntries.indexOf(entry),
      barRods: [
        BarChartRodData(
          y: entry.score.toDouble(),
          colors: [getBarColor(communityName)],
        ),
      ],
    );
  }

  Color getBarColor(String communityName) {
    if (communityName == selectedCommunity1) {
      return Colors.blue;
    } else if (communityName == selectedCommunity2) {
      return Colors.green;
    }
    return Colors.grey;
  }

  double getMaxScore() {
    return leaderboardEntries.map((entry) => entry.score).reduce((value, element) => value > element ? value : element).toDouble();
  }
}

class LeaderboardEntry {
  final String name;
  final int score;

  LeaderboardEntry({required this.name, required this.score});
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LeaderboardPage(),
    
  ));
}