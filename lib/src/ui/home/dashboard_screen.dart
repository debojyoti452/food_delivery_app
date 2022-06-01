import 'package:dart_std/dart_std.dart';
import 'package:flutter/material.dart';
import 'package:ubx_vinne_admin_web/src/ui/home/custom_nav.dart';

const bottomNav = <Pair<String, IconData>>[
  Pair('Home', Icons.home),
  Pair('Favourites', Icons.favorite),
  Pair('Cart', Icons.shopping_cart),
  Pair('Me', Icons.person_sharp),
];

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var _showIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Text(
            _showIndex.toString(),
          ),
        ),
      ),
      bottomNavigationBar: CustomNav(onClick: (index) {
        _showIndex = index;
        setState(() {});
      }),
    );
  }
}
