import 'package:flutter/material.dart';
import 'patient_report_page.dart';

void main() {
  runApp(TestPage());
}

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ColorQuizPage(),
    );
  }
}

class ColorQuizPage extends StatefulWidget {
  @override
  _ColorQuizPageState createState() => _ColorQuizPageState();
}

class _ColorQuizPageState extends State<ColorQuizPage> {
  int currentQuestion = 1;
  List<String> questions = [
    'lib/images/color 1.jpg',
    'lib/images/color 2.jpg',
    'lib/images/color 3.jpg',
  ];
  List<List<String>> options = [
    [
      "lib/images/color 2.jpg",
      "lib/images/color 3.jpg",
      "lib/images/color 1.jpg",
      "lib/images/color 5.jpg"
    ],
    [
      "lib/images/color 2.jpg",
      "lib/images/color 3.jpg",
      "lib/images/color 4.jpg",
      "lib/images/color 5.jpg"
    ],
    [
      "lib/images/color 1.jpg",
      "lib/images/color 2.jpg",
      "lib/images/color 4.jpg",
      "lib/images/color 3.jpg"
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('Color Quiz'),
      ),
      body: Stack(
        fit: StackFit
            .expand, // Expand the background image to cover the whole screen
        children: [
          // Background Image
          Image.asset(
            'lib/images/background2.jpg', // Adjust the path to your background image
            fit: BoxFit.cover, // Cover the whole screen
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Question $currentQuestion',
                  style: TextStyle(fontSize: 24),
                ),
                Image.asset(
                  questions[currentQuestion - 1], // Corrected asset path
                  width: 300,
                ),
                Text(
                  'Select the correct color:',
                  style: TextStyle(fontSize: 20),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                          options[currentQuestion - 1].take(2).map((option) {
                        return GestureDetector(
                          onTap: () {
                            // Handle user's answer here
                            // You can compare the selected option with the correct answer.
                            // For simplicity, this example doesn't include answer validation.
                            setState(() {
                              if (currentQuestion < questions.length) {
                                currentQuestion++;
                              }
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              option, // Corrected asset path
                              width: 100,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                          options[currentQuestion - 1].skip(2).map((option) {
                        return GestureDetector(
                          onTap: () {
                            // Handle user's answer here
                            // You can compare the selected option with the correct answer.
                            // For simplicity, this example doesn't include answer validation.
                            setState(() {
                              if (currentQuestion < questions.length) {
                                currentQuestion++;
                              }
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              option, // Corrected asset path
                              width: 100,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                if (currentQuestion == questions.length)
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ReportPage()),
                      );
                      // Handle the report button click
                      // This button appears only on the last question.
                    },
                    child: Text(
                      'Report',
                      style: TextStyle(fontSize: 18), // Adjust the font size
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.pink, // Change the button's background color
                      foregroundColor: Colors.white, // Change the text color
                      padding: EdgeInsets.symmetric(
                          vertical: 16, horizontal: 32), // Adjust padding
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10), // Adjust border radius
                      ),
                    ),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
