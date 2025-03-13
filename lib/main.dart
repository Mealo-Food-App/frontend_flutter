import 'package:app/screens/biodata_page.dart';
import 'package:app/screens/home_page.dart';
import 'package:app/screens/signin_page.dart';
import 'package:app/widgets/my_navigation.dart';
import 'package:app/widgets/profile/address.dart';
import 'package:app/widgets/profile/edit_profile.dart';
import 'package:app/widgets/profile/faq.dart';
import 'package:app/widgets/profile/notification_page.dart';
import 'package:app/widgets/profile/subscription_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food App',
      theme: ThemeData(primarySwatch: Colors.red, useMaterial3: true),
      initialRoute: '/',
      routes: {
        '/' : (context) => SigninPage(),
        '/biodata' : (context) => BioDataPage(),
        '/navigate' : (context) => NavigationWidget(),
        '/home' : (context) => HomePage(),
        '/Subscription Details' : (context) => SubscriptionDetailsPage(),
        '/Notification Settings' : (context) => NotificationSettingsPage(),
        '/FAQs' : (context) => FAQPage(),
        '/Delivery Address' : (context) => DeliveryAddressPage(),
        '/edit_profile' : (context) => EditProfileScreen(),
      },
    );
  }
}
