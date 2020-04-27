import 'package:flutter/material.dart';

class LandingPageHeader extends StatelessWidget {
  final Image image;
  final String headerText;
  final Function onTap;

  LandingPageHeader({this.image, this.headerText, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 20,
        top: 30,
      ),
      height: 230,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(80),
          bottomLeft: Radius.circular(0),
        ),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            //lighter to darker
            Color.fromRGBO(40, 100, 190, 1),
            Color.fromRGBO(19, 42, 168, 1),
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          image,
          Text(
            headerText,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w600,
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
