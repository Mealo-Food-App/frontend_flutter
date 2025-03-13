import 'package:app/screens/home_page.dart';
import 'package:app/screens/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class NavigationWidget extends StatefulWidget {
  @override
  _NavigationWidgetState createState() => _NavigationWidgetState();
}

class _NavigationWidgetState extends State<NavigationWidget> {
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
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const HomePage(),
            const Center(child: Text("Membership Page")),
            const Center(child: Text("Profile Page")),
            ProfileScreen()
          ],
        ),
        bottomNavigationBar: NavigationBar(
          indicatorColor: const Color(0xFFCF353F),
          backgroundColor: Colors.white,
          selectedIndex: _selectedIndex,
          onDestinationSelected: _onItemTapped,
          destinations: [
            _buildNavItem(PhosphorIcons.house, PhosphorIcons.house_fill, 'Home', 0),
            _buildNavItem(PhosphorIcons.cooking_pot, PhosphorIcons.cooking_pot_fill, 'Rescue Meals', 1),
            _buildNavItem(PhosphorIcons.shopping_bag, PhosphorIcons.shopping_bag_fill,  'Orders', 2),
            _buildNavItem(PhosphorIcons.user_circle, PhosphorIcons.user_circle_fill, 'Profile', 3),
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
