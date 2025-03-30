import 'package:frontend_flutter/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0, left: 16, top: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              height: 230,
              width: double.infinity,
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CircleAvatar(radius: 36, child: Text('Hello')),
                      SizedBox(height: 12),
                      Text(
                        'John Doe',
                        style: TextStyle(
                          color: Color(0xFF2B2D42),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Nunito',
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '+44 98 8393 9002',
                        style: TextStyle(
                          color: Color(0xFF757575),
                          fontFamily: 'Nunito',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  CustomButton(
                    onTap:
                        () => {Navigator.pushNamed(context, '/edit_profile')},
                    text: 'Edit Profile',
                    icon: PhosphorIcons.pencil_simple,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            _buildMenuSection('General', [
              _buildMenuItem(
                'Subscription Details',
                PhosphorIcons.credit_card,
                context,
              ),
              SizedBox(height: 8),
              _buildMenuItem(
                'Notification Settings',
                PhosphorIcons.bell_simple,
                context,
              ),
              SizedBox(height: 8),
              _buildMenuItem(
                'Delivery Address',
                PhosphorIcons.map_pin,
                context,
              ),
            ]),
            _buildMenuSection('Support', [
              _buildMenuItem('FAQs', PhosphorIcons.question, context),
              SizedBox(height: 8),
              _buildMenuItem(
                'Contact Support',
                PhosphorIcons.phone,
                context,
                isSupport: true,
              ),
            ]),
            _buildMenuItem('Logout', PhosphorIcons.sign_out, context),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuSection(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: 'Nunito',
            color: Colors.black,
          ),
        ),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(children: items),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildMenuItem(
    String title,
    IconData icon,
    BuildContext context, {
    bool isSupport = false,
  }) {
    return GestureDetector(
      onTap: () {
        if (isSupport) {
          showContactBottomSheet(context);
        } else if (title == 'Logout') {
          _showLogoutConfirmationDialog(context);
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
                Icon(icon, color: Colors.black, size: 24),
                SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF2B2D42),
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w500,
                  ),
                ),
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
    builder:
        (context) => Container(
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

Widget _buildContactItem({
  required IconData icon,
  required String title,
  required String subtitle,
}) {
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
            Text(
              title,
              style: const TextStyle(
                fontFamily: 'Nunito',
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                fontFamily: 'Nunito',
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

void _showLogoutConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, // Prevent dismissing by tapping outside
    builder: (BuildContext dialogContext) {
      // Use dialogContext instead of context
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text(
          'Logout Confirmation',
          style: TextStyle(fontFamily: 'Nunito'),
        ),
        content: const Text(
          'Are you sure you want to logout?',
          style: TextStyle(fontFamily: 'Nunito'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(
                dialogContext,
              ).pop(); // Close the dialog using dialogContext
            },
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.black, fontFamily: 'Nunito'),
            ),
          ),
          TextButton(
            onPressed: () {
              // Perform logout actions here
              Navigator.of(
                dialogContext,
              ).pop(); // Close the dialog using dialogContext
              // Navigate to login screen
              Navigator.of(context).pushNamedAndRemoveUntil(
                '/signin_page', // Replace with your login route
                (route) => false, // This will remove all previous routes
              );
            },
            child: const Text(
              'Logout',
              style: TextStyle(color: Colors.red, fontFamily: 'Nunito'),
            ),
          ),
        ],
      );
    },
  );
}
