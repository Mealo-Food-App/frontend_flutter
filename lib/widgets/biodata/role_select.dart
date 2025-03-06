import 'package:app/widgets/appbar.dart';
import 'package:app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RoleSelectionWidget extends StatefulWidget {
  final Function(int) onContinue;

  RoleSelectionWidget({required this.onContinue});

  @override
  _RoleSelectionWidgetState createState() => _RoleSelectionWidgetState();
}

class _RoleSelectionWidgetState extends State<RoleSelectionWidget> {
  int? selectedRole;

  void _handleContinue() {
    if (selectedRole != null) {
      widget.onContinue(selectedRole!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Appbar(onBack: () => {
          Navigator.pop(context)
        },),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            color: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "What describes you?",
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  "Pick one of the options below to proceed with the app based on your needs.",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                SizedBox(height: 20),
                _buildRoleOption(0, "Subscriber"),
                _buildRoleOption(1, "Restaurant"),
                Spacer(),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomButton(
                    onTap: selectedRole != null ? _handleContinue : null,
                    text: 'Continue',
                    backgroundColor: selectedRole != null ? Color(0xFFCF353F) : Colors.grey,
                    borderColor: selectedRole != null ? Color(0xFFCF353F) : Colors.grey,
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildRoleOption(int index, String text) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedRole = index;
        });
      },
      child: RawKeyboardListener(
        focusNode: FocusNode(),
        autofocus: true,
        onKey: (event) {
          if (event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.enter && selectedRole != null) {
            _handleContinue();
          }
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            border: Border.all(
              color: selectedRole == index ? Color(0xFFCF353F) : Colors.grey,
            ),
            borderRadius: BorderRadius.circular(10),
            color: selectedRole == index ? Colors.red.withOpacity(0.1) : Colors.white,
          ),
          child: Row(
            children: [
              Icon(
                selectedRole == index
                    ? Icons.radio_button_checked
                    : Icons.radio_button_off,
                color: selectedRole == index ? Color(0xFFCF353F) : Colors.grey,
              ),
              SizedBox(width: 10),
              Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  color: selectedRole == index ? Color(0xFFCF353F) : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
