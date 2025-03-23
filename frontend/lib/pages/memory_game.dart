import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'test_page.dart';
import 'traning_model_page.dart';

void main() => runApp(MemoryGameApp());

class MemoryGameApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MemoryGame(),
    );
  }
}

class MemoryGame extends StatefulWidget {
  @override
  _MemoryGameState createState() => _MemoryGameState();
}

class _MemoryGameState extends State<MemoryGame> {
  List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.cyan,
    Colors.indigo,
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.teal,
    Colors.amber,
    Colors.cyan,
    Colors.indigo,
    Colors.teal,
    Colors.amber,
  ];

  List<bool> isFlipped = List.generate(20, (index) => false);
  int? firstCardIndex;
  int? secondCardIndex;
  int pairsFound = 0;
  bool isProcessing = false;
  bool gameCompleted = false;

  VideoPlayerController? _controller;

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _showHowToPlayVideo(BuildContext context) async {
    _controller = VideoPlayerController.asset('lib/vedios/sample_vedio.mp4');

    await _controller!.initialize();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('How to Play'),
          content: AspectRatio(
            aspectRatio: _controller!.value.aspectRatio,
            child: VideoPlayer(_controller!),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _controller!.pause();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );

    await _controller!.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          AppBar(
            title: Text('Memory Game'),
            backgroundColor: Colors.pink,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TrainingModelPage()),
                );
              },
            ),
          ),
          SizedBox(height: 16.0),
          SizedBox(
            width: double.infinity,
            height: 50.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  _showHowToPlayVideo(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.pink, // Use backgroundColor instead of primary
                ),
                child: Text(
                  'How to Play',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: colors.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      if (!isFlipped[index] &&
                          !isProcessing &&
                          !gameCompleted) {
                        setState(() {
                          isFlipped[index] = true;
                        });

                        if (firstCardIndex == null) {
                          firstCardIndex = index;
                        } else {
                          secondCardIndex = index;
                          checkForMatch();
                        }
                      }
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        color: isFlipped[index] ? colors[index] : Colors.pink,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                    ),
                  );
                },
              ),
            ),
          ),
          if (gameCompleted)
            Column(
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    resetGame();
                  },
                  child: Text('Play Again'),
                ),
                SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TestPage()),
                    );
                  },
                  child: Text('Next'),
                ),
              ],
            ),
        ],
      ),
    );
  }

  void checkForMatch() {
    setState(() {
      isProcessing = true;
    });

    Timer(Duration(milliseconds: 800), () {
      if (colors[firstCardIndex!] == colors[secondCardIndex!]) {
        isFlipped[firstCardIndex!] = true;
        isFlipped[secondCardIndex!] = true;
        pairsFound++;
        if (pairsFound == colors.length ~/ 2) {
          setState(() {
            gameCompleted = true;
          });
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Congratulations!'),
                content: Text('You won the game!'),
              );
            },
          );
        }
      } else {
        isFlipped[firstCardIndex!] = false;
        isFlipped[secondCardIndex!] = false;
      }
      firstCardIndex = null;
      secondCardIndex = null;
      isProcessing = false;
      setState(() {});
    });
  }

  void resetGame() {
    setState(() {
      colors.shuffle();
      isFlipped = List.generate(colors.length, (index) => false);
      firstCardIndex = null;
      secondCardIndex = null;
      pairsFound = 0;
      gameCompleted = false;
    });
  }
}
