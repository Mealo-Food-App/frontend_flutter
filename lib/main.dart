import 'package:app/biodata_page.dart';
import 'package:app/subscriber flow/screens/home_page.dart';
import 'package:app/signin_page.dart';
import 'package:app/subscriber flow/widgets/my_navigation.dart';
import 'package:app/subscriber flow/widgets/profile/address.dart';
import 'package:app/subscriber flow/widgets/profile/edit_profile.dart';
import 'package:app/subscriber flow/widgets/profile/faq.dart';
import 'package:app/subscriber flow/widgets/profile/notification_page.dart';
import 'package:app/subscriber flow/widgets/profile/subscription_page.dart';
import 'package:app/subscriber%20flow/widgets/home%20page%20flow/add_menu.dart';
import 'package:app/subscriber%20flow/widgets/home%20page%20flow/confirm_subscription.dart';
import 'package:app/subscriber%20flow/widgets/home%20page%20flow/create_subscription.dart';
import 'package:app/subscriber%20flow/widgets/home%20page%20flow/pick_restraunt.dart';
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
      theme: ThemeData(
          primarySwatch: Colors.red,
          useMaterial3: true
      ),
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
        '/create_subscription' : (context) => CreateSubscriptionPage(),
        '/pick_restro': (context) => PickRestaurantsPage(),
        '/add_meal': (context) => AddMealsPage(),
        '/confirm': (context) => ConfirmSubscriptionPage()
      },
    );
  }
}
