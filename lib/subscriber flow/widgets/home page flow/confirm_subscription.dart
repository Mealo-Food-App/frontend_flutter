import 'package:app/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';


class Address {
  String type;
  String address;
  String flatNumber;
  String leaveOrderAt;

  Address({
    required this.type,
    required this.address,
    required this.flatNumber,
    required this.leaveOrderAt,
  });
}

class ConfirmSubscriptionPage extends StatefulWidget {
  const ConfirmSubscriptionPage({super.key});

  @override
  State<ConfirmSubscriptionPage> createState() => _ConfirmSubscriptionPage();
}

class _ConfirmSubscriptionPage extends State<ConfirmSubscriptionPage> {
  bool getBothMeals = false;
  String proteinPreference = 'Regular';
  List<Address> addresses = [];
  String selectedType = "Home";
  final TextEditingController addressController = TextEditingController();
  final TextEditingController flatController = TextEditingController();
  final TextEditingController leaveOrderController = TextEditingController();


  void _showBottomSheet() {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom + 16,
                top: 16,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 50,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text("Address", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                  SizedBox(height: 10),
                  _buildTextField(PhosphorIcons.map_pin, "Number, Street Name", addressController),
                  SizedBox(height: 10),
                  _buildTextField(PhosphorIcons.buildings, "Flat Number/Building Number", flatController),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      _buildRadioButton("Home", setModalState),
                      SizedBox(width: 10),
                      _buildRadioButton("Office", setModalState),
                      SizedBox(width: 10),
                      _buildRadioButton("Other", setModalState),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text("Where can we leave your meals?", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                  SizedBox(height: 10),
                  _buildTextField(PhosphorIcons.map_pin, "Place to leave order", leaveOrderController),
                  SizedBox(height: 20),
                  CustomButton(
                    onTap: () {
                      setState(() {
                        addresses.add(Address(
                          type: selectedType,
                          address: addressController.text,
                          flatNumber: flatController.text,
                          leaveOrderAt: leaveOrderController.text,
                        ));

                        // Clear input fields for the next entry
                        addressController.clear();
                        flatController.clear();
                        leaveOrderController.clear();
                        selectedType = "Home";
                      });

                      Navigator.pop(context);
                    },
                    text: 'Continue',
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
  Widget _buildTextField(IconData icon, String hintText, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.black),
        hintText: hintText,
        hintStyle: TextStyle(color: Color(0xFF757575)),
        filled: true,
        fillColor: Color(0xFFF9F9F9),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildRadioButton(String value, void Function(void Function()) setModalState) {
    return InkWell(
      onTap: () {
        setModalState(() {
          selectedType = value;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(
            color: selectedType == value ? Color(0xFFCF353F) : Color(0xFFE0E0E0),
          ),
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: 16),
            Icon(
              selectedType == value ? PhosphorIcons.circle_fill : PhosphorIcons.circle,
              color: selectedType == value ? Color(0xFFCF353F) : Color(0xFFE0E0E0),
            ),
            SizedBox(width: 5),
            Text(
              value,
              style: TextStyle(
                color: selectedType == value ? Color(0xFFCF353F) : Colors.black,
                fontSize: 18,
              ),
            ),
            SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      appBar:  AppBar(
        title: Text(
          "Confirm Subscription",
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
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Meal Summary
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Meal Summary',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          mealSummaryItem('3x', 'Peri Peri Chicken Breast, Peri Pilaf Rice, Mediterran Veg and Homemade Peri Sauce', '£24.00'),
                          mealSummaryItem('2x', 'Grilled Salmon Fillet, Garlic Mashed Potatoes, Asparagus and Lemon Butter Sauce', '£28.00'),
                          mealSummaryItem('4x', 'Vegan Buddha Bowl, Quinoa, Roasted Chickpeas, Avocado and Tahini Dressing', '£18.00'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    // Delivery Frequency
                    buildSectionTitle('Delivery Frequency'),
                    Row(
                      children: [
                        dropdownButton(['Daily', 'Weekly'], 'Daily', PhosphorIcons.calendar),
                        if (!getBothMeals)
                          const SizedBox(width: 20),
                        if (!getBothMeals)
                          dropdownButton(['2:00 PM', '6:00 PM'], '2:00 PM', PhosphorIcons.clock),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Get Both Meals',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Switch(
                          value: getBothMeals,
                          onChanged: (value) {
                            setState(() {
                              getBothMeals = value;
                            });
                          },
                          activeTrackColor: Color(0xFFCF353F)
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    SizedBox(
                      width: 300,
                      child: const Text(
                        'Once turned on, you’ll be able to get the option for getting both “Lunch” and “Dinner”.',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ),
                    if (getBothMeals)
                      SizedBox(height: 5,),
                    if (getBothMeals)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          child: buildSectionTitle('Lunch Delivery'),
                        ),
                        SizedBox(
                          width: 170,
                          child: buildSectionTitle('Dinner Delivery'),
                        ),
                      ],
                    ),
                    if (getBothMeals)
                    Row(
                      children: [
                        dropdownButton(['2:00 PM', '6:00 PM'], '2:00 PM', PhosphorIcons.clock),
                        const SizedBox(width: 20),
                        dropdownButton(['8:00 PM', '10:00 PM'], '8:00 PM', PhosphorIcons.clock),
                      ],
                    ),
                    const SizedBox(height: 15),
        
                    // Protein Preference
                    buildSectionTitle('Protein Preference'),
                    Row(
                      children: [
                        proteinCard('Regular', '400-500 kcal\n35-45g protein'),
                        const SizedBox(width: 10),
                        proteinCard('Large', '600-750 kcal\n50-65g protein', extra: '(+£1.99/meal)'),
                      ],
                    ),
                    const SizedBox(height: 15),
        
                    // Delivery Address
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildSectionTitle('Delivery Address'),
                        GestureDetector(
                          onTap: _showBottomSheet,
                          child: SizedBox(
                            child: Row(
                              children: [
                                Icon(PhosphorIcons.plus, color: Color(0xFFCF353F), size: 13.5,),
                                Text('Add', style: TextStyle(color: Color(0xFFCF353F), fontWeight: FontWeight.bold),),
                              ],
                            ),
                          )
                        )
                      ],
                    ),
                    _buildAddressContainer(),
                    const SizedBox(height: 15),
        
                    // Cost Summary
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)
                      ),
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildSectionTitle('Cost Summary'),
                          summaryRow('Main Meals (10)', '£69.90'),
                          summaryRow('Discount', '£16.78 OFF', discount: true),
                          if(!getBothMeals)
                          summaryRow('Deliver at', '2:00 PM'),
                          if(getBothMeals)
                            summaryRow('Lunch at', '2:00 PM'),
                          if(getBothMeals)
                          summaryRow('Dinner at', '8:00 PM'),
        
                          SizedBox(height: 10,),
                          dashedDivider(dashWidth: 6, dashSpace: 10),
                          summaryRow('To be paid', '£62.86'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _buildBottomBar()
          ],
        ),
      ),
    );
  }

  Widget mealSummaryItem(String quantity, String description, String price) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 400,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(quantity, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xFFCF353F)),),
                SizedBox(width: 5,),
                Flexible(
                  child: Text(
                    description,
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF2B2D42)
                    ),
                    overflow: TextOverflow.clip,
                    maxLines: 3,
                  )
                )
              ],
            ),
          ),
          SizedBox(height: 5,),
          Text(price, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,))
        ],
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget dropdownButton(List<String> items, String selectedItem, IconData icon) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Row(
          children: [
            // Leading Icon
            Icon(
              icon,
              size: 24,
              color: Color(0xFF2B2D42),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedItem,
                  isExpanded: true,
                  icon: const Icon(
                    PhosphorIcons.caret_down,
                    size: 24,
                    color: Color(0xFF2B2D42),
                  ),
                  onChanged: (String? newValue) {},
                  items: items.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(color: Color(0xFF2B2D42), fontSize: 18, fontWeight: FontWeight.w400),
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget proteinCard(String title, String details, {String? extra}) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            proteinPreference = title;
          });
        },
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: proteinPreference == title ? Color(0xFFCF353F) : Color(0xFFE0E0E0),
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                  proteinPreference == title ? PhosphorIcons.radio_button_fill : PhosphorIcons.circle,
                color: proteinPreference == title ? Color(0xFFCF353F) : Color(0xFFB2BCC9),
              ),
              Row(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: proteinPreference == title ? Color(0xFFCF353F) : Color(0xFF2B2D42),
                    ),
                  ),
                  SizedBox(width: 4),
                  if (extra != null)
                    Text(extra, style: const TextStyle(color: Color(0xFF757575), fontSize: 10)),
                ],
              ),
              const SizedBox(height: 5),
              Text(details, style: const TextStyle(fontSize: 12, color: Color(0xFF757575))),
            ],
          ),
        ),
      ),
    );
  }

  Widget summaryRow(String title, String value, {bool discount = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, color: Color(0xFF2B2D42)),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddressContainer() {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFFCF353F), width: 1.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(PhosphorIcons.radio_button_fill, color: Color(0xFFCF353F), size: 24),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('123 Farringdon Street', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFFCF353F))),
                  SizedBox(height: 4),
                  Text('Flat 5B, London, EC1A 4HD', style: TextStyle(fontSize: 14, color: Color(0xFF757575))),
                ],
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFCF353F),
              borderRadius: BorderRadius.circular(100),
            ),
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Text('HOME', style: TextStyle(color: Colors.white, fontSize: 10)),
          ),
        ],
      ),
    );
  }

  Widget dashedDivider({double dashWidth = 5, double dashSpace = 3, Color color = Colors.grey}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        30,
            (index) => SizedBox(
          width: dashWidth,
          height: 1, // Divider height
          child: DecoratedBox(
            decoration: BoxDecoration(color: color),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
          color: Colors.white
      ),
      child: CustomButton(onTap: (){
        // Navigator.pushNamed(context, '/confirm');
      }, text: "Continue"),
    );
  }
}
