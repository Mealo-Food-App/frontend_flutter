import 'package:app/utils/config_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:lottie/lottie.dart';

class RestroRescueMeals extends StatefulWidget {
  const RestroRescueMeals({super.key});

  @override
  State<RestroRescueMeals> createState() => _RestroRescueMealsState();
}

class _RestroRescueMealsState extends State<RestroRescueMeals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/restro_add_rescue_meal');
          },
          backgroundColor: Colors.white,
          child: Icon(
            PhosphorIcons.plus,
            color: Color(0xFFFF4949),
            size: 24,
          )
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: SizeConfig.screenWidth(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset(
                  'assets/ghost.json', // Path to your Lottie file
                  width: 200,
                  height: 200,
                  repeat: true, 
                  reverse: false,
                  animate: true,
                ),
                Text("Nothing added yet"),
                Text("Tap on the + button to create your rescue menu")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
