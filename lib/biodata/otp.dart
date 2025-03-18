import 'dart:async';
import 'package:app/biodata/appbar.dart';
import 'package:app/custom_button.dart';
import 'package:flutter/material.dart';

class OTPWidget extends StatefulWidget {
  final VoidCallback onBack;
  final VoidCallback onContinue;

  OTPWidget({required this.onBack, required this.onContinue});

  @override
  _OTPPageState createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPWidget> {
  int _secondsRemaining = 30;
  bool _isResendVisible = false;
  Timer? _timer;

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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Appbar(onBack: widget.onBack,),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Verify it's you",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "Enter the OTP sent to your phone number to verify your identity.",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.pin, color: Colors.black),
                    hintText: "Enter OTP",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    fillColor: Colors.white,
                    filled: true
                ),
              ),
              SizedBox(height: 20),
              CustomButton(onTap: widget.onContinue, text: 'Verify OTP'),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                      visible: !_isResendVisible,
                      child: Text("We will resend OTP in ${_secondsRemaining}s")
                  ),
                  Visibility(
                      visible: _isResendVisible,
                      child: Text('Resend Code', style: TextStyle(color: Color(0xFF35CFC1)),)
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}