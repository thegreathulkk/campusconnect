// Import necessary packages and libraries
import 'package:campusconnect/Constants/Global_veriable.dart';
import 'package:campusconnect/Features/admin/screen/Admin_home_screen.dart';
import 'package:campusconnect/Features/admin/screen/Order/adminorder.dart';
import 'package:campusconnect/Features/admin/screen/admin_account.dart';
import 'package:campusconnect/Features/admin/screen/admin_event.dart';
import 'package:flutter/material.dart';

class AdminPanel extends StatefulWidget {
  @override
  _AdminPanelState createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  int _page = 0;
  double bottomBarwidth = 42;
  double bottomBorderwidth = 5;

  List<Widget> pages = [
    const AdminHome(), //HomeScreen(),
    HomePage(), //EventsScreen(),
    OrderReceivedPage(), //HealthScreen(),
    AdminProfilePage() //CartScreen(),
  ];

  void updateAdminPage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobaleVeriables.selectedNavBarColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Campus Connect',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                SizedBox(width: 130.0),
                Text("Admin"),
                SizedBox(width: 10.0),
                Icon(Icons.notifications_outlined)
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobaleVeriables.selectedNavBarColor,
        unselectedItemColor: GlobaleVeriables.unselectedNavBarColor,
        backgroundColor: GlobaleVeriables.backgroundColor,
        iconSize: 28,
        onTap: updateAdminPage,
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
                Icons.add_box_rounded,
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
                Icons.delivery_dining_outlined,
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
      body: pages[_page],
    );
  }
}
