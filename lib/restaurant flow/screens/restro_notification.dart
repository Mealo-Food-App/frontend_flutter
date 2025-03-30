import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class RestroNotificationSettingsPage extends StatefulWidget {
  @override
  _RestroNotificationSettingsPageState createState() => _RestroNotificationSettingsPageState();
}

class _RestroNotificationSettingsPageState extends State<RestroNotificationSettingsPage> {

  bool orderUpdates = true;
  bool appUpdates = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      appBar:  AppBar(
        title: Text(
          'Notification Settings',
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSwitchTile(
              title: "Order Updates",
              subtitle: "Receive alerts on order confirmations, status changes, and cancellations.",
              value: orderUpdates,
              onChanged: (val) => setState(() => orderUpdates = val),
            ),
            SizedBox(height: 7,),
            _buildSwitchTile(
              title: "App Updates",
              subtitle: "Be the first informed about enhancements, new features, and critical updates.",
              value: appUpdates,
              onChanged: (val) => setState(() => appUpdates = val),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchTile({required String title, required String subtitle, required bool value, required Function(bool) onChanged}) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
      ),
      child: SwitchListTile(
        title: Text(title, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
        subtitle: Text(subtitle, style: TextStyle(fontSize: 14),),
        value: value,
        onChanged: onChanged,
        activeTrackColor: Color(0xFFCF353F),
      ),
    );
  }
}
