import 'package:flutter/material.dart';

class MyNavitionBar extends StatefulWidget {
  const MyNavitionBar({super.key});

  @override
  State<MyNavitionBar> createState() => _MyNavitionBarState();
}

class _MyNavitionBarState extends State<MyNavitionBar> {
  
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(


      selectedIndex: _selectedIndex,
      onDestinationSelected: (index) => setState(() {
        _selectedIndex = index;
      }),


      destinations: [
        NavigationDestination(
            icon: Icon(
              Icons.phone,
              color: Colors.white,
            ),
            label: "Appel"),
        NavigationDestination(
            icon: Icon(
              Icons.group,
              color: Colors.white,
            ),
            label: "Groupe"),
        NavigationDestination(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            label: "Parametre"),
        NavigationDestination(
            icon: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            label: "Notification"),
        NavigationDestination(
            icon: Icon(
              Icons.chat,
              color: Colors.white,
            ),
            label: "Discussion"),
      ],
      backgroundColor: Colors.amber,
    );
  }
}
