import 'package:flutter/material.dart';
import 'package:recycle/home.dart';
import 'package:recycle/rewards.dart';
import './history.dart';
import './community.dart';


class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  Center(
        child:Column(
        children: [
          SizedBox(height: 50,),
          Image.asset('images/profilepic.jpg' , width: 200,height: 100,),
          Text('username'),
          SizedBox(height: 30),
          
          GestureDetector(onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => HistoryPage()));
          },

          
          child: Text('History' , style: TextStyle(
            color: Colors.green,
          fontSize: 20),
          
          ),
          
          ),
           SizedBox(height: 30),
         GestureDetector(onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => MyCommunityPage()));
          },
          child: Text('My community' , style: TextStyle(
            color: Colors.green,
          fontSize: 20),
          
          ),
          ),
           SizedBox(height: 30),
          GestureDetector(onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => RewardsPage()));
          },
          child: Text('Rewards' , style: TextStyle(
            color: Colors.green,
          fontSize: 20),
          
          ),
          ),

          SizedBox(height: 30),
          GestureDetector(onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
          },
          child: Text('Logout' , style: TextStyle(
            color: Colors.green,
          fontSize: 20),
          
          ),
          ),
],
      )
      

      ),
      
      
      
    );
  }
}