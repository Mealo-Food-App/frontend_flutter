import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final supabase = Supabase.instance.client;
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();
  String? _avatarUrl;
  File? _avatarFile;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final userId = supabase.auth.currentUser?.id;
    if (userId == null) return;

    final response = await supabase
        .from('users')
        .select('first_name, last_name, phone_number, avatar_url')
        .eq('id', userId)
        .single();

    if (response != null) {
      setState(() {
        _firstNameController.text = response['first_name'] ?? '';
        _lastNameController.text = response['last_name'] ?? '';
        _phoneController.text = response['phone_number'] ?? '';
        _avatarUrl = response['avatar_url'];
      });
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery, imageQuality: 75);
    if (pickedFile != null) {
      setState(() {
        _avatarFile = File(pickedFile.path);
      });
    }
  }

  Future<String?> _uploadImage(File file) async {
    final userId = supabase.auth.currentUser?.id;
    final fileExt = file.path.split('.').last;
    final filePath = '$userId/avatar.$fileExt';

    final storageResponse = await supabase.storage
        .from('profile-pictures')
        .upload(filePath, file, fileOptions: const FileOptions(upsert: true));

    final publicUrl = supabase.storage.from('profile-pictures').getPublicUrl(filePath);
    return publicUrl;
  }

  Future<void> _updateProfile() async {
    final userId = supabase.auth.currentUser?.id;
    if (userId == null) return;

    String? uploadedUrl = _avatarUrl;
    if (_avatarFile != null) {
      uploadedUrl = await _uploadImage(_avatarFile!);
    }

    await supabase.from('users').update({
      'first_name': _firstNameController.text,
      'last_name': _lastNameController.text,
      'phone_number': _phoneController.text,
      'avatar_url': uploadedUrl,
    }).eq('id', userId);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('✅ Profile updated')),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final avatar = _avatarFile != null
        ? FileImage(_avatarFile!)
        : (_avatarUrl != null ? NetworkImage(_avatarUrl!) : const AssetImage('assets/profile.jpg')) as ImageProvider;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, fontFamily: 'Nunito')),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(PhosphorIcons.caret_left, size: 24),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(radius: 50, backgroundImage: avatar),
                  GestureDetector(
                    onTap: _pickImage,
                    child: const CircleAvatar(
                      radius: 14,
                      backgroundColor: Colors.red,
                      child: Icon(Icons.edit, color: Colors.white, size: 16),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text("Name", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Nunito')),
            const SizedBox(height: 5),
            Row(
              children: [
                Expanded(child: _buildTextField(PhosphorIcons.user, "First Name", _firstNameController)),
                const SizedBox(width: 10),
                Expanded(child: _buildTextField(PhosphorIcons.user, "Last Name", _lastNameController)),
              ],
            ),
            const SizedBox(height: 20),
            const Text("Phone Number", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Nunito')),
            const SizedBox(height: 5),
            _buildTextField(PhosphorIcons.phone, "Phone Number", _phoneController),
            const SizedBox(height: 40),
            _buildUpdateButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(IconData icon, String hintText, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(icon, color: Colors.black54),
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildUpdateButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _updateProfile,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        child: const Text("Update Profile", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
      ),
    );
  }
}
