import 'package:flutter/material.dart';
import './land.dart';

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
                CardWidget(color: Colors.yellow, category: 'Brown Glass'),
                SizedBox(width: 20),
                CardWidget(color: Colors.red, category: 'Shoes & Trash'),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CardWidget(color: Colors.blue, category: 'Battery & Metal'),
                SizedBox(width: 20),
                CardWidget(color: Colors.green, category: 'Biological & Clothes'),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: FooterWidget(),
    );
  }
}

class CardWidget extends StatelessWidget {
  final Color color;
  final String category;

  const CardWidget({Key? key, required this.color, required this.category}) : super(key: key);

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
            category,
            style: TextStyle(color: Colors.white, fontSize: 18),
            textAlign: TextAlign.center,
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
