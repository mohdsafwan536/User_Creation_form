import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:untitled/view/pages/thankyou_page.dart';
import 'package:untitled/view/widgets/dropdown.dart';
import '../widgets/buildcheckbox.dart';
import '../widgets/builddatetimepicker.dart';
import '../widgets/buildheader.dart';
import '../widgets/buildnoneditabletext.dart';
import '../widgets/buildtextfield.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../widgets/listmembershipdrive_dropdown.dart';
import '../widgets/printer_dropdown.dart';
import '../widgets/sharedrive_dropdown.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final double space = 10;
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  List<String> dropdownItems = ['Approved', 'Not Approved', 'On Hold'];
  String? selectedValue;
  bool attch_file_checkBoxController = false;
  bool leads_team_am_checkBoxController = false;
  bool manager_till_grp_checkBoxController = false;
  bool send_recive_checkBoxController = false;
  bool sr_manager_checkBoxController = false;
  bool zyro_India_Team_checkBoxController = false;

  final TextEditingController ticket_noController = TextEditingController();
  final TextEditingController form_noController = TextEditingController();
  String? employee_type;
  final TextEditingController account_expireController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController employee_idController = TextEditingController();
  final TextEditingController designationController = TextEditingController();
  final TextEditingController reasonController = TextEditingController();
  final TextEditingController email_quotaController = TextEditingController();
  final TextEditingController email_id_com_Controller = TextEditingController();
  final TextEditingController email_id_net_Controller = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController logn_idController = TextEditingController();
  final TextEditingController email2Controller = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController rmController = TextEditingController();

  static get controller => controller;

  void _submitForm() async {
    final String apiUrl =
        'http://192.168.1.46/form_creation/action/test.php';

    final Map<String, dynamic> data = {
      'email': emailController.text,
      'email_id_com': email_id_com_Controller.text,
      'email_id_net': email_id_net_Controller.text,
      'ticket_no': ticket_noController.text,
      'form_no': form_noController.text,
      'employee_type': employee_type,
      'selectedValue': selectedValue,
      'account_expire': account_expireController.text,
      'name': nameController.text,
      'employee_id': employee_idController.text,
      'designation': designationController.text,
      'reason': reasonController.text,
      'email_quota': email_quotaController.text,
      'email2': email2Controller.text,
      'login_id': logn_idController.text,
      'department': departmentController.text,
      'rm': rmController.text,
      'attch_file': attch_file_checkBoxController,
      'leads_team_am': leads_team_am_checkBoxController,
      'manager_till_grp': manager_till_grp_checkBoxController,
      'send_recive': send_recive_checkBoxController,
      'sr_manager': sr_manager_checkBoxController,
      'zyro_India_Team': zyro_India_Team_checkBoxController,
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data),
      );
      log(jsonEncode(data));
      print(
          'Server Response: ${response.statusCode} ${response.reasonPhrase}\n${response.headers}\n${response.body}');

      if (response.statusCode == 200) {
        // Check if the response is JSON
        if (response.headers['content-type']?.contains('application/json') ??
            false) {
          final result = jsonDecode(response.body);
          print(result);
          ScaffoldMessenger.of(context as BuildContext).showSnackBar(
            const SnackBar(
              content: Text('Record inserted successfully'),
              duration: Duration(seconds: 3),
            ),
          );
        } else {
          // Handle non-JSON response (HTML or other formats)
          print('Non-JSON Response: ${response.body}');
          // You may want to display an error message to the user
        }
      } else {
        // Handle the error response here
        print('Error: ${response.reasonPhrase}');
        ScaffoldMessenger.of(context as BuildContext).showSnackBar(
          SnackBar(
            content: Text('Error: ${response.reasonPhrase}'),
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      // Handle exceptions
      print('Exception: $e');
      ScaffoldMessenger.of(context as BuildContext).showSnackBar(
        SnackBar(
          content: Text('Exception: $e'),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  void setSelectedValue(String value) {
    selectedValue = value;
    print(selectedValue);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey, // Set the color of the border
              width: 1.0, // Set the width of the border
            ),
            borderRadius: BorderRadius.circular(10.0), // Add rounded corners
            color: Colors.white, // Set the background color
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 5,
                offset: const Offset(0, 3), // Add a drop shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: FormBuilder(
              key: _fbKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: buildHeader(
                            'User Creation Form',
                            fontSize: 32.0,
                            color: const Color(0xff5801B7),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: Image.asset(
                            'images/logo.png',
                            width: 300,
                            height: 100,
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              buildHeader('Ticket No.'),
                              buildTextField('Ticket No.', 'ticketNo',
                                  controller: ticket_noController,
                                  isRequired: true),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              buildHeader('Form No.'),
                              buildTextField('Form No.', 'formNo',
                                  controller: form_noController,
                                  isRequired: true),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    buildHeader('Note'),
                    buildNonEditableText([
                      '1. To be used for everyone.',
                      '2. Please mention account expiry date in case of a contract employee.'
                    ]),
                    const SizedBox(
                      height: 10,
                    ),
                    buildHeader('Employment Type'),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FormBuilderRadioGroup(
                          name: 'employmentType',
                          decoration: const InputDecoration(
                            labelText: 'Employment Type',
                            border: OutlineInputBorder(),
                          ),
                          options: const [
                            FormBuilderFieldOption(
                                value: 'full time', child: Text('Full Time')),
                            FormBuilderFieldOption(
                                value: 'part time', child: Text('Part Time')),
                            FormBuilderFieldOption(
                                value: 'temporary contract',
                                child: Text('Temporary or Contract Based')),
                            FormBuilderFieldOption(
                                value: 'freelancer', child: Text('Freelancer')),
                            FormBuilderFieldOption(
                                value: 'trainer intern',
                                child: Text('Trainer or Intern')),
                            FormBuilderFieldOption(
                                value: 'other', child: Text('Other')),
                          ],
                          onChanged: (value) {
                            employee_type = value;
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: space,
                    ),
                    buildDateTimePicker('Account Expire On', 'accountExpireOn',
                        controller: account_expireController),
                    SizedBox(
                      height: space,
                    ),
                    buildHeader('Employee Details'),
                    buildTextField('Name of the Employee', 'employeeName',
                        controller: nameController),
                    SizedBox(
                      height: space,
                    ),
                    buildTextField('Employee ID', 'employeeId',
                        controller: employee_idController),
                    SizedBox(
                      height: space,
                    ),
                    buildTextField('Designation', 'designation',
                        controller: designationController),
                    SizedBox(
                      height: space,
                    ),
                    buildHeader('Department'),
                    buildTextField('Department', 'department',
                        controller: departmentController),
                    SizedBox(
                      height: space,
                    ),
                    buildHeader('Reporting Manager'),
                    buildTextField('Reporting Manager', 'reporting manager',
                        controller: rmController),
                    SizedBox(
                      height: space,
                    ),
                    buildHeader('Resource Access Login Information'),
                    buildTextField('Domain/Login ID', 'domainLoginId',
                        controller: emailController),
                    SizedBox(
                      height: space,
                    ),
                    buildTextField('.Com Email ID', 'comEmailId',
                        controller: email_id_com_Controller),
                    SizedBox(
                      height: space,
                    ),
                    buildTextField('.Net Email ID', 'netEmailId',
                        controller: email_id_net_Controller),
                    SizedBox(
                      height: space,
                    ),
                    buildHeader('Required DL'),
                    LayoutBuilder(builder: (context, constraints) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          checkbox(
                            title:
                                "All joiner should be added to- Zyro India Team,",
                            initValue: zyro_India_Team_checkBoxController,
                            onChanged: (sts) => setState(
                                () => zyro_India_Team_checkBoxController = sts),
                            width: constraints.maxWidth,
                          ),
                          checkbox(
                            title:
                                'Any joining for lead till AM - they should be added to the ‘Zyro Leads and above’ DL',
                            initValue: leads_team_am_checkBoxController,
                            onChanged: (sts) => setState(
                                () => leads_team_am_checkBoxController = sts),
                            width: constraints.maxWidth,
                          ),
                          checkbox(
                            title:
                                'Any joining for Manager till Grp Manager - they should be added to the ‘Zyro Leads and above’ & ‘Zyro Manager and above‘ DL ',
                            initValue: manager_till_grp_checkBoxController,
                            onChanged: (sts) => setState(() =>
                                manager_till_grp_checkBoxController = sts),
                            width: constraints.maxWidth,
                          ),
                          checkbox(
                            title:
                                'Any joining for Sr. Manager and above - they should be added to the ‘Zyro Managers and above’ & ‘Zyro Extended leadership’ DL ',
                            initValue: sr_manager_checkBoxController,
                            onChanged: (sts) => setState(
                                () => sr_manager_checkBoxController = sts),
                            width: constraints.maxWidth,
                          ),
                          SizedBox(height: space),
                          buildHeader('G - Suite'),
                          checkbox(
                            title:
                                'User should be able to send/receive mails to outside MyZyro Network',
                            initValue: send_recive_checkBoxController,
                            onChanged: (sts) => setState(
                                () => send_recive_checkBoxController = sts),
                            width: constraints.maxWidth,
                          ),
                          checkbox(
                            title:
                                'User should be able to attach files in the emails',
                            initValue: attch_file_checkBoxController,
                            onChanged: (sts) => setState(
                                () => attch_file_checkBoxController = sts),
                            width: constraints.maxWidth,
                          ),
                        ],
                      );
                    }),
                    SizedBox(
                      height: space,
                    ),
                    buildHeader(
                        'Resource Access Details Additional to email distribution list(S) - Department Specific'),
                    buildHeader('Printer Access (Specify Printer Location)'),
                    const PrinterDropDown(),
                    SizedBox(
                      height: space,
                    ),
                    buildHeader('Share Drive Access (Open VPN)'),
                    const ShareDriveDropDown(),
                    SizedBox(
                      height: space,
                    ),
                    buildHeader(
                        '1. Please get in touch with IT Service Desk to configure printer, Client Tools & Mapping of Share Drive.'),
                    buildHeader(
                        '2. Please attach appropriate approvals with the ticket to get the user added to the respective DL you are requesting in the form.'),
                    SizedBox(
                      height: space,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              buildHeader('Login'),
                              buildTextField('Login', 'login',
                                  controller: logn_idController),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              buildHeader('Email ID'),
                              buildTextField('Email ID', 'email id',
                                  controller: email2Controller),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: space,
                    ),
                    buildHeader(
                        'Within Process Distribution List Membership (Share Drive)'),
                    const MemberShipDriveDropDown(),
                    buildHeader('To Be Filled By Information Technology'),
                    // buildHeader('Name and Signature of Approving Authority'),
                    // MyFilePickerWidget(),
                    buildHeader('Status'),
                    buildDropdownForm(
                        items: dropdownItems,
                        label: 'Select Option',
                        name: 'dropdownField',
                        selectedValue: selectedValue,
                        onChan: (s) {
                          setSelectedValue(s!);
                        }),
                    SizedBox(
                      height: space,
                    ),
                    buildTextField(
                        'Reason (If On Hold or Not Approved)', 'reason',
                        controller: reasonController),
                    const SizedBox(
                      height: 10,
                    ),
                    buildTextField('Email Quota', 'emailQuota',
                        controller: email_quotaController),
                    const SizedBox(height: 30),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: SizedBox(
                            width: 300,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                log("pressed button");
                                print(ticket_noController.text);
                                print(form_noController.text);
                                _submitForm();
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ThankYouPage()),
                                );

                                if (_fbKey.currentState!.saveAndValidate()) {
                                  print(_fbKey.currentState!.value);
                                  _submitForm();
                                }
                                // print(_submitForm);
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                    if (states
                                        .contains(MaterialState.hovered)) {
                                      return const Color(0xff5801B7);
                                    }
                                    return const Color(0xffAD46B6);
                                  },
                                ),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                              child: const Text(
                                'Submit',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
