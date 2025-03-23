import 'package:flutter/material.dart';
import 'traning_model_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TraningOptionsPage(),
    );
  }
}

class TraningOptionsPage extends StatelessWidget {
  final List<String> options = [
    'Organising',
    'Attention',
    'Remebering',
    'Problem-solving',
    'Reasoning',
    'Understanding',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Your Area of Training'),
        backgroundColor: Colors.pink,
      ),
      body: Container(
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
              for (var option in options)
                Container(
                  margin: EdgeInsets.all(10.0),
                  width: 200.0,
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TrainingModelPage()),
                      );
                      // Handle button selection here
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      backgroundColor:
                          Colors.pink, // Use backgroundColor instead of primary
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
