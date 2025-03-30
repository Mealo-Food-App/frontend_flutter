import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class FAQPage extends StatelessWidget {
  final List<Map<String, String>> faqs = [
    {"question": "How do I subscribe to a meal plan?", "answer": ""},
    {
      "question": "Can I pause or cancel my subscription?",
      "answer":
      "Yes! You can pause or cancel your subscription anytime from the 'Weekly Meal Plan' section in your profile."
    },
    {"question": "What happens if I miss a delivery?", "answer": ""},
    {"question": "How do I track my orders?", "answer": ""},
    {"question": "What payment methods do you accept?", "answer": ""},
    {"question": "Can I get a refund for a canceled order?", "answer": ""},
    {"question": "How do I update my profile details?", "answer": ""},
    {"question": "How do I manage my notification preferences?", "answer": ""},
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      appBar: AppBar(
        title: Text(
          'FAQs',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(PhosphorIcons.caret_left, size: 24, ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        child: ListView.builder(
          itemCount: faqs.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0xFFE0E0E0)),
                  borderRadius: BorderRadius.circular(8)
                ),
                child: ExpansionTile(
                  title: Text(
                    faqs[index]["question"]!,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        faqs[index]["answer"]!.isNotEmpty
                            ? faqs[index]["answer"]!
                            : "No information available",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                  ],
                  trailing: Icon(Icons.add, color: Colors.red),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}