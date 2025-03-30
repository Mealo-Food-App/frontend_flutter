import 'package:app/utils/config_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class RestroHomePage extends StatefulWidget {
  const RestroHomePage({super.key});

  @override
  State<RestroHomePage> createState() => _RestroHomePageState();
}

class _RestroHomePageState extends State<RestroHomePage> {
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
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/restro_add_meal');
          },
          backgroundColor: Colors.white,
          child: Icon(
            PhosphorIcons.plus,
            color: Color(0xFFFF4949),
            size: 24,
          )
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Material(
                        child: Container(
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
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Order #900",
                                      style: TextStyle(color: Color(0xFF757575), fontWeight: FontWeight.w500, fontSize: 14),
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/order.png',
                                          height: 96,
                                          width: 96,
                                        ),
                                        SizedBox(width: 10,),
                                        SizedBox(
                                          width: 214,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "Peri Peri Chicken Breast, Peri Pilaf Rice, Mediterran Veg and Homemade Peri Sauce",
                                                style: TextStyle(color: Color(0xFF2B2D42), fontSize: 16),
                                                overflow: TextOverflow.clip,
                                              ),
                                              const SizedBox(height: 5),
                                              const Text(
                                                "Feb 15, 2025 2:00 PM",
                                                style: TextStyle(color: Colors.grey),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 24,),
                      Text('Today\'s menu', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                    ]
                ),
              ),
              SizedBox(
                height: SizeConfig.customHeight(context, 363),
                child: PageView.builder(
                  itemCount: meals.length,
                  onPageChanged: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    final meal = meals[index];
                    List<Color> tagColors = [Colors.orange, Colors.blue, Colors.green, Colors.purple, Colors.red, Colors.teal];
                    List<Color> textColor = [Color(0xFF2B2D42), Colors.white, Colors.white, Colors.white, Colors.white, Colors.white];

                    return GestureDetector(
                      onTap: (){
                        print("Clicked");
                      },
                      child: Container(
                        height: SizeConfig.customHeight(context, 300),
                        margin: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              offset: Offset(2, 4),
                              blurRadius: 6,
                              spreadRadius: 1,
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
                                height: SizeConfig.customHeight(context, 170),
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
                ),
              ), // Add spacing before the loader
              Center(
                child: Container(
                  width: 60,
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Color(0xFFE0E0E0),
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(meals.length, (index) {
                      return CircleAvatar(
                        radius: 4, // Size of the circles
                        backgroundColor: index == selectedIndex
                            ? Color(0xFFCF353F) // First circle is red
                            : Colors.white, // Others are white
                      );
                    }),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
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
}
