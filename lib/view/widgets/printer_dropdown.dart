import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class PrinterDropDown extends StatefulWidget {
  const PrinterDropDown({Key? key}) : super(key: key);

  @override
  _PrinterDropDownState createState() => _PrinterDropDownState();
}

class _PrinterDropDownState extends State<PrinterDropDown> {
  late DropdownController dropdownController1;
  late DropdownController dropdownController2;
  late DropdownController dropdownController3; // Add another controller

  @override
  void initState() {
    super.initState();
    dropdownController1 = DropdownController();
    dropdownController2 = DropdownController();
    dropdownController3 = DropdownController(); // Initialize the third controller
  }

  @override
  Widget build(BuildContext context) {
    List<String> dropdownItems1 = ['R', 'W', 'Both1'];
    List<String> dropdownItems2 = ['R', 'W', 'Both2'];
    List<String> dropdownItems3 = ['R', 'W', 'Both3']; // Add items for the third dropdown

    return Column(
      children: [
        buildDropdown('Select Option', 'dropdownField1', dropdownItems1, controller: dropdownController1),
        SizedBox(height: 10),
        buildDropdown('Select Option', 'dropdownField2', dropdownItems2, controller: dropdownController2),
        SizedBox(height: 10),
        buildDropdown('Select Option', 'dropdownField3', dropdownItems3, controller: dropdownController3),
      ],
    );
  }
}

class DropdownController {
  String? selectedValue;

  void setSelectedValue(String value) {
    selectedValue = value;
  }
}

Widget buildDropdown(String label, String name, List<String> items, {required DropdownController controller}) {
  return FormBuilderDropdown(
    name: name,
    decoration: InputDecoration(
      labelText: label,
      border: const OutlineInputBorder(),
    ),
    onChanged: (value) {
      controller.setSelectedValue(value.toString());
    },
    items: items.map((type) {
      return DropdownMenuItem(
        value: type,
        child: Text(type),
      );
    }).toList(),
  );
}
