import 'package:app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              height: 210,
              width: double.infinity,
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        child: Text('Hello'),
                        radius: 36,
                      ),
                      Text(
                        'John Doe',
                        style: TextStyle(
                            color: Color(0xFF2B2D42),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '+44 98 8393 9002',
                        style: TextStyle(color: Color(0xFF757575)),
                      ),
                    ],
                  ),
                  CustomButton(
                    onTap: () => {
                      Navigator.pushNamed(context, '/edit_profile')
                    },
                    text: 'Edit Profile',
                    icon: PhosphorIcons.pencil_simple,
                  )
                ],
              ),
            ),
            SizedBox(height: 5),
            _buildMenuSection('General', [
              _buildMenuItem('Subscription Details', PhosphorIcons.credit_card, context),
              SizedBox(height: 3),
              _buildMenuItem('Notification Settings', PhosphorIcons.bell_simple, context),
              SizedBox(height: 3),
              _buildMenuItem('Delivery Address', PhosphorIcons.map_pin, context),
            ]),
            _buildMenuSection('Support', [
              _buildMenuItem('FAQs', PhosphorIcons.question, context),
              SizedBox(height: 3),
              _buildMenuItem('Contact Support', PhosphorIcons.phone, context, isSupport: true),
            ]),
            _buildMenuItem('Logout', PhosphorIcons.sign_out, context)
          ],
        ),
      ),
    );
  }

  Widget _buildMenuSection(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black)),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
              children: items
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildMenuItem(String title, IconData icon, BuildContext context, {bool isSupport = false}) {
    return GestureDetector(
      onTap: () {
        if (isSupport) {
          showContactBottomSheet(context);
        } else {
          Navigator.pushNamed(context, '/$title');
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.black, size: 24,),
                SizedBox(width: 10),
                Text(title,
                    style: TextStyle(fontSize: 16, color: Color(0xFF2B2D42), fontWeight: FontWeight.w500),
                )
              ],
            ),
            Icon(Icons.arrow_forward_ios, size: 24, color: Colors.black54),
          ],
        ),
      ),
    );
  }
}

  void showContactBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 16),
            _buildContactItem(
              icon: PhosphorIcons.phone,
              title: "Contact Number",
              subtitle: "+44 90083 38373",
            ),
            const SizedBox(height: 12),
            _buildContactItem(
              icon: PhosphorIcons.envelope,
              title: "Email",
              subtitle: "appname@domain.com",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactItem({required IconData icon, required String title, required String subtitle}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.pink.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.pink),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(subtitle, style: TextStyle(color: Colors.grey.shade600)),
            ],
          ),
        ],
      ),
    );
}
