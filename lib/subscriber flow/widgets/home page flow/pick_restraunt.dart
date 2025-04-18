import 'package:frontend_flutter/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class PickRestaurantsPage extends StatefulWidget {
  const PickRestaurantsPage({super.key});

  @override
  _PickRestaurantsPageState createState() => _PickRestaurantsPageState();
}

class _PickRestaurantsPageState extends State<PickRestaurantsPage> {
  int? selectedIndex;

  List<Map<String, dynamic>> restaurants = [
    {'name': 'Urban Bites Café', 'distance': '2.3 km away', 'rating': 4.3},
    {'name': 'Urban Bites Café', 'distance': '2.3 km away', 'rating': 4.3},
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final cardWidth = screenSize.width - 32; // Accounting for padding
    final imageHeight = screenSize.height * 0.2; // 20% of screen height

    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      appBar: AppBar(
        title: Text(
          "Pick Restaurants",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            fontFamily: 'Nunito',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(PhosphorIcons.caret_left, size: 24),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(16),
                itemCount: restaurants.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      width: cardWidth,
                      margin: EdgeInsets.only(bottom: 16),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color:
                              selectedIndex == index
                                  ? Colors.red
                                  : Colors.transparent,
                          width: 2,
                        ),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/peri_peri.png',
                              width: double.infinity,
                              height: imageHeight,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      restaurants[index]['name'],
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF2B2D42),
                                        fontFamily: 'Nunito',
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      restaurants[index]['distance'],
                                      style: TextStyle(
                                        color: Color(0xFFB2B2B2),
                                        fontSize: 12,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    PhosphorIcons.star_fill,
                                    color: Color(0xFFFFCC3D),
                                    size: 20,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    restaurants[index]['rating'].toString(),
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: CustomButton(
                onTap: () {
                  selectedIndex != null
                      ? Navigator.pushNamed(context, "/add_meal")
                      : null;
                },
                text: "Continue",
                backgroundColor:
                    selectedIndex != null
                        ? Color(0xFFCF353F)
                        : Color.fromRGBO(207, 53, 63, 0.5),
                borderColor:
                    selectedIndex != null
                        ? Color(0xFFCF353F)
                        : Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
