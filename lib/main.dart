import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_travel_ui_app/Widgets/destination_carousel.dart';

import 'Widgets/hotel_carousel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter travel UI',
      theme: ThemeData(
        //primaryColor: Color(0xFF3EBACE),
        primaryColor: Colors.blue[800],
        //accentColor: Color(0xFFD8ECF1),
        accentColor: Colors.blue[100],
        scaffoldBackgroundColor: Color(0xFFF3F5F7),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 0 ;
  int _currentTab = 0 ;

  List<IconData> _icons =
      [FontAwesomeIcons.plane,
      FontAwesomeIcons.bed,
        FontAwesomeIcons.walking,
        FontAwesomeIcons.biking
      ] ;

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index ;
          print(_selectedIndex) ;
        });
      },
      child: Container (
        height: 60, width: 60,
          decoration: BoxDecoration(
            color: _selectedIndex==index ? Theme.of(context).accentColor : Colors.blue[50],

            borderRadius: BorderRadius.circular(30.0) ,
          ),
        child : Icon(_icons[index], size: 25.0,
          color: _selectedIndex==index? Theme.of(context).primaryColor : Colors.blue[200],) ,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 120.0),
              child: Text('What would you like to find?',
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),),
            ),
            SizedBox(height: 5.0
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _icons.asMap().entries.map((MapEntry map) => _buildIcon(map.key),).toList() ,
            ),
            SizedBox( height: 5.0),
           DestinationCarousel(),
           // SizedBox( height: 2.0),
            HotelCarousel(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index){
          setState(() {
            _currentTab = index;
          });
        },
        currentIndex: _currentTab,
        items: [
          BottomNavigationBarItem(
          icon: Icon(Icons.search, size: 30.0,),
          title: SizedBox.shrink()),

          BottomNavigationBarItem(
            icon: Icon(Icons.local_pizza, size: 30.0,),
            title: SizedBox.shrink(),  ),

          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 15.0,
              //backgroundImage: AssetImage('assets/images/vrishali.png'),
            ),
            title: SizedBox.shrink() ,
          ),

        ],

        ),



      );

  }
}


