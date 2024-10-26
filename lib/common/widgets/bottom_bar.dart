import 'package:campusconnect/Constants/Global_veriable.dart';
import 'package:campusconnect/Features/account/widgets/cafe_menu.dart';
import 'package:campusconnect/Features/account/widgets/cart_screen.dart';
import 'package:campusconnect/Features/account/widgets/event_card.dart';
import 'package:campusconnect/Features/account/widgets/health_card.dart';
import 'package:campusconnect/Features/account/widgets/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

import '../../Features/account/screens/home_screen.dart';

List<CartItem> cartItems =
    []; // Provide a default empty list if cartItems is null

class BottomBar extends StatefulWidget {
  static const String routeNmae = '/actual-home';
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomBarwidth = 42;
  double bottomBorderwidth = 5;

  List<CartItem> validCartItemsList = cartItems ?? [];
  List<Widget> pages = [
    HomeScreen(),
    EventsScreen(),
    HealthScreen(),
    CartScreen(
      cartItems: [],
    ),
    UserScreen(),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobaleVeriables.selectedNavBarColor,
        unselectedItemColor: GlobaleVeriables.unselectedNavBarColor,
        backgroundColor: GlobaleVeriables.backgroundColor,
        iconSize: 28,
        onTap: updatePage,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarwidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 0
                        ? GlobaleVeriables.selectedNavBarColor
                        : GlobaleVeriables.backgroundColor,
                    width: bottomBorderwidth,
                  ),
                ),
              ),
              child: const Icon(
                Icons.home_outlined,
              ),
            ),
            label: '',
          ),

          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarwidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 1
                        ? GlobaleVeriables.selectedNavBarColor
                        : GlobaleVeriables.backgroundColor,
                    width: bottomBorderwidth,
                  ),
                ),
              ),
              child: const Icon(
                Icons.event_outlined,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarwidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 2
                        ? GlobaleVeriables.selectedNavBarColor
                        : GlobaleVeriables.backgroundColor,
                    width: bottomBorderwidth,
                  ),
                ),
              ),
              child: const Icon(
                Icons.health_and_safety_outlined,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarwidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 3
                        ? GlobaleVeriables.selectedNavBarColor
                        : GlobaleVeriables.backgroundColor,
                    width: bottomBorderwidth,
                  ),
                ),
              ),
              child: badges.Badge(
                badgeContent: Text('3'),
                badgeStyle:
                    badges.BadgeStyle(elevation: 0, badgeColor: Colors.white),
                child: const Icon(
                  Icons.add_shopping_cart_outlined,
                ),
              ),
            ),
            label: '',
          ),

          //person icon
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarwidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 4
                        ? GlobaleVeriables.selectedNavBarColor
                        : GlobaleVeriables.backgroundColor,
                    width: bottomBorderwidth,
                  ),
                ),
              ),
              child: const Icon(
                Icons.person_outlined,
              ),
            ),
            label: '',
          )
        ],
      ),
    );
  }
}
