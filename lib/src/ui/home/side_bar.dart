import 'dart:math';

import 'package:flutter/material.dart';

class SideBar<T> extends StatefulWidget {
  const SideBar({
    Key? key,
    required this.child,
    required this.menuItemList,
    required this.onMenuClick,
  }) : super(key: key);

  final Widget child;
  final List<T> menuItemList;
  final ValueChanged<int> onMenuClick;

  static SideBarState? of(BuildContext context) {
    return context.findAncestorStateOfType<SideBarState>();
  }

  @override
  SideBarState createState() => SideBarState();
}

class SideBarState extends State<SideBar> {
  late bool _isDragging;

  void openSideMenu() => setState(() => _isDragging = true);

  void closeSideMenu() => setState(() => _isDragging = false);

  bool get isOpened => _isDragging;

  @override
  void initState() {
    super.initState();
    _isDragging = false;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final mq = MediaQuery.of(context);
      final size = mq.size;
      final statusBarHeight = mq.padding.top;
      return Material(
          color: Colors.white70,
          child: Stack(fit: StackFit.expand, children: [
            Positioned(
                top: statusBarHeight + (40.0) * 2,
                bottom: 0.0,
                width: min(size.width * 0.70, 500.0),
                child: Container(
                  child: Column(
                    children: widget.menuItemList.map((item) {
                      return ListTile(
                        title: Text(item.first),
                        leading: Icon(item.second),
                        onTap: () {
                          widget.onMenuClick(widget.menuItemList.indexOf(item));
                        },
                      );
                    }).toList(),
                  ),
                )),
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              width: constraints.maxWidth,
              curve: Curves.fastLinearToSlowEaseIn,
              alignment: Alignment.topLeft,
              transform: _getTransform(size),
              decoration: BoxDecoration(
                borderRadius: _getBorderRadius(),
              ),
              child: () {
                if (_isDragging) {
                  return SafeArea(
                      child: ClipRRect(
                    borderRadius: _getBorderRadius(),
                    clipBehavior: Clip.antiAlias,
                    child: widget.child,
                  ));
                }
                return widget.child;
              }(),
            ),
          ]));
    });
  }

  BorderRadius _getBorderRadius() =>
      _isDragging ? (BorderRadius.circular(10.0)) : BorderRadius.zero;

  Matrix4 _getTransform(Size size) {
    if (_isDragging) {
      return Matrix4.identity()
        ..translate((size.width / 1.5) * 0.9, (size.height * 0.1))
        ..scale(400 / size.width, 1.0);
    }
    return Matrix4.identity();
  }
}
