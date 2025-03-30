import 'package:app/restaurant%20flow/screens/restro_home.dart';
import 'package:app/restaurant%20flow/screens/restro_menu.dart';
import 'package:app/restaurant%20flow/screens/restro_order.dart';
import 'package:app/restaurant%20flow/screens/restro_profile.dart';
import 'package:app/restaurant%20flow/screens/restro_rescue_meals.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class RestroNavigationWidget extends StatefulWidget {
  @override
  _RestroNavigationWidgetState createState() => _RestroNavigationWidgetState();
}

class _RestroNavigationWidgetState extends State<RestroNavigationWidget> {
  int _selectedIndex = 0;
  PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  Future<bool> _onWillPop() async {
    if (_selectedIndex != 0) {
      setState(() {
        _selectedIndex = 0;
      });
      _pageController.jumpToPage(0);
      return false;
    }

    SystemNavigator.pop();
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Color(0xFFF9F9F9),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16, top: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = 0;
                          _pageController.jumpToPage(0);
                        });
                      },
                      child: Material(
                        elevation: 4,
                        shadowColor: Colors.black26,
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),

                          ),
                          child: Row(
                            children: const [
                              Icon(PhosphorIcons.map_pin_fill, size: 20, color: Colors.black),
                              SizedBox(width: 4),
                              Text(
                                'HOME',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(PhosphorIcons.bell_simple, size: 24, color: Colors.black),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    RestroHomePage(),
                    RestroMenu(),
                    RestroRescueMeals(),
                    RestroOrderPage(),
                    RestroProfileScreen()
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: NavigationBar(
          indicatorColor: const Color(0xFFCF353F),
          backgroundColor: Colors.white,
          selectedIndex: _selectedIndex,
          onDestinationSelected: _onItemTapped,
          destinations: [
            _buildNavItem(PhosphorIcons.house, PhosphorIcons.house_fill, 'Home', 0),
            _buildNavItem(PhosphorIcons.cooking_pot, PhosphorIcons.cooking_pot_fill, 'Menu', 1),
            _buildNavItem(PhosphorIcons.list_dashes, PhosphorIcons.list_dashes, 'Rescue Meal', 2),
            _buildNavItem(PhosphorIcons.shopping_bag, PhosphorIcons.shopping_bag_fill,  'Orders', 3),
            _buildNavItem(PhosphorIcons.user_circle, PhosphorIcons.user_circle_fill, 'Profile', 4),
          ],
        ),
      ),
    );
  }

  NavigationDestination _buildNavItem(IconData icon, IconData selectedIcon, String label, int index) {
    return NavigationDestination(
      icon: _selectedIndex == index  ?
      Icon(selectedIcon, color: Colors.white,) :
      Icon(icon, color: Colors.black,),
      label: label,
    );
  }
}
