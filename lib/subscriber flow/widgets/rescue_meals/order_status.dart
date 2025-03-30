import 'package:frontend_flutter/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class OrderStatusPage extends StatelessWidget {
  const OrderStatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Order #995",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            fontFamily: 'Nunito',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(PhosphorIcons.caret_left, size: 24),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Order Invoice",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Color(0xFF2B2D42),
                      fontFamily: 'Nunito',
                    ),
                  ),
                  Divider(color: Color(0xFFE0E0E0)),
                  buildInvoiceRow("Ordered From", "Urban Bites Café"),
                  buildInvoiceRow("Total No. of Meals", "01"),
                  buildInvoiceRow("In Total", "£69.40"),
                  buildInvoiceRow("Discount", "-£19.54"),
                  Divider(color: Color(0xFFE0E0E0)),
                  buildInvoiceRow("Amount Paid", "£49.86", isBold: true),
                ],
              ),
            ),
            SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(PhosphorIcons.star, color: Colors.black),
                      SizedBox(width: 8),
                      Text(
                        "Rate us",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontFamily: 'Nunito',
                        ),
                      ),
                    ],
                  ),
                  Icon(PhosphorIcons.caret_right, size: 24),
                ],
              ),
            ),
            Spacer(),
            CustomButton(onTap: () {}, text: "Collect Now"),
          ],
        ),
      ),
    );
  }

  Widget buildInvoiceRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF2B2D42),
              fontFamily: 'Nunito',
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: Color(0xFF757575),
              fontFamily: 'Nunito',
            ),
          ),
        ],
      ),
    );
  }
}
