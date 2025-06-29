import 'package:frontend_flutter/biodata/phone.dart';
import 'package:frontend_flutter/biodata/otp.dart';
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

  int _selectedRole = 0;
  String _phoneNumber = "";

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
            // Step 1: Role selection
            RoleSelectionWidget(
              onContinue: (selectedRole) {
                setState(() {
                  _selectedRole = selectedRole;
                });
                _nextPage();
              },
            ),

            // Step 2: Phone number entry
            PhoneNumberEntryWidget(
              onBack: _prevPage,
              onContinue: _nextPage,
              onPhoneCaptured: (phone) {
                setState(() {
                  _phoneNumber = phone;
                });
              },
            ),

            // Step 3: OTP verification
            OTPWidget(
              onBack: _prevPage,
              onContinue: _nextPage,
              phoneNumber: _phoneNumber,
            ),

            // Step 4: Postcode entry
            PostcodeWidget(
              onBack: _prevPage,
              onContinue: _nextPage,
            ),

            // Step 5: Role-based intro screen
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
