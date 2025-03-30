import 'package:frontend_flutter/custom_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/create_subscription');
        },
        backgroundColor: Colors.white,
        child: Icon(
          Icons.add,
          color: Color(0xFFFF4949),
          size: 24,
        )
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Your Plan",
                              style: TextStyle(fontSize: 18, fontFamily: 'Nunito', fontWeight: FontWeight.w700),
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text("Upcoming Delivery", style: TextStyle(fontSize: 14, fontFamily: 'Nunito', color: Color(0xFF2B2D42))),
                                Text("Today at 12:30 PM", style: TextStyle(fontSize: 14, color: Color(0xFF2B2D42), fontFamily: 'Nunito', fontWeight: FontWeight.w600)),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text("Remaining Meals", style: TextStyle(fontSize: 14, color: Colors.black, fontFamily: 'Nunito', fontWeight: FontWeight.w700)),
                                Text("08/10", style: TextStyle(fontSize: 14, fontFamily: 'Nunito', fontWeight: FontWeight.w700)),
                              ],
                            ),
                            const SizedBox(height: 8),
                            LinearProgressIndicator(
                              value: 0.8,
                              backgroundColor: Color(0xFFF9F9F9),
                              color: Color(0xFFCF353F),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomButton(
                                  onTap: () {} ,
                                  text: 'Pause',
                                  backgroundColor: Color(0xFFFFCC3D),
                                  width: 150,
                                  textColor: Color(0xFF2B2D42),
                                  borderColor: Colors.transparent,
                                ),
                                CustomButton(
                                  onTap: () {} ,
                                  text: 'Cancel',
                                  backgroundColor: Color(0xFFFF4949),
                                  width: 150,
                                  borderColor: Colors.transparent,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),
                    const Text(
                      "Upcoming Order",
                      style: TextStyle(fontSize: 18, fontFamily: 'Nunito', fontWeight: FontWeight.w700),
                    ),
                    Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            const SizedBox(height: 8),
                            const Text(
                              "Peri Peri Chicken Breast, Peri Pilaf Rice, Mediterranean Veg, and Homemade Peri Sauce",
                              style: TextStyle(fontSize: 18, color: Color(0xFF2B2D42), fontFamily: 'Nunito', fontWeight: FontWeight.w700, height: 1.33),
                            ),
                            SizedBox(height:8),
                            Divider(),
                            SizedBox(height:8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text("ETA", style: TextStyle(fontSize: 14, fontFamily: 'Nunito', color: Color(0xFF2B2D42))),
                                Text("Today, 2:00 PM", style: TextStyle(fontSize: 14, fontFamily: 'Nunito', color: Color(0xFF2B2D42))),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF89DA8C),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Don't let hunger win!",
                                style: TextStyle(fontSize: 24, fontFamily: 'Nunito', fontWeight: FontWeight.w700, color: Color(0xFF2B2D42)),
                              ),
                              const SizedBox(height: 8),
                              SizedBox(
                                width: 230,
                                child: const Text(
                                  "Get surplus meals at really affordable prices, and enjoy amazing food without worrying about your budget.",
                                  style: TextStyle(fontSize: 12, fontFamily: 'Nunito', color: Colors.white),
                                ),
                              ),
                              const SizedBox(height: 16),
                              CustomButton(
                                onTap: () {},
                                text: 'Order Now',
                                width: 120,
                                backgroundColor: Colors.white,
                                borderColor: Colors.transparent,
                                textColor: Colors.black,
                                fontWeight: FontWeight.w300,
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: SizedBox(
                              height: 150,
                              child: Image.asset(
                                'assets/food.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      ),
    );
  }
}
