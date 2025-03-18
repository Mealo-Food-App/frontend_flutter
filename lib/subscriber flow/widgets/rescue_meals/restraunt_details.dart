import 'package:app/custom_button.dart';
import 'package:app/subscriber flow/widgets/rescue_meals/order_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class RestaurantDetailsPage extends StatefulWidget {
  final Map<String, dynamic> restaurantData;

  const RestaurantDetailsPage({super.key, required this.restaurantData});

  @override
  State<RestaurantDetailsPage> createState() => _RestaurantDetailsPageState();
}

class _RestaurantDetailsPageState extends State<RestaurantDetailsPage> with SingleTickerProviderStateMixin {
  int mealCount = 1;
  int selectedIndex = 0;
  int selectedSlot = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.restaurantData["name"],
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
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    widget.restaurantData["image"] ?? "assets/default.png",
                    width: double.infinity,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.restaurantData["name"],
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(widget.restaurantData["distance"], style: const TextStyle(color: Color(0xFFB2B2B2), fontSize: 12)),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(PhosphorIcons.star_fill, color: Color(0xFFFFCC3D)),
                        const SizedBox(width: 4),
                        Text("${widget.restaurantData["rating"]}", style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
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
                          Text("One Day", style: TextStyle(color: selectedIndex == 0 ? Color(0xFFCF353F) : Color(0xFF49454F), fontSize: 14, fontWeight: selectedIndex == 0 ? FontWeight.w600 : FontWeight.normal),),
                          0
                      ),
                      _buildTab(
                        Row(
                          children: [
                            SizedBox(width: 85,child: Text("Weekly Plan", style: TextStyle(color: selectedIndex == 1 ? Color(0xFFCF353F) : Color(0xFF49454F), fontSize: 14, fontWeight: selectedIndex == 1 ? FontWeight.w600 : FontWeight.normal))),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: Color(0xFFCF353F),
                                borderRadius: BorderRadius.circular(100)
                              ),
                              child: Text("POPULAR", style: TextStyle(fontSize: 14, color: Colors.white),),
                            )
                          ],
                        ),
                          1
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                selectedIndex == 0 ? _buildDaily() : _buildWeekly(),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: _pricingSection(),
          )
        ],
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
              width: 80,
              color: Color(0xFFCF353F),
            ),
        ],
      ),
    );
  }

  Widget _buildDaily() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "How many meals do you need?",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            _counterButton(PhosphorIcons.minus, () {
              if (mealCount > 1) {
                setState(() {
                  mealCount--;
                });
              }
            }),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "$mealCount",
                style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ),
            _counterButton(Icons.add, () {
              setState(() {
                mealCount++;
              });
            }),
          ],
        ),
        const SizedBox(height: 8),
        const Text(
          "Pickup Time Slot",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            _timeSlotButton("Today", "11 am - 12 pm", 0),
            const SizedBox(width: 8),
            _timeSlotButton("Tonight", "7 pm - 10 pm", 1),
          ],
        ),
      ],
    );
  }

  Widget _buildWeekly() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "How many meals do you need this week?",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            _counterButton(PhosphorIcons.minus, () {
              if (mealCount > 1) {
                setState(() {
                  mealCount--;
                });
              }
            }),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "$mealCount",
                style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ),
            _counterButton(Icons.add, () {
              setState(() {
                mealCount++;
              });
            }),
          ],
        ),
        const SizedBox(height: 8),
        const Text(
          "Pickup Time Slot",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            _timeSlotButton("Today", "11 am - 12 pm", 0),
            const SizedBox(width: 8),
            _timeSlotButton("Tonight", "7 pm - 10 pm", 1),
          ],
        ),
      ],
    );
  }

  Widget _counterButton(IconData icon, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: Color(0xFFCF353F),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 24),
      ),
    );
  }

  Widget _timeSlotButton(String title, String time, int index) {
    bool isSelected = selectedSlot == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedSlot = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: isSelected ? Color(0xFFCF353F) : Color(0xFF2B2D42)),
            color: Colors.transparent,
          ),
          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  color: isSelected ? Color(0xFFCF353F) : Color(0xFF2B2D42),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                time,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: isSelected ? Color(0xFFCF353F) : Color(0xFF2B2D42)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _pricingSection() {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  widget.restaurantData["oldPrice"],
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF757575)
                  ),
                ),
                Text(
                  widget.restaurantData["price"],
                  style: TextStyle(
                      fontSize: 24,
                      color: Color(0xFF2B2D42)
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 200,
                child: CustomButton(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderStatusPage(),
                        ),
                      );
                    },
                    text: "Rescue and Pay"
                )
            )
          ],
        ),
      ),
    );
  }
}
