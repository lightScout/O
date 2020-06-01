import 'package:flutter/material.dart';
import 'package:oapp/widgets/size_animation_widget.dart';

class QuoteCard extends StatefulWidget {
  final String title;
  QuoteCard({this.title});

  @override
  _QuoteCardState createState() => _QuoteCardState();
}

class _QuoteCardState extends State<QuoteCard> {
  @override
  Widget build(BuildContext context) {
    return SizeAnimation(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 5.0,
            ),
            color: Color(0xFFC3E6FE),
            borderRadius: BorderRadius.only(
              topRight: Radius.elliptical(100, 100),
//          topLeft: Radius.elliptical(100, 100),
              bottomRight: Radius.elliptical(100, 100),
              bottomLeft: Radius.elliptical(100, 100),
            ),
          ),
          child: Center(
            child: Text(
              widget.title,
              style: TextStyle(
                fontSize: 40,
                color: Color(0xFFA9BDDB),
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
