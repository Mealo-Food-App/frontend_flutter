import 'package:app/widgets/appbar.dart';
import 'package:app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';


class PostcodeWidget extends StatefulWidget {
  final VoidCallback onBack;
  final VoidCallback onContinue;

  PostcodeWidget({required this.onBack, required this.onContinue});

  @override
  _PostcodeWidgetState createState() => _PostcodeWidgetState();
}

class _PostcodeWidgetState extends State<PostcodeWidget> {
  TextEditingController _postcodeController = TextEditingController();

  void _showPostcodeModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.location_on, color: Colors.red, size: 40),
              ),
              SizedBox(height: 7),
              Text(
                _postcodeController.text.isNotEmpty
                    ? _postcodeController.text
                    : "EC1A 4HD",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              // SizedBox(height: 4),
              Text(
                "Central London",
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
              SizedBox(height: 30),
              CustomButton(
                  onTap: () => {
                Navigator.pop(context)
                  },
                  text: 'Cancel',
                backgroundColor: Colors.white,
                textColor: Color(0xFFCF353F),
              ),
              SizedBox(height: 10),
              CustomButton(onTap: () {
                widget.onContinue();
                Navigator.pop(context);
              }, text: 'Confirm'),
              SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Appbar(onBack: widget.onBack,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Enter Postcode",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "Enter your postcode so that we can deliver your meal at your place.",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _postcodeController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    PhosphorIcons.map_pin,
                    size: 24,
                  ),
                  hintText: "Enter your postcode",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none
                  ),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
              SizedBox(height: 20),
              CustomButton(onTap: () => {
                _showPostcodeModal(context)
              }, text: 'Search')
            ],
          ),
        ),
      ],
    );
  }
}
