import 'package:flutter/material.dart';
import 'package:new_flutter/Navbar.dart';

void main() {
  runApp(const MaterialApp(home: Home()));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen height dynamically
    double screenHeight = MediaQuery.of(context).size.height;
    
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Background Image
            Positioned(
              top: 0,
              child: Container(
                width: MediaQuery.of(context).size.width, // Make it full width
                height: screenHeight * 0.6, // Take 60% of screen height
                child: Image.asset(
                  'assets/homeimg.png',
                  fit: BoxFit.cover, // Ensures it covers the entire space
                ),
              ),
            ),

            // Dynamic Positioned Text
            Positioned(
              top: screenHeight * 0.54, // Move text 65% down the screen
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "Prioritize Your Nutrition –\nIt Matters for a Health",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 31, 31, 31),
                    fontSize: screenHeight * 0.040, // Responsive font size
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          // Container(
          //   height: 30,
          // ),
            Positioned(
              top: screenHeight * 0.68, // Move text 65% down the screen
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "our diet is a bank account. Good food \n choices are good investments",
                  style: TextStyle(
                    color: Color.fromARGB(255, 89, 88, 88),
                    fontSize: screenHeight * 0.020, // Responsive font size
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              
            ),
            Positioned(
  top: screenHeight * 0.78,
  child: GestureDetector(
    onTap: () {
      print("Get Started Clicked!");
      // Navigate to another page or perform an action
    },
    child: Container(
      height: 40,
      width: 130,
      alignment: Alignment.center, // Centers the text inside
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 237, 140, 3),
        borderRadius: BorderRadius.circular(20), // Rounded edges
      ),
      child: Text(
        "Get Started",
        style: TextStyle(
          color: Colors.white, // Text color for contrast
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        textAlign: TextAlign.center, // Ensures centered text
      ),
    ),
  ),
),
Positioned(
  top: screenHeight * 0.90,
  child:Row(
    children: [
      Text("Don't have account?",
      style: TextStyle(color: Colors.grey,fontSize: 14),
      ),
      TextButton(
  onPressed: () {
    print("Signup Clicked!");
    // Add navigation or action here
  },
  child: Text(
    "Signup",
    style: TextStyle(
      color: Color.fromARGB(255, 236, 153, 8), // Orange color
      fontSize: 14,
      fontWeight: FontWeight.bold, // Optional: Makes text bold
    ),
  ),
)

    ],
  ) 
)

          ],
        ),
      ),
      // bottomNavigationBar: MyNavBar(), // Call the NavBar here
    );
  }
}
