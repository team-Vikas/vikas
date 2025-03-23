import 'package:flutter/material.dart';
import 'doctor_login.dart';
import 'user_login.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'lib/images/background1.jpg'), // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Welcome Message and Buttons
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 150.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Vikas',
                    style: TextStyle(
                      fontSize: 36,
                      color: Colors.pink,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the destination page when the button is clicked
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DoctorPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors
                          .white, // Use backgroundColor instead of primary
                      minimumSize: Size(200,
                          60), // Set the minimum width and height for the button
                    ),
                    child: Text(
                      'Doctor',
                      style: TextStyle(
                        fontSize: 20, // Adjust the font size of the text
                        color: Colors.blue, // Set the color of the text
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UserPage()),
                      );
                      // Handle sign-up button click
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors
                          .white, // Use backgroundColor instead of primary
                      minimumSize: Size(200,
                          60), // Set the minimum width and height for the button
                    ),
                    child: Text(
                      'User',
                      style: TextStyle(
                        fontSize: 20, // Adjust the font size of the text
                        color: Colors.red, // Set the color of the text
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
