import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_flutter/Signup.dart';

class login extends StatelessWidget {
  const login({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFF47E3E), // Orange background
      body: Stack(
        children: [
          // Black Container with Rounded Top
          Positioned(
            top: size.height * 0.30, // Positioned lower for aesthetics
            child: Container(
              height: size.height * 0.70, // Takes up the rest of the screen
              width: size.width,
              decoration: const BoxDecoration(
                color: Color(0xFF161616),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(80),
                  topRight: Radius.circular(80),
                ),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 100),

                    // Google Login Icon
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     GestureDetector(
                    //       onTap: () {
                    //         // TODO: Add Google Sign-In functionality
                    //       },
                    //       child: const FaIcon(
                    //         FontAwesomeIcons.google,
                    //         size: 30,
                    //         color: Colors.white,
                    //       ),
                    //     ),
                    //   ],
                    // ),

                    const SizedBox(height: 90),

                    // Email Input
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email, color: Colors.grey),
                        hintText: "Enter your email",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),

                    const SizedBox(height: 35),

                    // Password Input
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock, color: Colors.grey),
                        hintText: "Enter your password",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),

                    const SizedBox(height: 50),

                    // Login Button
                    SizedBox(
                      width: 350,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 73, 73, 72),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "LOGIN",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Signup Link
                    Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min, // Makes the row take only necessary space
        mainAxisAlignment: MainAxisAlignment.center, // Centers the children inside the row
                        children: [
                          Text("Don't have Account?",
                          style: TextStyle(color: Colors.white,
                          fontWeight: FontWeight.w100
                          ),
                          textAlign: TextAlign.center,

                          ),
                          GestureDetector(
                            onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Signup()),
  );
},

                            child: const Text(
                              "Signup",
                              style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                                
                              ),
                               textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Welcome Text Above the Container
          Positioned(
          top: MediaQuery.of(context).size.height * 0.35, // 30% from the top
  left: MediaQuery.of(context).size.width * 0.05, // 5% from the left
  
            child: Column(
              children: const [
                Text(
                  "Welcome User",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Login through other means",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
