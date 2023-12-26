import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class MemberShipDriveDropDown extends StatefulWidget {
  const MemberShipDriveDropDown({Key? key}) : super(key: key);

  @override
  _MemberShipDriveDropDownState createState() => _MemberShipDriveDropDownState();
}

class _MemberShipDriveDropDownState extends State<MemberShipDriveDropDown> {
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
    List<String> dropdownItems1 = ['Option1', 'Option2', 'Option3'];
    List<String> dropdownItems2 = ['Option4', 'Option5', 'Option6'];
    List<String> dropdownItems3 = ['Option7', 'Option8', 'Option9']; // Add items for the third dropdown

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
