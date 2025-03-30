import 'package:frontend_flutter/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class SubscriptionDetailsPage extends StatelessWidget {
  const SubscriptionDetailsPage({super.key});

  Widget _buildPlanSection(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = screenWidth * 0.04;
    final buttonWidth = (screenWidth - (horizontalPadding * 2) - 16) / 2;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: screenWidth * 0.025,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your Plan - General',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Nunito',
            ),
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: screenWidth * 0.025),
          _buildPlanDetail('Plan Starts', '22 January, 2025'),
          _buildPlanDetail('Plan Ends', '22 February, 2025'),
          _buildPlanDetail('Upcoming Delivery', 'Today at 12:30 PM'),
          _buildPlanDetail('Next Renewal', '21 February, 2025'),
          SizedBox(height: screenWidth * 0.04),
          Container(
            padding: EdgeInsets.all(horizontalPadding),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Remaining Meals',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF2B2D42),
                          fontFamily: 'Nunito',
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '08/10',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Nunito',
                      ),
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
          SizedBox(height: screenWidth * 0.04),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                onTap: () {},
                text: 'Pause',
                backgroundColor: Color(0xFFFFCC3D),
                width: buttonWidth,
                textColor: Color(0xFF2B2D42),
                borderColor: Colors.transparent,
              ),
              CustomButton(
                onTap: () {},
                text: 'Cancel',
                backgroundColor: Color(0xFFFF4949),
                width: buttonWidth,
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
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF2B2D42),
                fontFamily: 'Nunito',
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF2B2D42),
                fontFamily: 'Nunito',
              ),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInvoiceSection(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = screenWidth * 0.04;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: screenWidth * 0.025,
      ),
      child: Container(
        padding: EdgeInsets.all(horizontalPadding),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Invoice History',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Nunito',
              ),
              overflow: TextOverflow.ellipsis,
            ),
            Divider(thickness: 1, height: 5, color: Color(0xFFE0E0E0)),
            SizedBox(height: screenWidth * 0.01),
            _buildPlanDetail('Last Amount Paid', '£49.86'),
            _buildPlanDetail('Date', '22 January, 2025'),
            _buildPlanDetail('Payment Method', 'Apple Pay'),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = screenWidth * 0.04;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Subscription Details',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              fontFamily: 'Nunito',
            ),
            overflow: TextOverflow.ellipsis,
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(PhosphorIcons.caret_left, size: 24),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildPlanSection(context),
                      SizedBox(height: screenWidth * 0.05),
                      _buildInvoiceSection(context),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(horizontalPadding),
                color: Colors.white,
                child: CustomButton(
                  onTap: () {},
                  text: 'Renew',
                  backgroundColor: Color.fromRGBO(207, 53, 63, 0.5),
                  borderColor: Colors.transparent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
