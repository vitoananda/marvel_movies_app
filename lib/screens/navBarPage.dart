import 'package:flutter/material.dart';
import 'package:marvel_movies_app/screens/aboutPage.dart';
import 'package:marvel_movies_app/screens/userPage.dart';
import 'homePage.dart';

class NavBarPage extends StatefulWidget {

  @override
  _NavBarPageState createState() => _NavBarPageState();
}
class _NavBarPageState extends State<NavBarPage> {
  @override

  int _selectedTabIndex = 0;
  void _onNavBarTapped (int index){
    setState((){
      _selectedTabIndex = index;
    });
  }

  Widget build(BuildContext context) {

    final _listpage = <Widget>[
      HomePage(),
      AboutPage(),
      UserPage()
    ];

    final _bottomNavBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: new Icon(Icons.home,),
          label: 'Home Page'
      ),
      BottomNavigationBarItem(
        icon: new Icon(Icons.question_mark),
        label: 'About',
      ),
      BottomNavigationBarItem(
        icon: new Icon(Icons.account_circle,),
        label: 'Profile',
      ),
    ];

    final _bottomNavbar = BottomNavigationBar(
      items: _bottomNavBarItems,
      currentIndex: _selectedTabIndex,
      backgroundColor: Colors.black,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.white,
      selectedLabelStyle: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w600),
      unselectedLabelStyle: TextStyle(fontFamily: 'Montserrat'),
      onTap: _onNavBarTapped,
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: _listpage[_selectedTabIndex],
      ),
      bottomNavigationBar: _bottomNavbar,
    );

  }
}