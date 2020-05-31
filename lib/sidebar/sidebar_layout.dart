import 'package:flutter/material.dart';
import 'package:oapp/messages_screen.dart';
import 'package:oapp/sidebar/sidebar.dart';

class SidebarLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        MessagesScreen(),
        Sidebar(),
      ],
    );
  }
}
