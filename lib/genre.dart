import 'package:CrossWordGame/difficulty/difficultyAnimal.dart';
import 'package:CrossWordGame/difficulty/difficultyFood.dart';
import 'package:CrossWordGame/difficulty/difficultyMovie.dart';
import 'package:CrossWordGame/difficulty/difficultyVideoGame.dart';
import 'package:flutter/material.dart';

var totalScore = 0;

class genre extends StatelessWidget {
  const genre({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/backgroung.jpg'),
                fit: BoxFit.cover)),
        child: Center(
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const difficultyVideoGame()),
                  );
                },
                child: Expanded(
                  child: Container(
                    height: 175,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage('assets/images/game.png'),
                    )),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            "Game",
                            style: TextStyle(
                                shadows: [
                                  Shadow(
                                    blurRadius: 5.0,
                                    color: Colors.yellow,
                                    offset: Offset(5.0, 5.0),
                                  ),
                                ],
                                fontSize: 25,
                                color: Colors.teal[400].withOpacity(0.85),
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                fontFamily: 'Open Sans'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const difficultyFood()),
                  );
                },
                child: Expanded(
                  child: Container(
                    height: 175,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/food.png'),
                            scale: 3)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            "Food",
                            style: TextStyle(
                                shadows: [
                                  Shadow(
                                    blurRadius: 5.0,
                                    color: Colors.yellow,
                                    offset: Offset(5.0, 5.0),
                                  ),
                                ],
                                fontSize: 25,
                                color: Colors.teal[400].withOpacity(0.85),
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                fontFamily: 'Open Sans'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const difficultyAnimal()),
                  );
                },
                child: Expanded(
                  child: Container(
                    height: 175,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/animal.png'),
                            scale: 4)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            "Animal",
                            style: TextStyle(
                                shadows: [
                                  Shadow(
                                    blurRadius: 5.0,
                                    color: Colors.yellow,
                                    offset: Offset(5.0, 5.0),
                                  ),
                                ],
                                fontSize: 25,
                                color: Colors.teal[400].withOpacity(0.85),
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                fontFamily: 'Open Sans'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const difficultyMovie()),
                  );
                },
                child: Expanded(
                  child: Container(
                    height: 175,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/movie.png'))),
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Movie",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                shadows: [
                                  Shadow(
                                    blurRadius: 5.0,
                                    color: Colors.yellow,
                                    offset: Offset(5.0, 5.0),
                                  ),
                                ],
                                fontSize: 25,
                                color: Colors.teal[400].withOpacity(0.85),
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                fontFamily: 'Open Sans'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
