import 'package:CrossWordGame/screenEnd.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:word_search/word_search.dart';

import '../genre.dart';

class videoGameMedium extends StatefulWidget {
  videoGameMedium({Key key}) : super(key: key);

  @override
  _WordFindState createState() => _WordFindState();
}

class _WordFindState extends State<videoGameMedium> {
  GlobalKey<_WordFindWidgetState> globalKey = GlobalKey();

  List<WordFindQues> listQuestions;

  @override
  void initState() {
    super.initState();
    listQuestions = [
      WordFindQues(
        question: "What is the name of this game?",
        answer: "tekken",
        pathImage: "https://picfiles.alphacoders.com/238/238680.jpg",
      ),
      WordFindQues(
        question: "What is the name of this game?",
        answer: "fallout",
        pathImage: "https://picfiles.alphacoders.com/463/463476.jpg",
      ),
      WordFindQues(
        question: "What is the name of this game?",
        answer: "witcher",
        pathImage: "https://picfiles.alphacoders.com/203/203712.jpg",
      ),
      WordFindQues(
        question: "What is the name of this game?",
        answer: "portal",
        pathImage: "https://picfiles.alphacoders.com/460/460355.jpg",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/backgroung.jpg'),
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Container(
                      child: WordFindWidget(
                        constraints.biggest,
                        listQuestions.map((ques) => ques.clone()).toList(),
                        key: globalKey,
                      ),
                    );
                  },
                ),
              ),
              Container(
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => screenEnd()),
                    );
                  },
                  color: Colors.blue,
                  child: Text("finish"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class WordFindWidget extends StatefulWidget {
  Size size;
  List<WordFindQues> listQuestions;
  WordFindWidget(this.size, this.listQuestions, {Key key}) : super(key: key);

  @override
  _WordFindWidgetState createState() => _WordFindWidgetState();
}

class _WordFindWidgetState extends State<WordFindWidget> {
  Size size;
  List<WordFindQues> listQuestions;
  int indexQues = 0;
  int hintCount = 0;

  @override
  void initState() {
    super.initState();
    size = widget.size;
    listQuestions = widget.listQuestions;
    generatePuzzle();
  }

  @override
  Widget build(BuildContext context) {
    WordFindQues currentQues = listQuestions[indexQues];

    return Container(
      width: double.maxFinite,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => generateHint(),
                  child: Icon(
                    Icons.healing_outlined,
                    size: 45,
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () => generatePuzzle(left: true),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 45,
                        color: Colors.white,
                      ),
                    ),
                    InkWell(
                      onTap: () => generatePuzzle(next: true),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 45,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Container(
                alignment: Alignment.center,
                constraints: BoxConstraints(
                  maxWidth: size.width / 2 * 1.5,
                ),
                child: Image.network(
                  currentQues.pathImage,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text(
              "${currentQues.question ?? ''}",
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            alignment: Alignment.center,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: currentQues.puzzles.map((puzzle) {
                    Color color;

                    if (currentQues.isDone)
                      color = Colors.green[300];
                    else if (puzzle.hintShow)
                      color = Colors.white;
                    else if (currentQues.isFull)
                      color = Colors.red;
                    else
                      color = Color(0xff7EE7FD);

                    return InkWell(
                      onTap: () {
                        if (puzzle.hintShow || currentQues.isDone) return;

                        currentQues.isFull = false;
                        puzzle.clearValue();
                        setState(() {});
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: constraints.biggest.width / 7 - 6,
                        height: constraints.biggest.width / 7 - 6,
                        margin: EdgeInsets.all(3),
                        child: Text(
                          "${puzzle.currentValue ?? ''}".toUpperCase(),
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1,
                crossAxisCount: 8,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              itemCount: 16,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                bool statusBtn = currentQues.puzzles
                        .indexWhere((puzzle) => puzzle.currentIndex == index) >=
                    0;

                return LayoutBuilder(
                  builder: (context, constraints) {
                    Color color =
                        statusBtn ? Colors.white70 : Color(0xff7EE7FD);

                    return Container(
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: FlatButton(
                        height: constraints.biggest.height,
                        child: Text(
                          "${currentQues.arrayBtns[index]}".toUpperCase(),
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          if (!statusBtn) setBtnClick(index);
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void generatePuzzle({
    List<WordFindQues> loop,
    bool next: false,
    bool left: false,
  }) {
    if (loop != null) {
      indexQues = 0;
      this.listQuestions = new List<WordFindQues>();
      this.listQuestions.addAll(loop);
    } else {
      if (next && indexQues < listQuestions.length - 1)
        indexQues++;
      else if (left && indexQues > 0)
        indexQues--;
      else if (indexQues >= listQuestions.length - 1) return;

      setState(() {});

      if (this.listQuestions[indexQues].isDone) return;
    }

    WordFindQues currentQues = listQuestions[indexQues];

    setState(() {});

    final List<String> wl = [currentQues.answer];

    final WSSettings ws = WSSettings(
      width: 16,
      height: 1,
      orientations: List.from([
        WSOrientation.horizontal,
      ]),
    );

    final WordSearch wordSearch = WordSearch();

    final WSNewPuzzle newPuzzle = wordSearch.newPuzzle(wl, ws);

    if (newPuzzle.errors.isEmpty) {
      currentQues.arrayBtns = newPuzzle.puzzle.expand((list) => list).toList();
      currentQues.arrayBtns.shuffle();

      bool isDone = currentQues.isDone;

      if (!isDone) {
        currentQues.puzzles = List.generate(wl[0].split("").length, (index) {
          return WordFindChar(
              correctValue: currentQues.answer.split("")[index]);
        });
      }
    }

    hintCount = 0;
    setState(() {});
  }

  generateHint() async {
    WordFindQues currentQues = listQuestions[indexQues];

    List<WordFindChar> puzzleNoHints = currentQues.puzzles
        .where((puzzle) => !puzzle.hintShow && puzzle.currentIndex == null)
        .toList();

    if (puzzleNoHints.length > 0) {
      hintCount++;
      int indexHint = Random().nextInt(puzzleNoHints.length);
      int countTemp = 0;

      currentQues.puzzles = currentQues.puzzles.map((puzzle) {
        if (!puzzle.hintShow && puzzle.currentIndex == null) countTemp++;

        if (indexHint == countTemp - 1) {
          puzzle.hintShow = true;
          puzzle.currentValue = puzzle.correctValue;
          puzzle.currentIndex = currentQues.arrayBtns
              .indexWhere((btn) => btn == puzzle.correctValue);
        }

        return puzzle;
      }).toList();

      if (currentQues.fieldCompleteCorrect()) {
        currentQues.isDone = true;

        setState(() {});

        await Future.delayed(Duration(seconds: 1));
        totalScore++;
        print(totalScore);
        if (totalScore == listQuestions.length) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => screenEnd()));
        }
        print(listQuestions.length);
        generatePuzzle(next: true);
      }

      setState(() {});
    }
  }

  Future<void> setBtnClick(int index) async {
    WordFindQues currentQues = listQuestions[indexQues];

    int currentIndexEmpty =
        currentQues.puzzles.indexWhere((puzzle) => puzzle.currentValue == null);

    if (currentIndexEmpty >= 0) {
      currentQues.puzzles[currentIndexEmpty].currentIndex = index;
      currentQues.puzzles[currentIndexEmpty].currentValue =
          currentQues.arrayBtns[index];

      if (currentQues.fieldCompleteCorrect()) {
        currentQues.isDone = true;

        setState(() {});

        await Future.delayed(Duration(seconds: 1));
        totalScore++;
        print(totalScore);
        generatePuzzle(next: true);
      }
      setState(() {});
    }
  }
}

class WordFindQues {
  String question;
  String pathImage;
  String answer;
  bool isDone = false;
  bool isFull = false;
  List<WordFindChar> puzzles = new List<WordFindChar>();
  List<String> arrayBtns = new List<String>();

  WordFindQues({
    this.pathImage,
    this.question,
    this.answer,
    this.arrayBtns,
  });

  void setWordFindChar(List<WordFindChar> puzzles) => this.puzzles = puzzles;

  void setIsDone() => this.isDone = true;

  bool fieldCompleteCorrect() {
    bool complete =
        this.puzzles.where((puzzle) => puzzle.currentValue == null).length == 0;

    if (!complete) {
      this.isFull = false;
      return complete;
    }

    this.isFull = true;

    String answeredString =
        this.puzzles.map((puzzle) => puzzle.currentValue).join("");

    return answeredString == this.answer;
  }

  WordFindQues clone() {
    return new WordFindQues(
      answer: this.answer,
      pathImage: this.pathImage,
      question: this.question,
    );
  }
}

class WordFindChar {
  String currentValue;
  int currentIndex;
  String correctValue;
  bool hintShow;

  WordFindChar({
    this.hintShow = false,
    this.correctValue,
    this.currentIndex,
    this.currentValue,
  });

  getCurrentValue() {
    if (this.correctValue != null)
      return this.currentValue;
    else if (this.hintShow) return this.correctValue;
  }

  void clearValue() {
    this.currentIndex = null;
    this.currentValue = null;
  }
}
