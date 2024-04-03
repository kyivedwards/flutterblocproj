import 'package:flutter/material.dart';
import 'package:flutterblocproj/pages/navpages/bar_item_page.dart';
import 'package:flutterblocproj/pages/home_page.dart';
import 'package:flutterblocproj/pages/navpages/my_page.dart';
import 'package:flutterblocproj/pages/navpages/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [                                                        //List of page routes for navigation bar
    HomePage(),
    BarItemPage(),
    SearchPage(),
    MyPage()
  ];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(                                                  //Scaffold gives access to navigatin bar porperties
      backgroundColor: Colors.white,
      body: pages[currentIndex],                                                 
      bottomNavigationBar: BottomNavigationBar(                       //Bar typically takes list of items
        unselectedFontSize: 0,
        selectedFontSize: 0,                       
        onTap: onTap,                                                 //onTap binder
        type: BottomNavigationBarType.shifting,                       //Shift feature on nav bar icons
        backgroundColor: Colors.white,
        currentIndex: currentIndex,                         
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0,
        items: [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.apps)),
          BottomNavigationBarItem(label: "Bar", icon: Icon(Icons.bar_chart_sharp)),
          BottomNavigationBarItem(label: "Search", icon: Icon(Icons.search)),
          BottomNavigationBarItem(label: "My", icon: Icon(Icons.person)),
        ]
      ),
    ); 
  }
}