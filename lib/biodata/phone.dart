import 'package:app/biodata/appbar.dart';
import 'package:app/custom_button.dart';
import 'package:flutter/material.dart';

class PhoneNumberEntryWidget extends StatelessWidget {
  final VoidCallback onBack;
  final VoidCallback onContinue;

  PhoneNumberEntryWidget({required this.onBack, required this.onContinue});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Appbar(onBack: onBack,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Enter Phone Number",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "Enter your phone number so that we can send you OTP in order to verify you.",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone, color: Colors.black),
                    hintText: "Enter your phone number",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none
                    ),
                    fillColor: Colors.white,
                    filled: true
                ),
              ),
              SizedBox(height: 20),
              CustomButton(onTap: onContinue, text: 'Request OTP')
            ],
          ),
        ),
      ],
    );
  }
}