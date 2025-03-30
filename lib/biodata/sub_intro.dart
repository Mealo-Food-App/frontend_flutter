import 'package:frontend_flutter/biodata/appbar.dart';
import 'package:flutter/material.dart';

class SubIntroWidget extends StatelessWidget {
  final VoidCallback onBack;

  const SubIntroWidget({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Appbar(onBack: onBack),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Let us know you",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Nunito',
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Introduce yourself by letting us know who you're so that we can provide the best service.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontFamily: 'Nunito',
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Name",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Nunito',
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextField(
                            "First Name",
                            Icons.person_outline,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: _buildTextField(
                            "Last Name",
                            Icons.person_outline,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Address",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Nunito',
                      ),
                    ),
                    SizedBox(height: 8),
                    _buildTextField(
                      "Number, Street Name",
                      Icons.location_on_outlined,
                    ),
                    SizedBox(height: 10),
                    _buildTextField(
                      "Flat Number/Building Number",
                      Icons.apartment,
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildRadioOption("Home"),
                        _buildRadioOption("Office"),
                        _buildRadioOption("Other"),
                      ],
                    ),
                    SizedBox(height: 20),
                    // Meal Drop Location
                    Text(
                      "Where can we leave your meals?",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Nunito',
                      ),
                    ),
                    SizedBox(height: 8),
                    _buildTextField(
                      "Place to leave order",
                      Icons.location_on_outlined,
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.all(16.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/navigate');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFCF353F),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      "Continue",
                      style: TextStyle(fontSize: 16, fontFamily: 'Nunito'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String hint, IconData icon) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon, color: Colors.grey),
        border: InputBorder.none,
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 14),
      ),
    );
  }

  Widget _buildRadioOption(String label) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Radio(value: label, groupValue: null, onChanged: (value) {}),
          Text(label, style: TextStyle(fontSize: 18, fontFamily: 'Nunito')),
          SizedBox(width: 15),
        ],
      ),
    );
  }
}
