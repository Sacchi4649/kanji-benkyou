import 'package:flutter/material.dart';

import 'beranda.dart';
import 'kanji_list.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedNavIndex = 0;

  void _changeNavIndex(int index) {
    setState(() {
      _selectedNavIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: <Widget>[
        const Beranda(),
        const KanjiList(),
        // const Logout()
      ][_selectedNavIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: _changeNavIndex,
        indicatorColor: const Color.fromARGB(255, 69, 46, 201),
        backgroundColor: Colors.white,
        selectedIndex: _selectedNavIndex,
        destinations: <NavigationDestination>[
          NavigationDestination(
              icon: _selectedNavIndex == 0
                  ? const Icon(
                      Icons.home,
                      color: Colors.white,
                    )
                  : const Icon(Icons.home, color: Colors.black),
              label: ""),
          NavigationDestination(
              icon: _selectedNavIndex == 1
                  ? const Icon(
                      Icons.shelves,
                      color: Colors.white,
                    )
                  : const Icon(Icons.shelves, color: Colors.black),
              label: ""),
          NavigationDestination(
              icon: _selectedNavIndex == 2
                  ? const Icon(
                      Icons.logout,
                      color: Colors.white,
                    )
                  : const Icon(Icons.logout, color: Colors.black),
              label: ""),
        ],
      ),
    );
  }
}
