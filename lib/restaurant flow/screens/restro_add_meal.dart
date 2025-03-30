import 'package:app/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path/path.dart' as path;

class RestroAddMealPage extends StatefulWidget {
  @override
  _RestroAddMealPageState createState() => _RestroAddMealPageState();
}

class _RestroAddMealPageState extends State<RestroAddMealPage> {
  File? _selectedImage;
  String selectedItemValue = 'Protein';
  List<String> items = ['Protein', 'Carbohydrates', 'Minerals'];
  String selectedCalValue = 'KiloCalories';
  List<String> calorie = ['KiloCalories', 'Calories'];
  bool isHalal = false;
  List<String> selectedDays = [];
  String selectedAllergen = "";
  List<String> allergens = [ "Eggs", "Mustard", "Milk"];
  List<String> selectedLabels = [];
  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height - 164,
              child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Attach Image
                  Text("Attach Image", style: sectionTitleStyle()),
                  SizedBox(height: 8),
                  imageUploader(),

                  // Meal Details
                  SizedBox(height: 16),
                  Text("Enter Meal Details", style: sectionTitleStyle()),
                  SizedBox(height: 8),
                  buildTextField("Meal Name", icon: PhosphorIcons.cooking_pot),
                  SizedBox(height: 8),
                  buildTextField("Meal Price", icon: PhosphorIcons.cardholder),
                  SizedBox(height: 8),
                  buildTextField("Meal Description", maxLines: 3),

                  // Nutritional Value
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Nutritional Value (optional)", style: sectionTitleStyle()),
                      GestureDetector(
                          // onTap: _showBottomSheet,
                          child: SizedBox(
                            child: Row(
                              children: [
                                Icon(PhosphorIcons.plus, color: Color(0xFF35CFC1), size: 13.5,),
                                Text('Add', style: TextStyle(color: Color(0xFF35CFC1), fontWeight: FontWeight.bold),),
                              ],
                            ),
                          )
                      )
                    ],
                  ),
                  SizedBox(height: 8,),
                  nutritionalValueSection("in grams", items,  selectedItemValue,
                        (String? newValue) {
                      setState(() {
                        selectedItemValue = newValue!;
                      });
                    },),
                  SizedBox(height: 8,),
                  nutritionalValueSection( "in kcal", calorie,  selectedCalValue,
                        (String? newValue) {
                      setState(() {
                        selectedCalValue = newValue!;
                      });
                    },),

                  // Allergens
                  SizedBox(height: 16),
                  Text("Allergens", style: sectionTitleStyle()),
                  SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: selectedAllergen.isEmpty ? null : selectedAllergen, // Use null for hint text
                      hint: Text(
                        "Pick Allergies", // Hint text
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF757575), // Hint text color
                        ),
                      ),
                      icon: const Icon(PhosphorIcons.caret_down, size: 24, color: Colors.black),
                      style: const TextStyle(fontSize: 18, color: Colors.black),

                      onChanged: (String? newValue) {
                        setState(() {
                          selectedAllergen = newValue!; // Update the selected value
                        });
                      },
                      items: allergens.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 8,),
                  buildAllergenChips(),

                  // Meal Availability
                  SizedBox(height: 16),
                  Text("Meal Availability", style: sectionTitleStyle()),
                  buildAvailabilityDays(),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildRadioOption("Lunch", PhosphorIcons.rectangle, Color(0xFF2B2D42)),
                      _buildRadioOption("Dinner", PhosphorIcons.circle, Color(0xFF2B2D42)),
                    ],
                  ),
                  // Dietary Labels
                  SizedBox(height: 16),
                  Text("Dietary Labels (optional)", style: sectionTitleStyle()),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildRadioOption("Gluten Free", PhosphorIcons.circle, Color(0xFFD9D9D9)),
                      _buildRadioOption("Diary Free", PhosphorIcons.circle, Color(0xFFD9D9D9)),
                    ],
                  ),

                  // Mark as Halal
                  SizedBox(height: 16),
                  markAsHalalSwitch(),

                ],
              ),
                    ),
            ),

            Container(
              height: 80,
              width: double.infinity,
              padding: EdgeInsets.all(16),
              color: Colors.white,
              child: CustomButton(onTap: () {} , text: "Add to Menu"),
            )
          ],
        ),
    );
  }

  Widget imageUploader() {
    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        height: 50,
        width: double.infinity,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12)
        ),
        child: _selectedImage == null
            ? Row(
          children: [
            Expanded(
              child: Text(
                "Tap to select an image",
                style: TextStyle(fontSize: 16, color: Color(0xFF757575)),
              ),
            ),
            SizedBox(width: 8),
          ],
        )
            : Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                path.basename(_selectedImage!.path), // Show file name
                style: TextStyle(fontSize: 16, color: Color(0xFF757575)),
                overflow: TextOverflow.ellipsis, // Handle long file names
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _selectedImage = null;
                });
              },
              child: Icon(PhosphorIcons.trash_simple, color: Colors.black) ,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String hintText, {IconData? icon, int maxLines = 1}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // White background
        borderRadius: BorderRadius.circular(10), // Optional for rounded corners
      ),
      child: TextField(
        maxLines: maxLines,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          prefixIcon: icon != null
              ? Icon(icon, color: Colors.black)
              : null,
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 16, color: Color(0xFF757575)),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        ),
      ),
    );
  }

  Widget nutritionalValueSection(String unit, List<String> items, String selectedValue, Function(String?) onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 2.3,
          padding: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8)
          ),
          child: DropdownButton<String>(
            isExpanded: true,
            value: selectedValue,
            icon: const Icon(PhosphorIcons.caret_down, size: 24, color: Colors.black),
            style: const TextStyle(fontSize: 18, color: Colors.black),
            underline: Container(
              color: Colors.white,
            ),
            onChanged: onChanged,
            items: items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 2.3,
            child: buildTextField(unit))
      ],
    );
  }
  Widget buildNutritionalField(String label, String unit) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        suffixText: unit,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Widget buildAllergenChips() {
    return Wrap(
      spacing: 8,
      children: allergens
          .map((allergen) => Chip(
        deleteIcon: Icon(PhosphorIcons.x, color: Color(0xFF757575),),
        label: Text(allergen, style: TextStyle(color: Color(0xFF2B2D42), fontSize: 14),),
        onDeleted: () {
          setState(() {
            allergens.remove(allergen);
          });
        },
        backgroundColor: Color(0xFFF9F9F9),
      ))
          .toList(),
    );
  }

  Widget buildAvailabilityDays() {
    List<String> days = ["Sunday", "Monday", "Tuesday", "Wednesday"];
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Wrap(
              spacing: 8,
              children: days.map((day) {
                bool isSelected = selectedDays.contains(day);
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedDays.add(day);
                    });
                  },
                  child: Chip(
                    label: Text(
                      day,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Color(0xFF2B2D42),
                        fontSize: 14,
                      ),
                    ),
                    backgroundColor: isSelected ? Color(0xFFCF353F) : Color(0xFFF9F9F9),
                    deleteIcon: isSelected ? Icon(Icons.close, color: Colors.white) : null,
                    onDeleted: isSelected
                        ? () {
                      setState(() {
                        selectedDays.remove(day);
                        isSelected = false;
                      });
                    }
                        : null,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }



  Widget markAsHalalSwitch() {
    return ListTile(
      title: Text(
        "Mark as Halal",
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
      ),
      subtitle: Text(
        "This will add a “Halal” tag to the item and it would be considered as “Halal Certified”",
        style: TextStyle(fontSize: 14, color: Colors.black54),
      ),
      trailing: Transform.translate(
        offset: Offset(0, -20), // Moves switch to the top
        child: Switch(
          value: isHalal,
          onChanged: (bool value) {
            setState(() {
              isHalal = value;
            });
          },
          activeTrackColor: Color(0xFFCF353F),
        ),
      ),

    );
  }


  Widget addButton() {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        onPressed: () {
          print("Meal Added");
        },
        child: Text("Add to Menu", style: TextStyle(color: Colors.white, fontSize: 16)),
      ),
    );
  }

  TextStyle sectionTitleStyle() {
    return TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black);
  }
  Widget _buildRadioOption(String label, IconData icon, Color color) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.3,
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
          Text(label, style: TextStyle(fontSize: 18, color: Color(0xFF2B2D42)), overflow: TextOverflow.clip,),
        ],
      ),
    );
  }

}
