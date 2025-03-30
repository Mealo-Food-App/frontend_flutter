import 'package:frontend_flutter/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class CreateSubscriptionPage extends StatefulWidget {
  const CreateSubscriptionPage({super.key});

  @override
  _CreateSubscriptionPageState createState() => _CreateSubscriptionPageState();
}

class _CreateSubscriptionPageState extends State<CreateSubscriptionPage> {
  int selectedMeal = 0;
  final List<String> mealOptions = ["Just me", "2 of us", "3 of us", "4 of us"];
  final List<String> mealPreferences = ["Meat & Vegan", "Vegetarian", "Vegan"];
  String selectedPreference = "Meat & Vegan";
  int selectedMealsPerWeek = 6;
  final List<Map<String, int>> weekMealOptions = [
    {'meals': 6, 'total': 12},
    {'meals': 8, 'total': 16},
    {'meals': 10, 'total': 20},
    {'meals': 12, 'total': 24},
  ];
  final TextEditingController _postcodeController = TextEditingController();

  void _showPostcodeModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.location_on, color: Colors.red, size: 40),
              ),
              SizedBox(height: 7),
              Text(
                _postcodeController.text.isNotEmpty
                    ? _postcodeController.text
                    : "EC1A 4HD",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Nunito',
                ),
              ),
              // SizedBox(height: 4),
              Text(
                "Central London",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                  fontFamily: 'Nunito',
                ),
              ),
              SizedBox(height: 30),
              CustomButton(
                onTap: () => {Navigator.pop(context)},
                text: 'Add new postcode',
                backgroundColor: Colors.white,
                textColor: Color(0xFFCF353F),
              ),
              SizedBox(height: 10),
              CustomButton(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/pick_restro');
                },
                text: 'Confirm',
              ),
              SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        title: Text(
          "Create Subscription",
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
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      radioButton(),
                      SizedBox(height: 8),
                      Text(
                        "Meal Preference",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Nunito',
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedPreference,
                            isExpanded: true,
                            icon: Icon(PhosphorIcons.caret_down),
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF2B2D42),
                              fontFamily: 'Nunito',
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedPreference = newValue!;
                              });
                            },
                            items:
                                mealPreferences.map((String preference) {
                                  return DropdownMenuItem<String>(
                                    value: preference,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 12,
                                      ),
                                      decoration: BoxDecoration(
                                        //color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        preference,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF2B2D42),
                                          fontFamily: 'Nunito',
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                          ),
                        ),
                      ),
                      weekRadioButton(),
                      SizedBox(height: 16),
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Main Meals (10)",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF2B2D42),
                                    fontFamily: 'Nunito',
                                  ),
                                ),
                                Text(
                                  "£69.90",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    fontFamily: 'Nunito',
                                  ),
                                ),
                              ],
                            ),
                            if (selectedMeal != 0) SizedBox(height: 8),
                            if (selectedMeal != 0)
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Meal per head",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF2B2D42),
                                      fontFamily: 'Nunito',
                                    ),
                                  ),
                                  Text(
                                    (selectedMealsPerWeek / (selectedMeal + 1))
                                        .toStringAsFixed(2),
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontFamily: 'Nunito',
                                    ),
                                  ),
                                ],
                              ),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Discount",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF2B2D42),
                                    fontFamily: 'Nunito',
                                  ),
                                ),
                                Text(
                                  "£16.78 OFF",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    fontFamily: 'Nunito',
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 16,
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xFFD6FFB9),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    PhosphorIcons.percent,
                                    color: Color(0xFF37A331),
                                    size: 16,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    "Price Per Meal:",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF2B2D42),
                                      fontFamily: 'Nunito',
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    "£5.31",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF37A331),
                                      fontFamily: 'Nunito',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              child: SafeArea(
                top: false,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "£69.90",
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF757575),
                            fontFamily: 'Nunito',
                          ),
                        ),
                        Text(
                          "£62.86",
                          style: TextStyle(
                            fontSize: 24,
                            color: Color(0xFF2B2D42),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Nunito',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 200,
                      child: CustomButton(
                        onTap: () => {_showPostcodeModal(context)},
                        text: "Select Plan",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget radioButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "No. of Meals",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Nunito',
          ),
        ),
        SizedBox(height: 8),
        GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 3,
          ),
          itemCount: mealOptions.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedMeal = index;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color:
                        selectedMeal == index
                            ? Color(0xFFCF353F)
                            : Color(0xFFE0E0E0),
                  ),
                  color: Colors.transparent,
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 8),
                    Icon(
                      selectedMeal == index
                          ? PhosphorIcons.radio_button_fill
                          : PhosphorIcons.circle,
                      color:
                          selectedMeal == index
                              ? Color(0xFFCF353F)
                              : Color(0xFFD9D9D9),
                      size: 24,
                    ),
                    SizedBox(width: 8),
                    Text(
                      mealOptions[index],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color:
                            selectedMeal == index
                                ? Color(0xFFCF353F)
                                : Color(0xFF2B2D42),
                        fontFamily: 'Nunito',
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget weekRadioButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8),
        Text(
          "Meals per week",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Nunito',
          ),
        ),
        SizedBox(height: 8),
        GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2.4,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: mealOptions.length,
          itemBuilder: (context, index) {
            final meal = weekMealOptions[index]['meals']!;
            final totalMeal = weekMealOptions[index]['total']!;
            bool isSelected = meal == selectedMealsPerWeek;

            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedMealsPerWeek = meal;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected ? Color(0xFFCF353F) : Color(0xFFE0E0E0),
                  ),
                  color: Colors.transparent,
                ),
                padding: EdgeInsets.all(12),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          isSelected
                              ? PhosphorIcons.radio_button_fill
                              : PhosphorIcons.circle,
                          color:
                              isSelected
                                  ? Color(0xFFCF353F)
                                  : Color(0xFFD9D9D9),
                          size: 24,
                        ),
                        SizedBox(width: 12),
                        Text(
                          meal.toString(),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color:
                                isSelected
                                    ? Color(0xFFCF353F)
                                    : Color(0xFF2B2D42),
                            fontFamily: 'Nunito',
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Total Meal: $totalMeal",
                      style: TextStyle(
                        fontSize: 11,
                        color: Color(0xFF757575),
                        fontFamily: 'Nunito',
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
