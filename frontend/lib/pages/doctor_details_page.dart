import 'package:flutter/material.dart';
import 'patients_options_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DoctorDetailsPage(),
    );
  }
}

class DoctorDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Your Details'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'lib/images/background2.jpg'), // Replace with your background image path
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              UserDetailBox(label: 'Name'),
              UserDetailBox(label: 'Study'),
              UserDetailBox(label: 'Hospital'),
              UserDetailBox(label: 'Specialized In'),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PatientsOptionsPage()),
                  );
                  // Implement your logic to save user details here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.blue, // Use backgroundColor instead of primary
                  minimumSize: Size(200,
                      60), // Set the minimum width and height for the button
                ),
                child: Text(
                  'Save',
                  style: TextStyle(
                    fontSize: 20, // Adjust the font size of the text
                    color: Colors.white, // Set the color of the text
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class UserDetailBox extends StatelessWidget {
  final String label;

  UserDetailBox({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: label,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
