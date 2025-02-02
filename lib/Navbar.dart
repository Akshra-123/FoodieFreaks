import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

void main() {
  runApp(MaterialApp(home: MyNavBar()));
}

class MyNavBar extends StatefulWidget {
  @override
  _MyNavBarState createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Selected Index: $_currentIndex')),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(30),
        ),
        margin: EdgeInsets.all(16),
        child: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: [
            SalomonBottomBarItem(
              icon: Icon(Icons.home, color: Colors.orange),
              title: Container(),
              selectedColor: Colors.orange,
            ),
            SalomonBottomBarItem(
              icon: CircleAvatar(
                backgroundColor: Colors.orange,
                child: Icon(Icons.qr_code_scanner, color: Colors.black),
              ),
           title: Container(),
              selectedColor: Colors.orange,
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.person, color: Colors.orange),
                title: Container(),
              selectedColor: const Color.fromARGB(255, 255, 152, 0),
            ),
          ],
        ),
      ),
    );
  }
}
