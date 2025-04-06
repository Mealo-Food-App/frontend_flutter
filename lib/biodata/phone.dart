import 'dart:convert'; // Needed for base64Encode
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:frontend_flutter/biodata/appbar.dart';
import 'package:frontend_flutter/custom_button.dart';

class PhoneNumberEntryWidget extends StatefulWidget {
  final VoidCallback onBack;
  final VoidCallback onContinue;

  const PhoneNumberEntryWidget({
    super.key,
    required this.onBack,
    required this.onContinue,
  });

  @override
  State<PhoneNumberEntryWidget> createState() => _PhoneNumberEntryWidgetState();
}

class _PhoneNumberEntryWidgetState extends State<PhoneNumberEntryWidget> {
  final TextEditingController _phoneController = TextEditingController();

  Future<void> sendOtp(String phoneNumber) async {
    final response = await http.post(
      Uri.parse('https://verify.twilio.com/v2/Services/YOUR_SERVICE_SID/Verifications'),
      headers: {
        'Authorization': 'Basic ${base64Encode(utf8.encode('YOUR_ACCOUNT_SID:YOUR_AUTH_TOKEN'))}',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'To': phoneNumber,
        'Channel': 'sms',
      },
    );

    if (response.statusCode == 200) {
      print('OTP sent successfully!');
      widget.onContinue();
    } else {
      print('Failed to send OTP: ${response.body}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to send OTP')),
      );
    }
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Appbar(onBack: widget.onBack),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Enter Phone Number",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Nunito',
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Enter your phone number so that we can send you OTP in order to verify you.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontFamily: 'Nunito',
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone, color: Colors.black),
                  hintText: "Enter your phone number",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
              SizedBox(height: 20),
              CustomButton(
                onTap: () {
                  final phone = _phoneController.text.trim();
                  if (phone.isNotEmpty) {
                    sendOtp(phone);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please enter a valid phone number')),
                    );
                  }
                },
                text: 'Request OTP',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
