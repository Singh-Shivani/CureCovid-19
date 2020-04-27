import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuarantineTipsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(252, 240, 230, 1),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Text(
                'Some Tips for\nQuarantine time!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TipsCard(
              img: 'images/stay_at_home.png',
              mainText: '\nStay home, be strong',
              paraText:
                  'Staying home can be tricky, especially for a long time. Sometimes, I do feel like this, squashed between my computer and my cat who demands to play with me.',
            ),
            TipsCard(
              img: 'images/yoga_and_sports.png',
              mainText: '\nSport and Yoga',
              paraText:
                  "I realized that sport or yoga helped us seeing things in a positive way. Whenever feeling sad or bored, doing yoga and sports with your favourite music changes the mind quickly and gives you a positive energy.",
            ),
            TipsCard(
              img: 'images/be_again_a_child.png',
              mainText: '\nBe that child again',
              paraText:
                  "It's a golden time to live that childhood again. Enjoye your time with your familly and give a home tour to your imaginary dog.",
            ),
            TipsCard(
              img: 'images/be_productive.png',
              mainText: '\nBe productive',
              paraText:
                  "Do whatever you wanted to do for ages, it's time to tick your bucket list. Keep your mind sane, be productive and stay healthy, stay home.",
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(103, 96, 171, 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Done',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

class TipsCard extends StatelessWidget {
  final String img;
  final String mainText;
  final String paraText;

  TipsCard({this.mainText, this.img, this.paraText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(img),
          Text(
            mainText,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            paraText,
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
