import 'package:app/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class RestroMenu extends StatefulWidget {
  const RestroMenu({super.key});

  @override
  State<RestroMenu> createState() => _RestroMenuState();
}

class _RestroMenuState extends State<RestroMenu> {
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
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16, top: 8),
        child: Column(
          children: [
            _buildSearchBar(),
            SizedBox(height: 8,),
            Expanded(child: _buildMealList()),
          ],
        ),
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
          IconButton(onPressed: (){}, icon: Icon(PhosphorIcons.magnifying_glass, color: Colors.black,)),
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
            onPressed: () {
              _showBottomModal(context);
            },
            icon: Icon(PhosphorIcons.sliders, color: Colors.black),
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
                      Text("£${meal["price"].toStringAsFixed(2)}", style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Color(0xFF2B2D42))),

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

  void _showBottomModal(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Color(0xFFF9F9F9),
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Icon(PhosphorIcons.minus, size: 40,),
              ),
              SizedBox(height: 12,),
              Text(
                'Dietary Labels',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 8),
              _buildRadioOption("Gluten Free", PhosphorIcons.circle, Color(0xFFD9D9D9)),
              SizedBox(height: 4),
              _buildRadioOption("Diary Free", PhosphorIcons.circle, Color(0xFFD9D9D9)),
              SizedBox(height: 16),
              Text(
                'Dietary Labels',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 8),
              _buildRadioOption("Sunday", PhosphorIcons.circle, Color(0xFFD9D9D9)),
              SizedBox(height: 8),
              _buildRadioOption("Monday", PhosphorIcons.circle, Color(0xFFD9D9D9)),
              SizedBox(height: 8),
              _buildRadioOption("Tuesday", PhosphorIcons.circle, Color(0xFFD9D9D9)),
              SizedBox(height: 8),
              _buildRadioOption("Wednesday", PhosphorIcons.circle, Color(0xFFD9D9D9)),
              SizedBox(height: 8),
              _buildRadioOption("Thursday", PhosphorIcons.circle, Color(0xFFD9D9D9)),
              SizedBox(height: 8),
              _buildRadioOption("Friday", PhosphorIcons.circle, Color(0xFFD9D9D9)),
              SizedBox(height: 8),
              _buildRadioOption("Saturday", PhosphorIcons.circle, Color(0xFFD9D9D9)),
              SizedBox(height: 16),
              CustomButton(onTap: (){}, text: "Filter")
            ],
          ),
        );
      },
    );
  }

  Widget _buildRadioOption(String label, IconData icon, Color color) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: color),
          SizedBox(width: 8,),
          Text(label, style: TextStyle(fontSize: 18, color: Color(0xFF2B2D42)),),
        ],
      ),
    );
  }
}
