import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:frontend_flutter/biodata_page.dart';
import 'package:frontend_flutter/subscriber flow/screens/home_page.dart';
import 'package:frontend_flutter/signin_page.dart';
import 'package:frontend_flutter/subscriber flow/widgets/my_navigation.dart';
import 'package:frontend_flutter/subscriber flow/widgets/profile/address.dart';
import 'package:frontend_flutter/subscriber flow/widgets/profile/edit_profile.dart';
import 'package:frontend_flutter/subscriber flow/widgets/profile/faq.dart';
import 'package:frontend_flutter/subscriber flow/widgets/profile/notification_page.dart';
import 'package:frontend_flutter/subscriber flow/widgets/profile/subscription_page.dart';
import 'package:frontend_flutter/subscriber%20flow/widgets/home%20page%20flow/add_menu.dart';
import 'package:frontend_flutter/subscriber%20flow/widgets/home%20page%20flow/confirm_subscription.dart';
import 'package:frontend_flutter/subscriber%20flow/widgets/home%20page%20flow/create_subscription.dart';
import 'package:frontend_flutter/subscriber%20flow/widgets/home%20page%20flow/pick_restraunt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  // Allow individual screens to control their own SystemUiOverlayStyle
  // by not setting a global style here
  WidgetsFlutterBinding.ensureInitialized();

  // Stripe.publishableKey = 'pk_test_51RdlXTRkrdnZyuDPwWgcKnFnnb37u8g5YjDCF1Rpo4TAKpb18FaoXS2hm9ZBzLALc64BnMxwFIdJcYJg3xFUtdlj00vDgxKG4r';
  // Stripe.merchantIdentifier = 'merchant.com.example'; // Needed for Apple Pay, but safe to include anyway
  // Stripe.urlScheme = 'flutterstripe';
  // await Stripe.instance.applySettings();

  await Supabase.initialize(
    url: 'https://blwpqvchlhwkwxsnqgsc.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJsd3BxdmNobGh3a3d4c25xZ3NjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDM1OTEzNzIsImV4cCI6MjA1OTE2NzM3Mn0.0L9x3RAYk_tdfV_BrXqMkSPHX2iKt8kM5RQ5NIOgC_w',
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Nunito',
        primarySwatch: Colors.red,
        useMaterial3: true,
        // Fix TextStyle interpolation issues by ensuring consistent inherit values and specifying all required fields
        textTheme: TextTheme(
          displayLarge: const TextStyle(
            inherit: true,
            fontSize: 57.0,
            fontWeight: FontWeight.w400,
            letterSpacing: -0.3,
            height: 1.1,
            backgroundColor: Colors.transparent,
            wordSpacing: 0.0,
            decorationThickness: 1.0,
          ),
          displayMedium: const TextStyle(
            inherit: true,
            fontSize: 45.0,
            fontWeight: FontWeight.w400,
            letterSpacing: -0.25,
            height: 1.16,
            backgroundColor: Colors.transparent,
            wordSpacing: 0.0,
            decorationThickness: 1.0,
          ),
          displaySmall: const TextStyle(
            inherit: true,
            fontSize: 36.0,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.0,
            height: 1.22,
            backgroundColor: Colors.transparent,
            wordSpacing: 0.0,
            decorationThickness: 1.0,
          ),
          headlineLarge: const TextStyle(
            inherit: true,
            fontSize: 32.0,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.0,
            height: 1.25,
            backgroundColor: Colors.transparent,
            wordSpacing: 0.0,
            decorationThickness: 1.0,
          ),
          headlineMedium: const TextStyle(
            inherit: true,
            fontSize: 28.0,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.0,
            height: 1.29,
            backgroundColor: Colors.transparent,
            wordSpacing: 0.0,
            decorationThickness: 1.0,
          ),
          headlineSmall: const TextStyle(
            inherit: true,
            fontSize: 24.0,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.0,
            height: 1.33,
            backgroundColor: Colors.transparent,
            wordSpacing: 0.0,
            decorationThickness: 1.0,
          ),
          titleLarge: const TextStyle(
            inherit: true,
            fontSize: 22.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.0,
            height: 1.27,
            backgroundColor: Colors.transparent,
            wordSpacing: 0.0,
            decorationThickness: 1.0,
          ),
          titleMedium: const TextStyle(
            inherit: true,
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.15,
            height: 1.5,
            backgroundColor: Colors.transparent,
            wordSpacing: 0.0,
            decorationThickness: 1.0,
          ),
          titleSmall: const TextStyle(
            inherit: true,
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.1,
            height: 1.43,
            backgroundColor: Colors.transparent,
            wordSpacing: 0.0,
            decorationThickness: 1.0,
          ),
          bodyLarge: const TextStyle(
            inherit: true,
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.5,
            height: 1.5,
            backgroundColor: Colors.transparent,
            wordSpacing: 0.0,
            decorationThickness: 1.0,
          ),
          bodyMedium: const TextStyle(
            inherit: true,
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.25,
            height: 1.43,
            backgroundColor: Colors.transparent,
            wordSpacing: 0.0,
            decorationThickness: 1.0,
          ),
          bodySmall: const TextStyle(
            inherit: true,
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.4,
            height: 1.33,
            backgroundColor: Colors.transparent,
            wordSpacing: 0.0,
            decorationThickness: 1.0,
          ),
          labelLarge: const TextStyle(
            inherit: true,
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.1,
            height: 1.43,
            backgroundColor: Colors.transparent,
            wordSpacing: 0.0,
            decorationThickness: 1.0,
          ),
          labelMedium: const TextStyle(
            inherit: true,
            fontSize: 12.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.5,
            height: 1.33,
            backgroundColor: Colors.transparent,
            wordSpacing: 0.0,
            decorationThickness: 1.0,
          ),
          labelSmall: const TextStyle(
            inherit: true,
            fontSize: 11.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.5,
            height: 1.45,
            backgroundColor: Colors.transparent,
            wordSpacing: 0.0,
            decorationThickness: 1.0,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SigninPage(),
        '/biodata': (context) => BioDataPage(),
        '/navigate': (context) => NavigationWidget(),
        '/home': (context) => HomePage(),
        '/Subscription Details': (context) => SubscriptionDetailsPage(),
        '/Notification Settings': (context) => NotificationSettingsPage(),
        '/FAQs': (context) => FAQPage(),
        '/Delivery Address': (context) => DeliveryAddressPage(),
        '/edit_profile': (context) => EditProfileScreen(),
        '/create_subscription': (context) => CreateSubscriptionPage(),
        '/pick_restro': (context) => PickRestaurantsPage(),
        '/add_meal': (context) => AddMealsPage(),
        '/confirm': (context) => ConfirmSubscriptionPage(),
      },
    );
  }
}
