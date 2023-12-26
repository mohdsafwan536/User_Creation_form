import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ShareDriveDropDown extends StatefulWidget {
  const ShareDriveDropDown({Key? key}) : super(key: key);

  @override
  _ShareDriveDropDownState createState() => _ShareDriveDropDownState();
}

class _ShareDriveDropDownState extends State<ShareDriveDropDown> {
  late DropdownController dropdownController1;// Add another controller
  late DropdownController dropdownController2;// Add another controller

  @override
  void initState() {
    super.initState();
    dropdownController1 = DropdownController(); // Initialize the third controller
    dropdownController2 = DropdownController(); // Initialize the third controller
  }

  @override
  Widget build(BuildContext context) {
    List<String> dropdownItems1 = ['Yes']; // Add items for the third dropdown
    List<String> dropdownItems2 = ['WFH']; // Add items for the third dropdown

    return Column(
      children: [
        buildDropdown('Open Vpn1', 'dropdownField1', dropdownItems1, controller: dropdownController1),
        SizedBox(height: 10),
        buildDropdown('Please Select', 'dropdownField2', dropdownItems2, controller: dropdownController2),
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
