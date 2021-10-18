import 'package:flutter/material.dart';

class CustomButtonNavigation extends StatelessWidget {
   const CustomButtonNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.pink,
      backgroundColor: const Color.fromRGBO(55, 57, 84, 1),
      unselectedItemColor: const Color.fromRGBO(116, 117, 152, 1),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_rounded, size: 30,), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_bag, size: 26,), label: 'Shop'),
        BottomNavigationBarItem(icon: Icon(Icons.person, size: 30,), label: 'User'),
      ]
    );
  }
}