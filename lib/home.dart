import 'package:flutter/material.dart';
import 'package:hyft/screens/chats.dart';
import 'package:hyft/screens/matching.dart';
import 'package:hyft/screens/profile.dart';
import 'package:hyft/screens/progress.dart';
import 'package:hyft/screens/thoughts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        //showSelectedLabels: false,
        //showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bar_chart,
            ),
            label: 'Progress',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.candlestick_chart,
            ),
            label: 'Thoughts',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.group,
            ),
            label: 'Matching',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message,
            ),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }

  int _selectedIndex = 0;
  final List _children = [
    const Progress(),
    const Thoughts(),
    const Matching(),
    const Chats(),
    const Profile(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
