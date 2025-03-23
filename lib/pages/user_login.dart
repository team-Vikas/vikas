import 'package:cognitive_disability/pages/training_selection_page.dart';
import 'package:flutter/material.dart';
import 'package:cognitive_disability/components/my_button.dart';
import 'package:cognitive_disability/components/my_textfield.dart';
import 'user_details_page.dart';
import 'package:flutter/gestures.dart';
import 'training_selection_page.dart';

class UserPage extends StatelessWidget {
  UserPage({Key? key}) : super(key: key);

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Logo and Welcome Message
                Icon(
                  Icons.lock,
                  size: 100,
                ),
                Text(
                  'User Login!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),

                // Username Textfield
                MyTextField(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                ),

                // Password Textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                // Forgot Password
                TextButton(
                  onPressed: () {
                    // Implement forgot password logic
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                // Sign In Button
                MyButton(onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            TrainingOption()), // Push the HomePage route
                  );
                }
                    // Inside your login function or button press callback

                    ),

                // Or Continue With
                // Padding(
                //   padding: const EdgeInsets.symmetric(vertical: 16.0),
                //   child: Text(
                //     'Or continue with',
                //     textAlign: TextAlign.center,
                //     style: TextStyle(color: Colors.grey[700]),
                //   ),
                // ),

                // // Google and Apple Sign In Buttons
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     SquareTile(imagePath: 'lib/images/google.png'),
                //     SizedBox(width: 25),
                //     SquareTile(imagePath: 'lib/images/apple.png'),
                //   ],
                // ),

                // Not a Member? Register Now
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text.rich(
                    TextSpan(
                      text: 'Not a member? ',
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: 'Register now',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Handle the click event here, e.g., navigate to another page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UserDetailsPage()),
                              );
                            },
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
