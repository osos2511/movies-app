import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/colors_manager.dart';
import 'package:movies_app/screens/tabs/browse_tab.dart';
import 'package:movies_app/screens/tabs/home_tab/home_tab.dart';
import 'package:movies_app/screens/tabs/search_tab.dart';
import 'package:movies_app/screens/tabs/watch_list_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = [
    HomeTab(),
    SearchTab(),
    BrowseTab(),
    WatchListTab(),
  ];
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsManager.black,
        bottomNavigationBar:
        BottomNavigationBar(
          selectedItemColor: Color(0xFFFFBB3B),
          unselectedItemColor: Colors.white,
          currentIndex: selectedIndex,
          onTap: (value) {
          setState(() {
            selectedIndex=value;

          });
        },
          items: [
            BottomNavigationBarItem(backgroundColor:ColorsManager.black,icon: Icon(Icons.home),label: "home"),
            BottomNavigationBarItem(backgroundColor:ColorsManager.black,icon: Icon(Icons.search),label: "search"),
            BottomNavigationBarItem(backgroundColor:ColorsManager.black,icon: Icon(Icons.movie_sharp),label: "browse"),
            BottomNavigationBarItem(backgroundColor:ColorsManager.black,icon: Icon(Icons.bookmarks),label: "watchlist"),

          ],

        ),
        body: tabs[selectedIndex]

      ),
    );
  }
}
