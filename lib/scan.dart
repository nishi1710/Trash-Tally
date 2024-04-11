import 'package:flutter/material.dart';

class ScanWidget extends StatefulWidget {
  const ScanWidget({Key? key});

  @override
  State<ScanWidget> createState() => _ScanWidgetState();
}

class _ScanWidgetState extends State<ScanWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              'Upload a picture of the items to be recycled',
              style: TextStyle(color: Colors.green, fontSize: 20),
            ),
            SizedBox(height: 150),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CardWidget(color: Colors.yellow),
                SizedBox(width: 20),
                CardWidget(color: Colors.red),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CardWidget(color: Colors.blue),
                SizedBox(width: 20),
                CardWidget(color: Colors.green),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final Color color;

  const CardWidget({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      elevation: 4,
      margin: EdgeInsets.all(8),
      child: SizedBox(
        width: 150,
        height: 150,
        child: Center(
          child: Text(
            color.toString(),
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ScanWidget(),
  ));
}
