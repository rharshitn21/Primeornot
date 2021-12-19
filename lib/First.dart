import 'package:flutter/material.dart';
import 'Second.dart';
import 'package:flutter/services.dart';

class First extends StatefulWidget {
  const First({Key? key}) : super(key: key);

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  @override

  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      backgroundColor: Color.fromRGBO(211, 170, 221, 1),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 100.0),

            Container(
                  child: Image.asset('Image/main_logo.png'),
              ),

            SizedBox(height: 100.0),

            Container(
              padding: const EdgeInsets.all(20.0),
              margin: const EdgeInsets.all(60.0),
              child: ElevatedButton(
                child: Text('Start', style: TextStyle(fontSize: 60.0, color: Colors.brown), ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Second()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(236, 213, 79, 1),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                ),
              ),
            )
          ],
        ),
      ),

    );
  }
}
