import 'package:chat_by_me/screens/home/chatList.dart';
import 'package:chat_by_me/screens/home/contact.dart';
import 'package:chat_by_me/screens/home/profile.dart';
import 'package:chat_by_me/screens/home/thoughts.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../main.dart';
import '../../models/user.dart';

class HomePageNavigationBar extends StatefulWidget {
  const HomePageNavigationBar({super.key, this.user});
  final User? user;

  @override
  State<HomePageNavigationBar> createState() => _HomePageNavigationBarState();
}

class _HomePageNavigationBarState extends State<HomePageNavigationBar> {
  var _currentIndex = 0;
  final _pages = [
    ChatListPage(),
    ContactsPage(),
    ThoughtsPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: Icon(Icons.chat),
            title: Text(
              "Shobetler",
              style: TextStyle(color: Colors.black),
            ),
            selectedColor: Color(0xFFFFC600),
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: Icon(Icons.contact_emergency),
            title: Text(
              "Kişiler",
              style: TextStyle(color: Colors.black),
            ),
            selectedColor: Color(0xFFFFC600),
          ),

          /// Search
          SalomonBottomBarItem(
            icon: Icon(Icons.sell_sharp),
            title: Text(
              "Durum",
              style: TextStyle(color: Colors.black),
            ),
            selectedColor: Color(0xFFFFC600),
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: Icon(Icons.person),
            title: Text(
              "Profil",
              style: TextStyle(color: Colors.black),
            ),
            selectedColor: Color(0xFFFFC600),
          ),
        ],
      ),
    );
  }
}
