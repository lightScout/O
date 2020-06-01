import 'package:flutter/foundation.dart';
import 'dart:collection';

import 'package:oapp/model/card.dart';

class CardData extends ChangeNotifier {
  List<Card> _cardList = [];

  UnmodifiableListView<Card> get cardList {
    UnmodifiableListView<Card> list;
    list = UnmodifiableListView(_cardList);
    return list;
  }

  int get cardCount {
    int size;
    size = _cardList.length;
    return size;
  }

  void addCard(String name, String category) {
    _cardList.add(Card(name: name, category: category));
    notifyListeners();
  }

  void deleteCard(Card card) {
    _cardList.remove(card);
    notifyListeners();
  }
}
