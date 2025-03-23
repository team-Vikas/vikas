import 'package:flutter/material.dart';
import 'total_reports_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PatientDetailsPage(),
    );
  }
}

class PatientDetailsPage extends StatelessWidget {
  final List<String> options = [
    'Progres',
    'Reports',
    'Make a call',
    'Give Feedback',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Datails'),
        backgroundColor: Colors.blue, // Set the background color of the AppBar
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'lib/images/background2.jpg'), // Replace with your image asset path
            fit: BoxFit
                .cover, // You can adjust this property based on how you want the image to cover the container
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              for (var option in options)
                Container(
                  margin: EdgeInsets.all(10.0),
                  width: 250.0,
                  height: 100.0,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TotalReports()),
                      );
                      // Handle button selection here
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      backgroundColor:
                          Colors.blue, // Use backgroundColor instead of primary
                      minimumSize: Size(
                          double.infinity, 60), // Set the height and full width
                    ),
                    child: Text(option),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
