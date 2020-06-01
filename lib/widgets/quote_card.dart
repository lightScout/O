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
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.elliptical(100, 100),
//          topLeft: Radius.elliptical(100, 100),
            bottomRight: Radius.elliptical(100, 100),
            bottomLeft: Radius.elliptical(100, 100),
          ),
        ),
        width: 400,
        child: Center(
          child: GestureDetector(
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
