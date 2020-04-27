import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'landingHeaderPage.dart';
import 'worldWidePanel.dart';
import 'countryDetails.dart';
import 'precautionSymptomsPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

Map worldData;
var worldCases;
var worldDeaths;
var worldRecovered;
var worldCritical;

class _HomePageState extends State<HomePage> {
  getWorldData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v2/all');

    setState(() {
      worldData = jsonDecode(response.body);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getWorldData();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            LandingPageHeader(
              headerText: 'All you need\nis stay at home ',
              image: Image.asset(
                'images/doc_sitting_new.png',
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => PrecautionSymptomsPage(),
                  ),
                );
              },
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Worldwide Update',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Icon(
                    Icons.location_on,
                    color: Color.fromRGBO(19, 42, 168, 1),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            worldData != null
                ? WorldWidePanel(
                    worldData: worldData,
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
            SizedBox(height: 20),
            Container(
              child: Image.asset(
                'images/world_map',
                height: 170,
                width: double.infinity,
              ),
              margin: EdgeInsets.symmetric(horizontal: 10),
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => CountryDetails(),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(24, 55, 168, 1),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(
                          0.0, // horizontal, move right 10
                          0.9, // vertical, move down 10
                        ),
                      ),
                    ],
                  ),
                  child: Text(
                    'Get Country Details',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: Text(
                'WE ARE TOGETHER IN THE FIGHT!',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
