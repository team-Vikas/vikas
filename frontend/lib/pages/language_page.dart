import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Language(),
    );
  }
}

class Language extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('Choose your preferred language'),
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
                SizedBox(height: 100), // Adjust the spacing as needed
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()),
                    );
                    // Add your button 1 action here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.pink, // Use backgroundColor instead of primary
                    minimumSize: Size(300, 100), // Width and height
                  ),
                  child: Text('TELUGU'),
                ),
                SizedBox(height: 16), // Add some spacing between buttons
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()),
                    );
                    // Add your button 2 action here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.pink, // Use backgroundColor instead of primary
                    minimumSize: Size(300, 100), // Width and height
                  ),
                  child: Text('HINDI'),
                ),
                SizedBox(height: 16), // Add some spacing between buttons
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()),
                    ); // Add your button 2 action here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.pink, // Use backgroundColor instead of primary
                    minimumSize: Size(300, 100), // Width and height
                  ),
                  child: Text('ENGLISH'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
