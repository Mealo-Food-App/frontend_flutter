import 'package:app/custom_button.dart';
import 'package:app/utils/config_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class AddMealsPage extends StatefulWidget {
  @override
  _AddMealsPageState createState() => _AddMealsPageState();
}

class _AddMealsPageState extends State<AddMealsPage> {
  int mealCount = 0;
  String selectedDay = "Sun";
  int selectedIndex = 0 ;
  List<Map<String, dynamic>> meals = [
    {
      "image": "assets/peri_peri.png",
      "tags": ["Dairy Free", "Gluten Free", "Halal"],
      "name": "Peri Peri Chicken Breast, Peri Pilaf Rice, Mediterran Veg and Homemade Peri Sauce",
      "details": "423 kcal | 40.9g protein",
      "price": 49.86,
      "count": 0
    },
    {
      "image": "assets/bbq.png",
      "tags": ["Vegan", "Low Fat", "Organic"],
      "name": "Vegan Protein Bowl",
      "details": "390 kcal | 35.2g protein",
      "price": 39.99,
      "count": 0
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      appBar: AppBar(
        title: Text(
          "Add Meals",
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
        children: [
          _buildDaySelector(),
          SizedBox(height: 16,),
          _buildMealTypeTabs(),
          SizedBox(
            // height: SizeConfig.customHeight(context, 518),
            height: SizeConfig.screenHeight(context) - SizeConfig.customHeight(context, 285),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(height: 8,),
                  _buildSearchBar(),
                  SizedBox(height: 8,),
                  Expanded(child: _buildMealList()),
                ],
              ),
            ),
          ),
          _buildBottomBar(),
        ],
      ),
    );
  }

  Widget _buildDaySelector() {
    List<String> days = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Colors.white,
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: days.map((day) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedDay = day;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: selectedDay == day ? Color(0xFFCF353F) : Color(0xFFF9F9F9),
                  ),
                  child: Text(
                    day,
                    style: TextStyle(
                      fontSize: 18,
                      color: selectedDay == day ? Colors.white : Color(0xFF2B2D42),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildMealTypeTabs() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: EdgeInsets.only(top: 11),
        height: 48,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildTab(
                Text("Lunch", style: TextStyle(color: selectedIndex == 0 ? Color(0xFFCF353F) : Color(0xFF49454F), fontSize: 14, fontWeight: selectedIndex == 0 ? FontWeight.w600 : FontWeight.normal),),
                0
            ),
            _buildTab(
                Text("Dinner", style: TextStyle(color: selectedIndex == 1 ? Color(0xFFCF353F) : Color(0xFF49454F), fontSize: 14, fontWeight: selectedIndex == 1 ? FontWeight.w600 : FontWeight.normal),),
                1
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildTab(Widget tabContent, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Column(
        children: [
          SizedBox(
            width: 180,
            child: Center(child: tabContent),
          ),
          if (selectedIndex == index)
            Container(
              margin: const EdgeInsets.only(top: 10),
              height: 3,
              width: 30,
              color: Color(0xFFCF353F),
            ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return  Container(
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          SizedBox(width: 8,),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search across the menu",
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          IconButton(
            onPressed: (){},
            icon: Icon(PhosphorIcons.magnifying_glass, color: Colors.black),
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }

  Widget _buildMealList() {
    return ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) {
        final meal = meals[index];
        List<Color> tagColors = [Colors.orange, Colors.blue, Colors.green, Colors.purple, Colors.red, Colors.teal];
        List<Color> textColor = [Color(0xFF2B2D42), Colors.white, Colors.white, Colors.white, Colors.white, Colors.white];

        return GestureDetector(
          onTap: (){
            print("Clicked");
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1), // Shadow color
                  offset: Offset(2, 4), // X and Y offset
                  blurRadius: 6, // Blur intensity
                  spreadRadius: 1, // Spread of shadow
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    meal["image"],
                    height: 170,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: meal["tags"].asMap().entries.map<Widget>((entry) {
                          int tagIndex = entry.key;
                          String tag = entry.value;
                          return _buildTag(tag, tagColors[tagIndex % tagColors.length], textColor[tagIndex % tagColors.length]); // Assigning colors cyclically
                        }).toList(),
                      ),
                      SizedBox(height: 5),
                      Text(meal["name"], style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                      Text(meal["details"], style: TextStyle(fontSize: 12, color: Color(0xFFB2B2B2))),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("£${meal["price"].toStringAsFixed(2)}", style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Color(0xFF2B2D42))),
                          Row(
                            children: [
                              _counterButton(PhosphorIcons.minus, () {
                                if (mealCount > 0) {
                                  setState(() {
                                    mealCount--;
                                  });
                                }
                              },
                                buttonColor: mealCount != 0 ? Color(0xFFCF353F) : Color.fromRGBO(207, 53, 63, 0.5),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  "$mealCount",
                                  style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                                ),
                              ),
                              _counterButton(Icons.add, () {
                                if (mealCount < 10) {
                                  setState(() {
                                    mealCount ++;
                                  });
                                }},
                                buttonColor: mealCount != 10 ? Color(0xFFCF353F) : Color.fromRGBO(207, 53, 63, 0.5),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTag(String label, Color color, Color textColor) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(label, style: TextStyle(color: textColor, fontSize: 10)),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Total Meals ", style: TextStyle(fontSize: 12, color: Color(0xFF757575))),
              Text("$mealCount/10", style: TextStyle(fontSize: 24, color: Color(0xFF2B2D42), fontWeight: FontWeight.w600)),
            ],
          ),
          SizedBox(
            width: 200,
            child: CustomButton(onTap: (){
              Navigator.pushNamed(context, '/confirm');
            }, text: "Continue"),
          )
        ],
      ),
    );
  }

  Widget _counterButton(IconData icon, VoidCallback onPressed, {Color buttonColor = const Color(0xFFCF353F)}) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: buttonColor,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 24),
      ),
    );
  }
}
