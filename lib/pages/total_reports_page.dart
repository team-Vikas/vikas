import 'package:flutter/material.dart';
import 'doctor_report_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TotalReports(),
    );
  }
}

class TotalReports extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('User Reports'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate to the previous page
          },
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'lib/images/background2.jpg'), // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 80), // Adjust the spacing as needed
                ElevatedButton(
                  onPressed: () {
                    // Add your button 1 action here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: Size(300, 100), // Width and height
                  ),
                  child: Text('week 4 report'),
                ),
                SizedBox(height: 16), // Add some spacing between buttons
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ReportPage()),
                    );
                    // Add your button 2 action here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: Size(300, 100), // Width and height
                  ),
                  child: Text('week 3 report'),
                ),
                SizedBox(height: 16), // Add some spacing between buttons
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ReportPage()),
                    );
                    // Add your button 2 action here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: Size(300, 100), // Width and height
                  ),
                  child: Text('Week 2 report'),
                ),
                SizedBox(height: 16), // Add some spacing between buttons
                ElevatedButton(
                  onPressed: () {
                    // Add your button 2 action here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: Size(300, 100), // Width and height
                  ),
                  child: Text('Week 1 report'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
