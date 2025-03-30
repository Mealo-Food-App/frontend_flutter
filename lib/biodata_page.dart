import 'package:frontend_flutter/biodata/phone.dart';
import 'package:frontend_flutter/biodata/postcode.dart';
import 'package:frontend_flutter/biodata/restro_intro.dart';
import 'package:frontend_flutter/biodata/role_select.dart';
import 'package:frontend_flutter/biodata/sub_intro.dart';
import 'package:flutter/material.dart';

class BioDataPage extends StatefulWidget {
  const BioDataPage({super.key});

  @override
  _BioDataPageState createState() => _BioDataPageState();
}

class _BioDataPageState extends State<BioDataPage> {
  final PageController _pageController = PageController();
  late int _selectedRole = 0;

  void _nextPage() {
    _pageController.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _prevPage() {
    _pageController.previousPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: [
            RoleSelectionWidget(
              onContinue: (selectedRole) {
                print("$selectedRole");
                setState(() {
                  _selectedRole = selectedRole;
                });
                _nextPage();
              },
            ),
            PhoneNumberEntryWidget(onBack: _prevPage, onContinue: _nextPage),
            PostcodeWidget(onBack: _prevPage, onContinue: _nextPage),
            if (_selectedRole == 0)
              SubIntroWidget(onBack: _prevPage)
            else
              RestroIntroWidget(onBack: _prevPage),
          ],
        ),
      ),
    );
  }
}
