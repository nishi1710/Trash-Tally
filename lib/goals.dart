import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import provider package

import './land.dart';

class GoalsWidget extends StatefulWidget {
  const GoalsWidget({Key? key}) : super(key: key); // Corrected super key

  @override
  State<GoalsWidget> createState() => _GoalsWidgetState();
}

class _GoalsWidgetState extends State<GoalsWidget> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserData(),
      child: MaterialApp(
        title: 'Personal Goals',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green, // Set primary color to green
          backgroundColor: Colors.green.shade100, // Set background color to light green
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class UserData extends ChangeNotifier {
  String username = 'User'; // Initialize with default username
  int tasksCompleted = 5;
  int totalTasks = 10;

  void setUsername(String name) {
    username = name;
    notifyListeners();
  }

  void updateTasksCompleted(int completed) {
    tasksCompleted = completed;
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  final Random _random = Random();

  final List<String> motivationalPhrases = [
    "Keep going, you're doing great!",
    "You're closer than you think!",
    "Every step brings you closer to your goals!",
    "Believe in yourself and keep pushing forward!",
    "You've got this!",
    "Stay focused and never give up!",
    "One step at a time, you'll get there!",
    "Success is just around the corner!",
    "Small progress is still progress!",
    "Your hard work will pay off!",
  ];

  @override
  Widget build(BuildContext context) {
    var userData = context.watch<UserData>(); // Use context.watch

    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Goals'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 16.0), // Adjust padding as needed
              child: Text(
                'Hello ${userData.username}',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: CircularProgressBar(
                  value: userData.tasksCompleted / userData.totalTasks,
                  tasksCompleted: userData.tasksCompleted,
                  totalTasks: userData.totalTasks,
                ),
              ),
            ),
            SizedBox(height: 20),
            Column(
              children: List.generate(
                2,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    motivationalPhrases[_random.nextInt(motivationalPhrases.length)],
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Not able to achieve the goal? Need help',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FindNgoPage()),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all((const Color.fromARGB(255, 114, 217, 117))),
                    ),
                    child: Text('Find NGO'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            SizedBox(height: MediaQuery.of(context).size.height * 0.25),
          ],
        ),
      ),
      bottomNavigationBar: FooterWidget(),
    );
  }
}

class CircularProgressBar extends StatelessWidget {
  final double value;
  final int tasksCompleted;
  final int totalTasks;

  const CircularProgressBar({
    required this.value,
    required this.tasksCompleted,
    required this.totalTasks,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: CustomPaint(
        painter: CircularProgressBarPainter(value: value, tasksCompleted: tasksCompleted, totalTasks: totalTasks),
      ),
    );
  }
}

class CircularProgressBarPainter extends CustomPainter {
  final double value;
  final int tasksCompleted;
  final int totalTasks;

  CircularProgressBarPainter({required this.value, required this.tasksCompleted, required this.totalTasks});

  @override
  void paint(Canvas canvas, Size size) {
    final double strokeWidth = 10;
    final Offset center = size.center(Offset.zero);
    final double radius = (size.shortestSide - strokeWidth) / 2;

    final Paint backgroundPaint = Paint()
      ..color = Colors.green.shade200 // Set progress bar background color to light green
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final Paint progressPaint = Paint()
      ..color = Colors.green // Set progress bar color to green
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawCircle(center, radius, backgroundPaint);
    final sweepAngle = 2 * pi * value;
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2, sweepAngle, false, progressPaint);

    final fractionText = '$tasksCompleted / $totalTasks'; // Displaying the fraction
    final textPainter = TextPainter(
      text: TextSpan(
        text: fractionText,
        style: TextStyle(
          color: Colors.black,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();
    final textX = center.dx - textPainter.width / 2;
    final textY = center.dy - textPainter.height / 2;
    textPainter.paint(canvas, Offset(textX, textY));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class FindNgoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Find NGO'),
      ),
      body: Center(
        child: Text('This is the Find NGO Page'),
      ),
    );
  }
}

