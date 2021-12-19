import 'package:flutter/material.dart';
import 'dart:math';
import 'Display.dart';
import 'dart:async';

class Second extends StatefulWidget {
  const Second({Key? key}) : super(key: key);

  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {

  bool next = true;
  int score = 0;
  Prime currNumber = Prime();

  void getRandomNumber() {
    var random = Random();

    if (score < 40) {
      currNumber.number = random.nextInt(125);
    }
    else {
      currNumber.number = random.nextInt(250);
    }

    currNumber.isaPrime();

  }
@override
  void incrementscore() {
    setState(() {
      ++score;
      getRandomNumber();
    });
  }

  //TIMER

  // late Timer _timer;
  // int _start = 60;
  //
  // void startTimer() {
  //   const oneSec = Duration(seconds: 1);
  //   _timer = Timer.periodic(
  //     oneSec,
  //           (Timer timer) {
  //           if (_start == 0) {
  //             Navigator.pushReplacement(
  //                 context,
  //                 MaterialPageRoute(builder: (context) => Display(score))
  //             );
  //           }
  //           else {
  //             setState(() {
  //               _start--;
  //             });
  //           }
  //           });
  // }
  // @override
  // void dispose() {
  //   _timer.cancel();
  //   super.dispose();
  // }

  Widget build(BuildContext context) {
    getRandomNumber();
    return Scaffold(
      backgroundColor: const Color.fromRGBO(211, 170, 221, 1),
      body: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                child: Image.asset('Image/main_logo.png'),
              ),
            ),


            // Expanded(
            //   flex: 1,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.end,
            //     children:  <Widget>[
            //       const Icon(Icons.timer),
            //       const SizedBox(width: 5,),
            //       Text(
            //         'start',
            //       )
            //     ],
            //   ),
            // ),


            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.all(20.0),
                child: Text(
                    '${currNumber.number}',
                  style: const TextStyle(
                    fontSize: 120.0,
                    fontFamily: 'Lobster',
                  ),
                ),
              ),
            ),


            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.all(20.0),
                    child: ElevatedButton(
                      child: const Text('No', style: const TextStyle(fontSize: 30.0, color: Colors.black), ),
                      onPressed: () {
                        if(!currNumber.isPrime) {
                          incrementscore();
                        }
                        else {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => Display(score))
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red[800],
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      ),
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.all(20.0),
                    child: ElevatedButton(
                      child: const Text('Yes', style: TextStyle(fontSize: 30.0, color: Colors.black), ),
                      onPressed: () {
                        if (currNumber.isPrime) {
                          incrementscore();
                        }
                        else {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => Display(score))
                          );
                        }

                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      ),
                    ),
                  ),


                ],
              ),
            ),

            const Expanded(
              flex: 2,
                child: SizedBox(height: 100.0,)
            ),



          ],
      ),
    );
  }
}


class Prime {
  late int number;
  late bool isPrime;

  void isaPrime() {
    int i, flag = 0;
    for (i = 2; i< number/2; i++) {
      if (number%i == 0) {
        flag = 1;
        break;
      }
    }

    if (1==number || number==0) {
      isPrime = false;
    }
    else {
      if (flag == 0){
        isPrime = true;
      }
      else{
        isPrime = false;
      }
    }
  }
}