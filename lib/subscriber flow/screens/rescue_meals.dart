import 'package:app/custom_button.dart';
import 'package:app/subscriber flow/widgets/rescue_meals/restraunt_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class RescueMealsPage extends StatefulWidget {
  const RescueMealsPage({super.key});

  @override
  State<RescueMealsPage> createState() => _RescueMealsPageState();
}

class _RescueMealsPageState extends State<RescueMealsPage> {
  final List<Map<String, dynamic>> restaurants = [
    {
      "name": "Urban Bites Café",
      "distance": "2.3 km away",
      "image": "assets/Restaurant.png",
      "price": "£6.80",
      "oldPrice": "£8.40",
      "rating": 4.3
    },
    {
      "name": "Bella Italia Pizzeria",
      "distance": "2.3 km away",
      "image": "assets/restro2.png",
      "price": "£6.80",
      "oldPrice": "£8.40",
      "rating": 4.3
    },
    {
      "name": "Sunny Side Diner",
      "distance": "3.1 km away",
      "image": "assets/restro2.png",
      "price": "£32.50",
      "oldPrice": "£45.00",
      "rating": 4.3
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      body: Padding(
        padding: const EdgeInsets.only(right: 16.0, left: 16, top: 16),
        child: Column(
          children: [
            Container(
              height: 48,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 12),
                  const Icon(PhosphorIcons.magnifying_glass, color: Colors.black),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search for the restaurant",
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(PhosphorIcons.sort_ascending, color: Colors.black),
                    onPressed: () {
                      // Filter action
                    },
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ),
            const SizedBox(height: 12),

            Expanded(
              child: ListView.builder(
                itemCount: restaurants.length,
                itemBuilder: (context, index) {
                  final restaurant = restaurants[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    restaurant["image"],
                                    width: 98,
                                    height: 98,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: SizedBox(
                                    height: 98,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          restaurant["name"],
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          restaurant["distance"],
                                          style: TextStyle(
                                            color: Color(0xFFB2B2B2),
                                            fontSize: 12,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              restaurant["price"],
                                              style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFF2B2D42),
                                              ),
                                            ),
                                            const SizedBox(width: 6),
                                            Text(
                                              restaurant["oldPrice"],
                                              style: const TextStyle(
                                                fontSize: 16,
                                                color: Color(0xFF757575),
                                                decoration: TextDecoration.lineThrough,
                                              ),
                                            ),
                                            const Spacer(),
                                            const Icon(
                                              PhosphorIcons.star_fill,
                                              color: Color(0xFFFFCC3D),
                                              size: 20,
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              restaurant["rating"].toString(),
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),

                                        Text(
                                          "Save up to £20 on weekly subscription",
                                          style: TextStyle(
                                            color: Color(0xFFB2B2B2),
                                            fontSize: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15,),
                            CustomButton(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RestaurantDetailsPage(restaurantData: restaurant),
                                    ),
                                  );
                                },
                                text: 'Reserve Now'
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
