import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ReportPage(),
    );
  }
}

class ReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Report'),
      ),
      body: blueAppBody(),
    );
  }
}

class blueAppBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'lib/images/background2.jpg'), // Replace with your background image
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'lib/images/report.jpg', // Replace with your image
              width: 300,
              height: 300,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
                // Add your logic for navigating to the home screen here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Change the button color
                foregroundColor: Colors.white, // Change the text color
                padding: EdgeInsets.all(16.0), // Set button padding
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(8.0), // Set button border radius
                ),
              ),
              child: Text(
                'Home',
                style: TextStyle(fontSize: 18.0), // Set text size
              ),
            ),
          ],
        ),
      ),
    );
  }
}
