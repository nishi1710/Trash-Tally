import 'package:flutter/material.dart';
import './home.dart';
import 'package:flutter/rendering.dart';

void main() {
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Home Page',
      debugShowCheckedModeBanner: false,
      home:  HomePage(),
    );
  }
}

// class HomePage extends StatelessWidget{
//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       body: Center
//       (
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//            Image.asset('images/home.png',width: 200, height: 100,),
//            ElevatedButton(onPressed: _navigateToLoginPage(context),)
//         ],
//         )
//         ,
        
//       )
//     );
//   }

//   Future<void> _navigateToLoginPage(BuildContext context) async{
//     await Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
//   }
// }

