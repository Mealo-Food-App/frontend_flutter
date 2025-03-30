import 'package:app/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class RestroAddRescueMeals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      appBar: AppBar(
        title: Text(
          "Add Rescue Meals",
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // Attach Image
                Text("Enter Meal Price", style: sectionTitleStyle()),
                SizedBox(height: 8),
                buildTextField("Meal Name", icon: PhosphorIcons.cardholder),

                // Meal Details
                SizedBox(height: 16),
                Text("Enter Discounted Price", style: sectionTitleStyle()),
                SizedBox(height: 8),
                buildTextField("Discounted Price", icon: PhosphorIcons.cardholder),

                SizedBox(height: 16),
                Text("Enter Total Number of Meals", style: sectionTitleStyle()),
                SizedBox(height: 8),
                buildTextField("Total Number of Meals"),

                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Pickup Time SLot", style: sectionTitleStyle(),),
                    Row(
                      children: [
                        Icon(PhosphorIcons.plus, size: 14, color: Color(0xFF35CFC1),),
                        SizedBox(width: 4,),
                        Text("Add", style: TextStyle(fontSize: 14, color: Color(0xFF35CFC1)),)
                      ],
                    )
                  ],
                ),
                SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildTextField("Start Time", suffixIcon: PhosphorIcons.calendar, width: MediaQuery.of(context).size.width / 2.3),
                    buildTextField("End Time", suffixIcon: PhosphorIcons.calendar, width: MediaQuery.of(context).size.width / 2.3),
                  ],
                ),
                SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildTextField("Start Time", suffixIcon: PhosphorIcons.calendar, width: MediaQuery.of(context).size.width / 2.3),
                    buildTextField("End Time", suffixIcon: PhosphorIcons.calendar, width: MediaQuery.of(context).size.width / 2.3),
                  ],
                ),

              ],
            ),
          ),

          Container(
            height: 80,
            width: double.infinity,
            padding: EdgeInsets.all(16),
            color: Colors.white,
            child: CustomButton(onTap: () {} , text: "Add to Menu"),
          )
        ],
      ),
    );
  }

  Widget buildTextField(String hintText, {IconData? icon, int maxLines = 1, IconData? suffixIcon, double? width}) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: Colors.white, // White background
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        maxLines: maxLines,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          prefixIcon: icon != null
              ? Icon(icon, color: Colors.black)
              : null,
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 16, color: Color(0xFF757575)),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          suffixIcon: suffixIcon != null
              ? Icon(suffixIcon, color: Colors.black)
              : null,
        ),
      ),
    );
  }

  TextStyle sectionTitleStyle() {
    return TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black);
  }
}