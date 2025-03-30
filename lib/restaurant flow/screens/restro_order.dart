import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class RestroOrderPage extends StatefulWidget {
  @override
  _RestroOrderPageState createState() => _RestroOrderPageState();
}

class _RestroOrderPageState extends State<RestroOrderPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF9F9F9),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Column(
            children: [
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
                    _buildTab("Ongoing Orders", 0),
                    _buildTab("Completed Orders", 1),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              selectedIndex == 0 ? _buildOngoingOrders() : _buildCompletedOrders(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTab(String title, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: selectedIndex == index ? Color(0xFFCF353F) : Color(0xFF49454F),
            ),
          ),
          if (selectedIndex == index)
            Container(
              margin: const EdgeInsets.only(top: 10),
              height: 3,
              width: 80,
              color: Colors.red,
            ),
        ],
      ),
    );
  }

  Widget _buildOngoingOrders() {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 246,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              height: 48,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child:  Row(
                children: [
                  Icon(PhosphorIcons.magnifying_glass, size: 24, color: Colors.black),
                  SizedBox(width: 5,),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Search by order ID or date',
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Color(0xFF757575), fontSize: 16)
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 16,),
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
                          "Order #993",
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
            SizedBox(height: 8,),
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
                          "Order #994",
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
            SizedBox(height: 8,),
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
                          "Order #995",
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
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCompletedOrders() {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 246,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              height: 48,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child:  Row(
                children: [
                  Icon(PhosphorIcons.magnifying_glass, size: 24, color: Colors.black),
                  SizedBox(width: 5,),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Search by order ID or date',
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Color(0xFF757575), fontSize: 16)
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 16,),
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
                          "Order #993",
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
            SizedBox(height: 8,),
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
                          "Order #994",
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
            SizedBox(height: 8,),
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
                          "Order #995",
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
            )
          ],
        ),
      ),
    );
  }
}