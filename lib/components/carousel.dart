import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:oapp/widgets/quote_card.dart';
import 'package:oapp/widgets/size_animation_widget.dart';

class Carousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider.builder(
        itemCount: 15,
        itemBuilder: (BuildContext context, int itemIndex) => QuoteCard(),
        options: CarouselOptions(
          autoPlay: false,
          scrollPhysics: ScrollPhysics(),
          scrollDirection: Axis.horizontal,
          height: 500,
          viewportFraction: 0.65,
          initialPage: 1,
          enableInfiniteScroll: true,
        ),
      ),
    );
  }
}
