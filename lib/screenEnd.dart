import 'package:CrossWordGame/genre.dart';
import 'package:flutter/material.dart';

class screenEnd extends StatelessWidget {
  const screenEnd({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String message;
    if (totalScore < 2)
      message = "YOU ARE A BEGINNER";
    else if (totalScore == 2)
      message = "YOU ARE INTERMEDIATE";
    else
      message = "YOU ARE ADVANCED";

    return Scaffold(
      backgroundColor: Colors.purpleAccent[100],
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/backgroung.jpg'),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 100)),
            Text("Game Over !!",
                style: TextStyle(
                    shadows: [
                      Shadow(
                        blurRadius: 5.0,
                        color: Colors.yellow,
                        offset: Offset(5.0, 5.0),
                      ),
                    ],
                    fontSize: 70,
                    color: Colors.green[500].withOpacity(0.85),
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Open Sans'),
                textAlign: TextAlign.center),
            Padding(padding: EdgeInsets.only(top: 50)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Your Score: ",
                    style: TextStyle(
                        shadows: [
                          Shadow(
                            blurRadius: 5.0,
                            color: Colors.blue,
                            offset: Offset(5.0, 5.0),
                          ),
                        ],
                        fontSize: 40,
                        color: Colors.yellow[200].withOpacity(0.85),
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Open Sans'),
                    textAlign: TextAlign.center),
              ],
            ),
            Text("$totalScore",
                style: TextStyle(
                    shadows: [
                      Shadow(
                        blurRadius: 5.0,
                        color: Colors.blue,
                        offset: Offset(5.0, 5.0),
                      ),
                    ],
                    fontSize: 40,
                    color: Colors.yellow[200].withOpacity(0.85),
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Open Sans'),
                textAlign: TextAlign.center),
            SizedBox(
              height: 70,
            ),
            Text("$message",
                style: TextStyle(
                    shadows: [
                      Shadow(
                        blurRadius: 5.0,
                        color: Colors.blue,
                        offset: Offset(5.0, 5.0),
                      ),
                    ],
                    fontSize: 30,
                    color: Colors.yellow[200].withOpacity(0.85),
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Open Sans'),
                textAlign: TextAlign.center),
            Spacer(flex: 6),
            Align(
              alignment: Alignment.bottomCenter,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const genre()),
                  );
                  totalScore = 0;
                },
                color: Color.fromRGBO(92, 99, 221, .95),
                shape: StadiumBorder(),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  decoration: ShapeDecoration(
                    shape: StadiumBorder(),
                  ),
                  child: Text(
                    "MENU",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Open Sans'),
                  ),
                ),
              ),
            ),
            Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
