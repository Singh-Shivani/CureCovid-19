import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

class CountryDetails extends StatefulWidget {
  @override
  _CountryDetailsState createState() => _CountryDetailsState();
}

var textInput;
Map countryData;
var countryCases;
var countryDeaths;
var countryRecovered;
var countryCritical;
var countryActive;

class _CountryDetailsState extends State<CountryDetails> {
  getCountryData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v2/countries/$textInput');
    setState(() {
      countryData = jsonDecode(response.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(223, 233, 243, 1),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Text(
                'Get details\nabout your\nCOUNTRY🌍',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 35,
                  color: Color.fromRGBO(10, 36, 114, 1),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                width: 400,
                padding: EdgeInsets.all(20),
                child: TextField(
                  onChanged: (value) {
                    textInput = value;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromRGBO(237, 241, 245, 1),
                    hintText: 'Enter country name',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    if (textInput != null) {
                      getCountryData();
                    } else {
                      Container();
                    }
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(10, 36, 114, 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'FIND',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            countryData != null
                ? CountryDataDetails(
                    countryData: countryData,
                  )
                : Container(),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    shape: BoxShape.rectangle,
                    color: Color.fromRGBO(10, 36, 114, 1),
                  ),
                  child: Text(
                    'BACK',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Image.asset('images/thankyou_img.jpg'),
            SizedBox(height: 30),
            Column(
              children: <Widget>[
                BottomFooter(
                  url:
                      'https://www.who.int/news-room/q-a-detail/q-a-coronaviruses',
                  text: 'Q&A on Covid-19',
                ),
                SizedBox(
                  height: 10,
                ),
                BottomFooter(
                  url:
                      'https://www.who.int/emergencies/diseases/novel-coronavirus-2019/donate',
                  text: 'Donate',
                ),
                SizedBox(
                  height: 10,
                ),
                BottomFooter(
                  url:
                      'https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters',
                  text: 'Myth Buster',
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Column(
                children: <Widget>[
                  Text(
                    'To everyone who are relentlessly fighting\nthis battle for our safety...',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    'WE SALUTE AND APPLAUD YOU.',
//                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ],
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

class CountryDataDetails extends StatelessWidget {
  final Map countryData;
  CountryDataDetails({this.countryData});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        shape: BoxShape.rectangle,
      ),
      margin: EdgeInsets.symmetric(vertical: 40, horizontal: 10),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Text(
                  countryData['country'],
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Image.network(
                  countryData['countryInfo']['flag'],
                  width: 140,
                  height: 140,
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Text(
                  'Total tests  ' + countryData['tests'].toString(),
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Total Deaths  ' + countryData['deaths'].toString(),
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Today's deaths  " + countryData['todayDeaths'].toString(),
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Total Cases  ' + countryData['cases'].toString(),
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Today's cases  " + countryData['todayCases'].toString(),
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Recovered  ' + countryData['recovered'].toString(),
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Active  ' + countryData['active'].toString(),
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Critical  ' + countryData['critical'].toString(),
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BottomFooter extends StatelessWidget {
  final String url;
  final String text;

  BottomFooter({this.url, this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launch(url);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromRGBO(0, 7, 45, 1),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
