import 'package:flutter/material.dart';
import 'Second.dart';


class Display extends StatelessWidget {

  final int score;
  Display(this.score);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(211, 170, 221, 1),
      body: Column(
        children: [
          Expanded(
            flex: 2,
              child: Image.asset('Image/main_logo.png')
          ),

          const Expanded(
            flex: 1,
            child: Text(
              'Score',
              style: TextStyle(
                fontFamily: 'Lobster',
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Expanded(
            flex: 2,
              child: Text('$score',
                style: TextStyle(
                  fontFamily: 'Lobster',
                  fontSize: 100.0
                ),
              )
          ),

          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.all(20.0),
              margin: const EdgeInsets.all(60.0),
              child: ElevatedButton(
                child: const Text('Play again', style: TextStyle(fontSize: 30.0, color: Colors.brown), ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Second()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromRGBO(236, 213, 79, 1),
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                ),
              ),
            ),
          ),
          // Expanded(
          //     flex: 2,
          //     child: SizedBox(height: 20.0,),
          // ),
        ],
      ),
    );
  }
}
