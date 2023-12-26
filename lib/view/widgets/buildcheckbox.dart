import 'package:flutter/material.dart';
import 'buildheader.dart';

class MyCheckBox extends StatefulWidget {
  MyCheckBox(
      {super.key,
      required this.zyro_India_Team,
      required this.leads_team_am,
      required this.manager_till_grp,
      required this.sr_manager,
      required this.send_recive,
      required this.attch_file});

  bool zyro_India_Team;
  bool leads_team_am;
  bool manager_till_grp;
  bool sr_manager;
  bool send_recive;
  bool attch_file;

  @override
  State<StatefulWidget> createState() => MyCheckBoxState();
}

class MyCheckBoxState extends State<MyCheckBox> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            checkbox(
              title: "All joiner should be added to- Zyro India Team,",
              initValue: widget.zyro_India_Team,
              onChanged: (sts) => setState(() => widget.zyro_India_Team = sts),
              width: constraints.maxWidth,
            ),
            checkbox(
              title:
                  'Any joining for lead till AM - they should be added to the ‘Zyro Leads and above’ DL',
              initValue: widget.leads_team_am,
              onChanged: (sts) => setState(() => widget.leads_team_am = sts),
              width: constraints.maxWidth,
            ),
            checkbox(
              title:
                  'Any joining for Manager till Grp Manager - they should be added to the ‘Zyro Leads and above’ & ‘Zyro Manager and above‘ DL ',
              initValue: widget.manager_till_grp,
              onChanged: (sts) => setState(() => widget.manager_till_grp = sts),
              width: constraints.maxWidth,
            ),
            checkbox(
              title:
                  'Any joining for Sr. Manager and above - they should be added to the ‘Zyro Managers and above’ & ‘Zyro Extended leadership’ DL ',
              initValue: widget.sr_manager,
              onChanged: (sts) => setState(() => widget.sr_manager = sts),
              width: constraints.maxWidth,
            ),
            SizedBox(height: 10),
            buildHeader('G - Suite'),
            checkbox(
              title:
                  'User should be able to send/receive mails to outside MyZyro Network',
              initValue: widget.send_recive,
              onChanged: (sts) => setState(() => widget.send_recive = sts),
              width: constraints.maxWidth,
            ),
            checkbox(
              title: 'User should be able to attach files in the emails',
              initValue: widget.attch_file,
              onChanged: (sts) => setState(() => widget.attch_file = sts),
              width: constraints.maxWidth,
            ),
          ],
        );
      },
    );
  }
}

Widget checkbox({
  required String title,
  required bool initValue,
  required Function(bool boolValue) onChanged,
  required double width,
}) {
  return SizedBox(
    width: width,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(value: initValue, onChanged: (b) => onChanged(b!)),
        Flexible(
          child: Text(title),
        ),
      ],
    ),
  );
}
