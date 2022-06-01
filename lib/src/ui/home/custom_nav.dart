import 'package:dart_std/dart_std.dart';
import 'package:flutter/material.dart';
import 'package:ubx_vinne_admin_web/src/ui/home/dashboard_screen.dart';

class CustomNav extends StatefulWidget {
  const CustomNav({Key? key, required this.onClick}) : super(key: key);

  final ValueChanged<int> onClick;

  @override
  State<CustomNav> createState() => _CustomNavState();
}

class _CustomNavState extends State<CustomNav> with TickerProviderStateMixin {
  late AnimationController _animationController;
  var _selectedIndex = 0;
  final _defaultColor = Color(0xFFFFC727);
  final _selectedColor = Color(0xFF7323D8);

  @override
  void initState() {
    initiate();
    _checkWhetherToShowBottomNav();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      explicitChildNodes: true,
      child: _bottomNav(widget.onClick),
    );
  }

  Widget _bottomNav(ValueChanged<int> onClick) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        color: _defaultColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: bottomNav.mapIndexed((e, index) {
            return GestureDetector(
                onTap: () {
                  onClick(index);
                  _updateIndex(index - 1);
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInCubic,
                  padding: EdgeInsets.symmetric(horizontal: 22, vertical: 8),
                  decoration: BoxDecoration(
                    color: _isSelected(e.first) ? Colors.white : _defaultColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        e.second,
                        size: _isSelected(e.first) ? 30 : 18,
                        color: _isSelected(e.first) ? _selectedColor : Colors.white,
                      ),
                      Text(
                        e.first,
                        style: DefaultTextStyle.of(context).style.copyWith(
                              fontSize: _isSelected(e.first) ? 14 : 10,
                              color: _isSelected(e.first) ? _selectedColor : Colors.white,
                            ),
                      ),
                    ],
                  ),
                ));
          }).toList(),
        ),
      ),
    );
  }

  void initiate() {
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
  }

  bool _isSelected(String label) {
    return bottomNav[_selectedIndex].first == label;
  }

  void _updateIndex(int index) {
    _selectedIndex = index;
    _resetState();
  }

  void _checkWhetherToShowBottomNav() {
    if (bottomNav.length > 4) {
      throw Exception('BottomNav can have maximum 4 items');
    }
  }

  void _resetState() {
    setState(() {});
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
