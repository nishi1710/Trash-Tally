import 'package:flutter/material.dart';
import 'package:recycle/signup.dart';
import './land.dart';


class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController _controller = TextEditingController();
  var _enteredTextEmail = '';
  var _enteredTextPass = '';
  Color myColor = const Color(0x8FCE63);
  //List<String> stringList = [];
  
  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          flexibleSpace: Stack(
            children: <Widget>[
              Positioned(
                top: 28, // Adjust top position as needed
                left: 300, // Adjust left position as needed
                child: Text('LOGIN',style: TextStyle(color: Colors.green,
                fontSize: 25),)
              ),
              // Other flexibleSpace widgets if needed
              


            ],
          ),
          //title: const Text('Your Title'),
          actions: <Widget>[
            IconButton(
              icon: const  Icon(Icons.search),
              onPressed: () {
                // Do something
              },
            ),
            // Add more actions if needed
          ],
        ),
      ),
      //body: YourBodyWidget(),
    
      body: Padding(
        padding: const EdgeInsets.all(23.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onChanged: (text){
                setState(() {
                 _enteredTextEmail = text;
                });
              },
            ),
            const SizedBox(height: 20),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
              ),
              onChanged: (text){
                setState(() {
                 _enteredTextPass = text;
                });
              },
            ),
                         // onChanged: (text){
              //   setState(() {
              //    _enteredTextEmail = text;
              //   });
              // },
           
            SizedBox(height: 30),
            ElevatedButton(
              
              onPressed: () {

                printEnteredText();
                Navigator.push(context,MaterialPageRoute(builder: (context) => LandPage()) ,);
                // Perform login action
              },style: ButtonStyle(
                minimumSize: MaterialStateProperty.all((Size(325, 57))), 
                backgroundColor: MaterialStateProperty.all((const Color.fromARGB(255, 114, 217, 117))),
               ),
                
              child: const Text('Login',
              style: TextStyle(
                color: Color.fromARGB(255, 254, 254, 254),
                fontFamily: 'Paytone One',
                fontSize: 20),),
              
            ),
            SizedBox(height: 20),
            GestureDetector(onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
          },

          
          child: Text('Don’t have an account? Sign up' , style: TextStyle(
            color: Colors.green,
          fontSize: 20),
          
          ),
          ),

            
          ],
        ),
      ),
    );

    
  }

  void printEnteredText(){
    print(_enteredTextEmail);
    print(_enteredTextPass);
    }

  // void _showEnteredText(BuildContext context){
  //   showDialog(
  //     context: context,
  //    builder: (BuildContext context){
  //     return AlertDialog(
  //       title: Text('Enter text'),
  //       content: Text(_enteredText),
  //       actions: <Widget>[TextButton(onPressed: (){
  //         Navigator.of(context).pop();
  //       }, child: Text('close'),)],
  //     );

  //    }
  //    );
  //   }
  }

