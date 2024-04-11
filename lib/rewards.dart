import 'package:flutter/material.dart';

// class RewardsPage extends StatefulWidget {
//   const RewardsPage({super.key});

//   @override
//   State<RewardsPage> createState() => _RewardsPageState();
// }

// class _RewardsPageState extends State<RewardsPage> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

import 'dart:math';

//import 'package:flutter/material.dart';

class RewardsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rewards',style: TextStyle(color: Colors.green),),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 50), // Added space to move everything slightly higher
          Text(
            'Available Credits',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              '${Random().nextInt(100)}', // Random number generator
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BuyCouponsPage()),
              );
            },
            child: Text('Buy Coupons'),
          ),
          SizedBox(height: 20),
          Text(
            'Available Coupons',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center the coupons horizontally
            children: [
              CouponWidget(name: 'Coupon 1', discount: '50% off'),
              SizedBox(height: 10),
              CouponWidget(name: 'Coupon 2', discount: 'Free Shipping'),
              SizedBox(height: 10),
              CouponWidget(name: 'Coupon 3', discount: '\$10 Cashback'),
            ],
          ),
        ],
      ),
    );
  }
}

class CouponWidget extends StatelessWidget {
  final String name;
  final String discount;

  const CouponWidget({
    Key? key,
    required this.name,
    required this.discount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              'Discount: $discount',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class BuyCouponsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buy Coupons'),
      ),
      body: Center(
        child: Text('This is the Buy Coupons page'),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Rewards App',
    home: RewardsPage(),
    debugShowCheckedModeBanner: false, // Remove the debug banner
  ));
}