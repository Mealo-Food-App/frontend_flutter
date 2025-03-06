import 'package:flutter/material.dart';

class Appbar extends StatelessWidget {
  final VoidCallback onBack;

  const Appbar({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.centerLeft,
      height: 64,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: GestureDetector(
        onTap: onBack,
        child: Container(
            padding: EdgeInsets.all(4),
            child: Icon(Icons.arrow_back_ios, size: 24)
        ),
      ),
    );
  }
}
