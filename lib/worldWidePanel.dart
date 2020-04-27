import 'package:flutter/material.dart';

//class WorldWidePanel extends StatelessWidget {
//  final Color countColor;
//  final String countInfoText;
//  final String count;
//  final Color iconColor;
//
//  WorldWidePanel(
//      {this.countInfoText, this.countColor, this.count, this.iconColor});
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      height: 700,
//      width: double.infinity,
//      decoration: BoxDecoration(
//        borderRadius: BorderRadius.circular(15),
//        shape: BoxShape.rectangle,
//      ),
//      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
//      child: Column(
//        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//        children: <Widget>[
//          Icon(
//            Icons.adjust,
//            color: iconColor,
//            size: 15,
//          ),
//          Text(
//            count,
//            style: TextStyle(color: countColor, fontSize: 35),
//          ),
//          Text(countInfoText, style: TextStyle(color: countColor)),
//        ],
//      ),
//    );
//  }
//}

class WorldWidePanel extends StatelessWidget {
  final Map worldData;
  WorldWidePanel({this.worldData});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.adjust,
              color: Colors.red,
              size: 20,
            ),
            Text(
              worldData['cases'].toString(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 40, color: Colors.red),
            ),
            Text(
              'Infected',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, color: Colors.red),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                WorldDataCard(
                  count: worldData['deaths'].toString(),
                  text: 'Deaths',
                  color: Colors.orange,
                ),
                WorldDataCard(
                  count: worldData['recovered'].toString(),
                  text: 'Recovered',
                  color: Colors.green,
                ),
                WorldDataCard(
                  count: worldData['critical'].toString(),
                  text: 'Critical',
                  color: Colors.blueGrey,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class WorldDataCard extends StatelessWidget {
  final Color color;
  final String count;
  final String text;

  WorldDataCard({this.color, this.text, this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Icon(
            Icons.adjust,
            color: color,
            size: 15,
          ),
          Text(
            count,
            style: TextStyle(fontSize: 22, color: color),
          ),
          Text(
            text,
            style: TextStyle(fontSize: 16, color: color),
          ),
        ],
      ),
    );
  }
}

//GridView(
//shrinkWrap: true,
//gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//crossAxisCount: 2,
//childAspectRatio: 2,
//),
//children: <Widget>[
//WorldWidePanel(
//count: worldData['cases'].toString(),
//countColor: Colors.red,
//countInfoText: 'Infected',
//iconColor: Colors.red,
//),
//WorldWidePanel(
//count: worldData['deaths'].toString(),
//countColor: Colors.orange,
//countInfoText: 'Deaths',
//iconColor: Colors.orange,
//),
//WorldWidePanel(
//count: worldData['recovered'].toString(),
//countColor: Colors.green,
//countInfoText: 'Recovered',
//iconColor: Colors.green,
//),
//WorldWidePanel(
//count: worldData['critical'].toString(),
//countColor: Colors.grey,
//countInfoText: 'Critical',
//iconColor: Colors.grey,
//),
//],
//),
