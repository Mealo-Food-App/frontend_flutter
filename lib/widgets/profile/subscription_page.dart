import 'package:app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class SubscriptionDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text(
          'Subscription Details',
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPlanSection(),
          SizedBox(height: 20),
          _buildInvoiceSection(),
          Spacer(),
          Container(
            padding: EdgeInsets.all(16),
            color: Colors.white,
            child: CustomButton(
              onTap: (){},
              text: 'Renew',
              backgroundColor: Color.fromRGBO(207, 53, 63, 0.5),
              borderColor: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlanSection() {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your Plan - General',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          _buildPlanDetail('Plan Starts', '22 January, 2025'),
          _buildPlanDetail('Plan Ends', '22 February, 2025'),
          _buildPlanDetail('Upcoming Delivery', 'Today at 12:30 PM'),
          _buildPlanDetail('Next Renewal', '21 February, 2025'),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12)
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Remaining Meals',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF2B2D42)),
                    ),
                    Text(
                      '08/10',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                LinearProgressIndicator(
                  value: 0.8,
                  backgroundColor: Color(0xFFF9F9F9),
                  color: Color(0xFFCF353F),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                onTap: () {} ,
                text: 'Pause',
                backgroundColor: Color(0xFFFFCC3D),
                width: 170,
                textColor: Color(0xFF2B2D42),
                borderColor: Colors.transparent,
              ),
              CustomButton(
                onTap: () {} ,
                text: 'Cancel',
                backgroundColor: Color(0xFFFF4949),
                width: 170,
                borderColor: Colors.transparent,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPlanDetail(String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 14, color: Color(0xFF2B2D42))),
          Text(value, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF2B2D42))),
        ],
      ),
    );
  }

  Widget _buildInvoiceSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Invoice History',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Divider(thickness: 1, height: 5, color: Color(0xFFE0E0E0),),
            SizedBox(height: 3,),
            _buildPlanDetail('Last Amount Paid', '£49.86'),
            _buildPlanDetail('Date', '22 January, 2025'),
            _buildPlanDetail('Payment Method', 'Apple Pay'),
          ],
        ),
      ),
    );
  }
}
