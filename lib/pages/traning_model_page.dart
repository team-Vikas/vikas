import 'package:flutter/material.dart';
import 'memory_game.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TrainingModelPage(),
    );
  }
}

class TrainingModelPage extends StatelessWidget {
  final List<String> options = [
    'Model 1',
    'Model 2',
    'Model 3',
    'Model 4',
    'Model 5',
    'Model 6',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Training Model'),
        backgroundColor: Colors.pink, // Set the background color of the AppBar
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
                  width: 200.0,
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MemoryGameApp()),
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
