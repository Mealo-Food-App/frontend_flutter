import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final double width;
  final FontWeight fontWeight; // Added fontWeight
  final EdgeInsetsGeometry padding; // Added padding

  const CustomButton({
    super.key,
    required this.onTap,
    required this.text,
    this.backgroundColor = const Color(0xFFCF353F),
    this.borderColor = const Color(0xFFCF353F),
    this.textColor = Colors.white,
    this.width = double.infinity,
    this.fontWeight = FontWeight.w600, // Default font weight
    this.padding = const EdgeInsets.symmetric(vertical: 10), // Default padding
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 2),
          borderRadius: BorderRadius.circular(10),
          color: backgroundColor,
        ),
        width: width,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: fontWeight,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
