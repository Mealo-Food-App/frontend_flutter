import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final double width;
  final FontWeight fontWeight;
  final EdgeInsetsGeometry padding;
  final IconData? icon;

  const CustomButton({
    super.key,
    required this.onTap,
    required this.text,
    this.backgroundColor = const Color(0xFFCF353F),
    this.borderColor = const Color(0xFFCF353F),
    this.textColor = Colors.white,
    this.width = double.infinity,
    this.fontWeight = FontWeight.w600,
    this.padding = const EdgeInsets.symmetric(vertical: 10),
    this.icon
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) // Check if icon exists before rendering
              Icon(icon, color: textColor, size: 18),
            if (icon != null) const SizedBox(width: 8), // Add spacing if icon is present
            Text(
              text,
              style: TextStyle(
                fontSize: 14,
                fontWeight: fontWeight,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
