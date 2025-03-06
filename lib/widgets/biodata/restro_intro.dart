import 'package:app/widgets/appbar.dart';
import 'package:app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class RestroIntroWidget extends StatelessWidget {
  final VoidCallback onBack;

  RestroIntroWidget({required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Appbar(onBack: onBack,),
        Expanded(
          child: SizedBox(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Let us know you",
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Introduce your restaurant by letting us know who you’re so that we can provide the best service.",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    SizedBox(height: 20),
                    Text("Cover Image", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    SizedBox(height: 8),
                    GestureDetector(
                      onTap: () {}, // Add image picker function here
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: Text("Attach a cover image", style: TextStyle(color: Colors.grey, fontSize: 16)),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: Icon(Icons.add, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    _buildInputField("Enter Restaurant Name", "Restaurant Name", Icons.store),
                    _buildInputField("Enter Restaurant Address", "Number, Street Name", Icons.location_on),
                    _buildInputField("", "Flat Number/Building Number", Icons.apartment),
                    _buildInputField("Enter Owner Info", "Owner Name", Icons.person),
                    _buildInputField("Contact Info", "Restaurant Contact Number", Icons.phone),
                    SizedBox(height: 30),

                    // Continue Button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: CustomButton(onTap: () => {
                        Navigator.pushNamed(context, '/navigate')
                      }, text: 'Continue'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInputField(String label, String hint, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label.isNotEmpty) ...[
            Text(label, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(height: 8),
          ],
          TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(icon, color: Colors.black),
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
