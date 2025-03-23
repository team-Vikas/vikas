import 'package:cognitive_disability/pages/language_page.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(IntroApp());
}

class IntroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IntroPage(),
    );
  }
}

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  int currentPage = 1;
  PageController _pageController = PageController(initialPage: 0);

  void nextPage() {
    if (currentPage < 3) {
      setState(() {
        currentPage++;
      });
      _pageController.animateToPage(
        currentPage - 1,
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }

  void previousPage() {
    if (currentPage > 1) {
      setState(() {
        currentPage--;
      });
      _pageController.animateToPage(
        currentPage - 1,
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (page) {
          setState(() {
            currentPage = page + 1;
          });
        },
        children: [
          buildIntroPage(
              1,
              'Is your child is suffering Mentally',
              'Its Time to Enlighten Your Child Memory',
              'lib/images/page 1.jpg'),
          buildIntroPage(2, 'Searching for a Solution?',
              'Our App is perfect for your need', 'lib/images/page 2.jpg'),
          buildIntroPage(
              3,
              'Welcome To Vikas',
              'A destination in which your child love to learn',
              'lib/images/page 3.jpg',
              showGetStartedButton: true),
        ],
      ),
    );
  }

  Widget buildIntroPage(
      int pageNumber, String title, String description, String imagePath,
      {bool showGetStartedButton = false}) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold, // Make the text bold
                ),
              ),
              Text(
                description,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold, // Make the text bold
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (pageNumber > 1)
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: previousPage,
                ),
              if (pageNumber < 3)
                IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: nextPage,
                ),
              if (showGetStartedButton && pageNumber == 3)
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Language()),
                    );

                    // Handle "Get Started" button press.
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.pink, // Use backgroundColor instead of primary
                    minimumSize:
                        Size(200, 50), // Set the minimum width and height
                  ),
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                        fontSize: 18), // Adjust the font size of the text
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
