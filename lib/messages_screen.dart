import 'package:flutter/material.dart';
import 'components/carousel.dart';

class MessagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFb5c6e0), Color(0xFFC8E5F9)]),
          ),
          child: Container(
            padding: EdgeInsets.only(top: 48),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
//                    Padding(
//                      padding: const EdgeInsets.all(15.0),
//                      child: InkWell(
//                        child: Icon(
//                          Icons.settings,
//                          color: Color(0xFFFFFFFF),
//                          size: 33,
//                        ),
//                        onTap: () {
//                          setState(() {});
//                        },
//                      ),
//                    ),
//                    Text(
//                      'checKit.',
//                      style: TextStyle(
//                          fontSize: 32,
//                          color: Color(0xFFdb4c40),
//                          fontWeight: FontWeight.w100,
//                          fontFamily: 'PoiretOne'),
//                    ),
//                        Icon(Icons.settings, color: Colors.white),
                  ],
                ),
                Center(
                    child: Padding(
                  padding: EdgeInsets.only(top: 200.0),
                  child: Carousel(),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
