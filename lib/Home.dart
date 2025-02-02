import 'package:flutter/material.dart';
import 'package:new_flutter/Navbar.dart';

void main() {
  runApp(const MaterialApp(home: Home()));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Image.asset('assets/homeimg.png'),
      ),
      bottomNavigationBar:  MyNavBar(), // Call the NavBar here
    );
  }
}

// Custom Navigation Bar
// class Munabbare extends StatelessWidget {
//   const Munabbare({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       backgroundColor: Colors.black,
//       selectedItemColor: Colors.orange,
//       unselectedItemColor: Colors.grey,
//       items: const [
//         BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//         BottomNavigationBarItem(icon: Icon(Icons.qr_code_scanner), label: 'Scan'),
//         BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//       ],
//     );
//   }
// }
