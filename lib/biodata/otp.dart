import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:frontend_flutter/biodata/appbar.dart';
import 'package:frontend_flutter/custom_button.dart';

class OTPWidget extends StatefulWidget {
  final VoidCallback onBack;
  final VoidCallback onContinue;
  final String phoneNumber;

  const OTPWidget({
    super.key,
    required this.onBack,
    required this.onContinue,
    required this.phoneNumber,
  });

  @override
  _OTPPageState createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPWidget> {
  int _secondsRemaining = 30;
  bool _isResendVisible = false;
  Timer? _timer;
  final TextEditingController _otpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        setState(() {
          _isResendVisible = true;
        });
        _timer?.cancel();
      }
    });
  }

  Future<void> verifyOtp(String phoneNumber, String code) async {
    final accountSid = 'ACa7d16550865815c5514bd7d4026b16a0';
    final authToken = 'ce4bbbe1808481921d089ff50a64bfba';
    final serviceSid = 'VAa8e07fb8be658426db63b4a75412190b';

    final basicAuth =
        'Basic ${base64Encode(utf8.encode('$accountSid:$authToken'))}';

    final response = await http.post(
      Uri.parse(
          'https://verify.twilio.com/v2/Services/$serviceSid/VerificationCheck'),
      headers: {
        'Authorization': basicAuth,
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'To': phoneNumber,
        'Code': code,
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('OTP verified successfully!');
      widget.onContinue();
    } else {
      print('Failed to verify OTP: ${response.body}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid OTP. Please try again.')),
      );
    }
  }

  @override
  void dispose() {
    _otpController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Appbar(onBack: widget.onBack),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Verify it's you",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Nunito',
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Enter the OTP sent to your phone number to verify your identity.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontFamily: 'Nunito',
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _otpController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.pin, color: Colors.black),
                  hintText: "Enter OTP",
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
                  final otp = _otpController.text.trim();
                  if (otp.isNotEmpty) {
                    verifyOtp(widget.phoneNumber, otp);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please enter the OTP')),
                    );
                  }
                },
                text: 'Verify OTP',
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: !_isResendVisible,
                    child: Text(
                      "We will resend OTP in ${_secondsRemaining}s",
                      style: TextStyle(fontFamily: 'Nunito'),
                    ),
                  ),
                  Visibility(
                    visible: _isResendVisible,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _secondsRemaining = 30;
                          _isResendVisible = false;
                          _startTimer();
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please re-request OTP from previous screen.')),
                        );
                      },
                      child: Text(
                        'Resend Code',
                        style: TextStyle(
                          color: Color(0xFF35CFC1),
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
