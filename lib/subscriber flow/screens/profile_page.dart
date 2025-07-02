import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:frontend_flutter/custom_button.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final supabase = Supabase.instance.client;
  String firstName = '';
  String lastName = '';
  String phoneNumber = '';
  String? avatarUrl;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    final userId = supabase.auth.currentUser?.id;
    if (userId == null) {
      print("⚠️ No user logged in");
      setState(() => isLoading = false);
      return;
    }

    try {
      final response = await supabase
          .from('users')
          .select('first_name, last_name, phone_number, avatar_url')
          .eq('id', userId)
          .single();

      if (mounted) {
        setState(() {
          firstName = response['first_name'] ?? '';
          lastName = response['last_name'] ?? '';
          phoneNumber = response['phone_number'] ?? '';
          avatarUrl = response['avatar_url'];
          isLoading = false;
        });
      }
    } catch (e) {
      print("❌ Error loading profile: $e");
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final avatar = avatarUrl != null
        ? NetworkImage(avatarUrl!)
        : null;

    return Scaffold(
      body: SafeArea(
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 36,
                          backgroundImage: avatar,
                          child: avatar == null
                              ? const Icon(Icons.person, size: 36)
                              : null,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          '$firstName $lastName',
                          style: const TextStyle(
                            color: Color(0xFF2B2D42),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Nunito',
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          phoneNumber,
                          style: const TextStyle(
                            color: Color(0xFF757575),
                            fontFamily: 'Nunito',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    CustomButton(
                      onTap: () {
                        Navigator.pushNamed(context, '/edit_profile')
                            .then((_) => _loadUserProfile());
                      },
                      text: 'Edit Profile',
                      icon: PhosphorIcons.pencil_simple,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              _buildMenuSection('General', [
                _buildMenuItem('Subscription Details', PhosphorIcons.credit_card, context),
                const SizedBox(height: 8),
                _buildMenuItem('Notification Settings', PhosphorIcons.bell_simple, context),
                const SizedBox(height: 8),
                _buildMenuItem('Delivery Address', PhosphorIcons.map_pin, context),
              ]),
              _buildMenuSection('Support', [
                _buildMenuItem('FAQs', PhosphorIcons.question, context),
                const SizedBox(height: 8),
                _buildMenuItem('Contact Support', PhosphorIcons.phone, context, isSupport: true),
              ]),
              _buildMenuItem('Logout', PhosphorIcons.sign_out, context),
              const SizedBox(height: 20),
            ],
          ),
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
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: 'Nunito',
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        Column(children: items),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildMenuItem(String title, IconData icon, BuildContext context,
      {bool isSupport = false}) {
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
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
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
                const SizedBox(width: 10),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF2B2D42),
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const Icon(Icons.arrow_forward_ios, size: 24, color: Colors.black54),
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
          _buildContactItem(icon: PhosphorIcons.phone, title: "Contact Number", subtitle: "+44 90083 38373"),
          const SizedBox(height: 12),
          _buildContactItem(icon: PhosphorIcons.envelope, title: "Email", subtitle: "appname@domain.com"),
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
            Text(title, style: const TextStyle(fontFamily: 'Nunito', fontWeight: FontWeight.bold)),
            Text(subtitle, style: TextStyle(fontFamily: 'Nunito', color: Colors.grey.shade600)),
          ],
        ),
      ],
    ),
  );
}

void _showLogoutConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (dialogContext) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Logout Confirmation', style: TextStyle(fontFamily: 'Nunito')),
        content: const Text('Are you sure you want to logout?', style: TextStyle(fontFamily: 'Nunito')),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Cancel', style: TextStyle(color: Colors.black, fontFamily: 'Nunito')),
          ),
          TextButton(
            onPressed: () {
              Supabase.instance.client.auth.signOut();
              Navigator.of(dialogContext).pop();
              Navigator.of(context).pushNamedAndRemoveUntil('/signin_page', (route) => false);
            },
            child: const Text('Logout', style: TextStyle(color: Colors.red, fontFamily: 'Nunito')),
          ),
        ],
      );
    },
  );
}
