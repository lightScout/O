import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oapp/model/card_data.dart';
import 'sidebar/sidebar_layout.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ChangeNotifierProvider<CardData>(
      create: (context) => CardData(),
      child: MaterialApp(
        home: SidebarLayout(),
      ),
    );
  }
}
