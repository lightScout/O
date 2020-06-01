import 'package:flutter/material.dart';
import 'package:oapp/widgets/quote_card.dart';
import 'package:oapp/widgets/size_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:oapp/model/card_data.dart';
import 'package:oapp/model/card.dart';

class ListBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CardData>(
      builder: (context, cardData, child) {
        return PageView.builder(
          physics: ScrollPhysics(),
          controller: PageController(viewportFraction: 0.52),
          scrollDirection: Axis.horizontal,
          pageSnapping: true,
          itemBuilder: (context, index) {
            final card = cardData.cardList[index];
            return SizeAnimation();
          },
          itemCount: cardData.cardCount,
        );
      },
    );
  }
}
