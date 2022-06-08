import 'package:dart_std/dart_std.dart';
import 'package:flutter/material.dart';
import 'package:ubx_vinne_admin_web/side_bar.dart';
import 'package:ubx_vinne_admin_web/src/base/main_common.dart';
import 'package:ubx_vinne_admin_web/src/ui/home/custom_nav.dart';
import 'package:ubx_vinne_admin_web/src/utils/constants/app_colors.dart';

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

  final GlobalKey<SideBarState> _sideMenuKey = GlobalKey<SideBarState>();

  var _isOpen = false;

  @override
  Widget build(BuildContext context) {
    return SideBar<Pair>(
      key: _sideMenuKey,
      menuItemList: [
        Pair('Home', Icons.home),
        Pair('Favourites', Icons.favorite),
        Pair('Cart', Icons.shopping_cart),
        Pair('Me', Icons.person_sharp),
      ],
      onMenuClick: (index) {
        logger.d(index);
        final state = _sideMenuKey.currentState;
        if (state?.isOpened ?? false) {
          state?.closeSideMenu();
        } else {
          state?.openSideMenu();
        }

        setState(() {
          _isOpen = !_isOpen;
        });
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            splashColor: AppColors.secondaryColor,
            icon: Icon(
              (_isOpen) ? Icons.arrow_back : Icons.menu,
              color: AppColors.secondaryColor,
            ),
            onPressed: () {
              final state = _sideMenuKey.currentState;
              if (state?.isOpened ?? false) {
                state?.closeSideMenu();
              } else {
                state?.openSideMenu();
              }

              setState(() {
                _isOpen = !_isOpen;
              });
            },
          ),
          elevation: 0,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.green,
          child: Container(
            child: Center(
              child: Text(
                _showIndex.toString(),
              ),
            ),
          ),
        ),
        bottomNavigationBar: CustomNav(
          onClick: (index) {
            _showIndex = index;
            setState(() {});
          },
        ),
      ),
    );
  }
}

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
