import 'package:frontend_flutter/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class DeliveryAddressPage extends StatefulWidget {
  const DeliveryAddressPage({super.key});

  @override
  _DeliveryAddressPageState createState() => _DeliveryAddressPageState();
}

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

class _DeliveryAddressPageState extends State<DeliveryAddressPage> {
  List<Address> addresses = []; // List to store multiple addresses
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
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 24,
                  top: 24,
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
                    SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "Address",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Nunito',
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    _buildTextField(
                      PhosphorIcons.map_pin,
                      "Number, Street Name",
                      addressController,
                    ),
                    SizedBox(height: 8),
                    _buildTextField(
                      PhosphorIcons.buildings,
                      "Flat Number/Building Number",
                      flatController,
                    ),
                    SizedBox(height: 12),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        _buildRadioButton("Home", setModalState),
                        _buildRadioButton("Office", setModalState),
                        _buildRadioButton("Other", setModalState),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Where can we leave your meals?",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Nunito',
                      ),
                    ),
                    SizedBox(height: 16),
                    _buildTextField(
                      PhosphorIcons.map_pin,
                      "Place to leave order",
                      leaveOrderController,
                    ),
                    SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: CustomButton(
                        onTap: () {
                          setState(() {
                            addresses.add(
                              Address(
                                type: selectedType,
                                address: addressController.text,
                                flatNumber: flatController.text,
                                leaveOrderAt: leaveOrderController.text,
                              ),
                            );

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
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildTextField(
    IconData icon,
    String hintText,
    TextEditingController controller,
  ) {
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

  Widget _buildRadioButton(
    String value,
    void Function(void Function()) setModalState,
  ) {
    return InkWell(
      onTap: () {
        setModalState(() {
          selectedType = value;
        });
      },
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(
            color:
                selectedType == value ? Color(0xFFCF353F) : Color(0xFFE0E0E0),
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(8),
          color:
              selectedType == value
                  ? Color(0xFFCF353F).withOpacity(0.1)
                  : Colors.white,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              selectedType == value
                  ? PhosphorIcons.circle_fill
                  : PhosphorIcons.circle,
              color:
                  selectedType == value ? Color(0xFFCF353F) : Color(0xFFE0E0E0),
              size: 20,
            ),
            SizedBox(width: 8),
            Text(
              value,
              style: TextStyle(
                color: selectedType == value ? Color(0xFFCF353F) : Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddressContainer(Address address) {
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
              Icon(
                PhosphorIcons.radio_button_fill,
                color: Color(0xFFCF353F),
                size: 24,
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    address.address,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFCF353F),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    address.flatNumber,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
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
            child: Text(
              address.type,
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Delivery Address',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(PhosphorIcons.caret_left, size: 24, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            onPressed: _showBottomSheet,
            icon: Icon(PhosphorIcons.plus, color: Colors.black),
            iconSize: 24,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
            addresses.isEmpty
                ? Center(child: Text("Click the '+' icon to add an address."))
                : ListView.builder(
                  itemCount: addresses.length,
                  itemBuilder:
                      (context, index) =>
                          _buildAddressContainer(addresses[index]),
                ),
      ),
    );
  }
}
