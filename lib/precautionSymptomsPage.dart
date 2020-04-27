import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'landingHeaderPage.dart';
import 'quarantineTips.dart';

class PrecautionSymptomsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(242, 245, 244, 1),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            LandingPageHeader(
              headerText: 'Get to know\nabout Covid-19 ',
              image: Image.asset(
                'images/doc_sitting_new.png',
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Symptoms',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SymptomsCard(image: 'images/headache', text: 'Headache'),
                SymptomsCard(image: 'images/cough', text: 'Cough'),
                SymptomsCard(image: 'images/fever', text: 'Fever'),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Preventions',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            PreventionsCard(
              mainText: 'Wear face mask',
              img: 'images/wear_mask',
              infoText:
                  'Wearing face masks\nensures safety of everyone.\nAnyone caught without\none riska becoming\na social pariah.',
            ),
            SizedBox(
              height: 10,
            ),
            PreventionsCard(
              mainText: 'Wash your hands',
              img: 'images/wash_hands',
              infoText:
                  'This dieseases include\ngastrointenstinal infection,\nsuch as Salmonella,\nand respiratory infections\nsuch as Influenza.',
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                'What to do in this quarantine time?\nConfused?',
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => QuarantineTipsPage(),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(53, 72, 171, 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Show me tips',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
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

class SymptomsCard extends StatelessWidget {
  final String image;
  final String text;
  SymptomsCard({this.image, this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 130,
      width: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        shape: BoxShape.rectangle,
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            image,
            height: 90,
            width: 100,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class PreventionsCard extends StatelessWidget {
  final String img;
  final String mainText;
  final String infoText;

  PreventionsCard({this.img, this.infoText, this.mainText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: EdgeInsets.symmetric(vertical: 10),
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        shape: BoxShape.rectangle,
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset(img),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                mainText,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(infoText),
            ],
          ),
        ],
      ),
    );
  }
}
