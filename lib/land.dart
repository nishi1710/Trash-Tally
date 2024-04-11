import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:carousel_slider/carousel_slider.dart';
import './profile.dart';
import 'leaderboard.dart';
import './scan.dart';
import './maps.dart';
import './goals.dart';
//import './login.dart';

class LandPage extends StatefulWidget{
   LandPage ({super.key});
  @override
  State<LandPage> createState() => _LandPageState();
  // TextEditingController _controller = TextEditingController();
  // var userName = '';
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Land Page',
      debugShowCheckedModeBanner: false,
      
    );
  }
  
}

class _LandPageState extends State<LandPage>{
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('hi userday',style: TextStyle(color: Colors.green),),
      
      
      ),
      

      body: 
       
       TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Search for communities near you',
          suffixIcon: Icon(Icons.search),
          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.green,
          width: 2)),
          contentPadding: EdgeInsets.only(top: 25.0 , left: 30.0),
          
        ),
        
        
      ),

      
      


       
      bottomNavigationBar: FooterWidget(),


      
        
       
    );
}
}

List<Widget> imageList = [
  Image.asset('images/home.png'),
  Image.asset('image/home.png'),
  Image.asset('image/home.png'),
];

class FooterWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return BottomAppBar(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [IconButton(onPressed: (){Navigator.push(context,PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => Profile(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.ease;
                  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                  var offsetAnimation = animation.drive(tween);
                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                },
              ),
            );}, icon: Icon(Icons.person)),
            IconButton(onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context) => LeaderboardPage()) ,);}, icon: Icon(Icons.supervised_user_circle)),
            IconButton(
              onPressed:(){Navigator.push(context,MaterialPageRoute(builder: (context) =>ScanWidget())); } , icon: Icon(Icons.camera_alt , size: 32)
            ),

            IconButton(onPressed:(){Navigator.push(context,MaterialPageRoute(builder: (context) => MapsWidget())); } , icon: Icon(Icons.location_on)),

            IconButton(onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context) => GoalsWidget())); }, icon: Icon(Icons.check_circle))

           
              ],),
    );
  }
}

