import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'menu_item.dart';

class Sidebar extends StatefulWidget {
  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar>
    with SingleTickerProviderStateMixin<Sidebar> {
  AnimationController _animationController;
  StreamController<bool> isSidebarOpenedStreamController;
  Stream<bool> isSidebarOpenedStream;
  StreamSink<bool> isSidebarOpenedSink;
  final _animationDuration = Duration(milliseconds: 300);

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: _animationDuration);
    isSidebarOpenedStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
    isSidebarOpenedSink = isSidebarOpenedStreamController.sink;
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSidebarOpenedStreamController.close();
    isSidebarOpenedSink.close();
    super.dispose();
  }

  void onIconPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted) {
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return StreamBuilder<bool>(
        initialData: false,
        stream: isSidebarOpenedStream,
        builder: (context, isSideBarOpenedAsync) {
          return AnimatedPositioned(
            duration: _animationDuration,
            top: 0,
            bottom: 0,
            left: isSideBarOpenedAsync.data ? 0 : -screenWidth,
            right: isSideBarOpenedAsync.data ? 0 : screenWidth - 35,
            child: Material(
              type: MaterialType.transparency,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      color: Color(0xFFA9BDDB),
                      width: 50,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 100),
                            ListTile(
                              title: Text(
                                'Juan',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w800),
                              ),
                              subtitle: Text(
                                'email@email.com',
                                style: TextStyle(
                                  color: Color(0xFFEBF4F5),
                                  fontSize: 20,
                                ),
                              ),
                              leading: CircleAvatar(
                                backgroundColor: Colors.black,
                                child: Icon(
                                  Icons.perm_identity,
                                  color: Colors.white,
                                ),
                                radius: 40,
                              ),
                            ),
                            Divider(
                              height: 64,
                              thickness: .9,
                              color: Color(0xFFEBF4F5),
                              indent: 32,
                              endIndent: 32,
                            ),
                            MenuItem(
                              icon: Icons.home,
                              title: "Home",
                            ),
                            MenuItem(
                              icon: Icons.person,
                              title: "My Account",
                            ),
                            MenuItem(
                              icon: Icons.favorite,
                              title: "Favorite",
                            ),
                            Divider(
                              height: 64,
                              thickness: .9,
                              color: Color(0xFFEBF4F5),
                              indent: 32,
                              endIndent: 32,
                            ),
                            MenuItem(
                              icon: Icons.settings,
                              title: "Settings",
                            ),
                            MenuItem(
                              icon: Icons.library_books,
                              title: "About",
                            ),
                            MenuItem(
                              icon: Icons.exit_to_app,
                              title: "Logout",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0, -.9),
                    child: GestureDetector(
                      onTap: () {
                        onIconPressed();
                      },
                      child: ClipPath(
                        clipper: CustomMenuClipper(),
                        child: Container(
                          width: 35,
                          height: 110,
                          color: Color(0xFFA9BDDB),
                          alignment: Alignment.centerLeft,
                          child: AnimatedIcon(
                            progress: _animationController.view,
                            icon: AnimatedIcons.menu_close,
                            color: Color(0xFFEBF4F5),
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Color(0xFFb5c6e0);

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
