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
        backgroundColor: Colors.pink,
        title: Text('Report'),
      ),
      body: PinkAppBody(),
    );
  }
}

class PinkAppBody extends StatelessWidget {
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
                _showReportDialog(context); // Show the pop-up
                // Add your logic for sending reports to the doctor here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink, // Button background color
                foregroundColor: Colors.white, // Text color
                padding: EdgeInsets.all(16.0), // Button padding
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(8.0), // Button border radius
                ),
              ),
              child: Text(
                'Send Reports to Doctor',
                style: TextStyle(fontSize: 18.0), // Set text size
              ),
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
                backgroundColor: Colors.pink, // Change the button color
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

// Function to show the report dialog
void _showReportDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Reports sent to the Doctor'),
        content: Text('Thank you'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}
