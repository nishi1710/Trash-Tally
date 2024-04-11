import 'package:flutter/material.dart';
import './login.dart';

class HomePage extends StatefulWidget{
  const HomePage ({super.key});
  
  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(

        children: [
          SizedBox(height: 50,),
          Image.asset('images/home.png'),
          SizedBox(height: 100),
          ElevatedButton(
            
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all((Size(300, 40))),
              backgroundColor: MaterialStateProperty.all((const Color.fromARGB(255, 114, 217, 117)))),
            onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context) => LoginPage()) ,);} , child: Text('RECYCLE' , style: TextStyle(color: Colors.white,
            fontSize: 30
          ),
          )
          )
        ]
        ,)
        ,)
    );
  }
}