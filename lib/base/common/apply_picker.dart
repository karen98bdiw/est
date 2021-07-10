import 'package:flutter/material.dart';

Future<Map<String, dynamic>?> applyPicker(
    {required BuildContext context}) async {
  var res = await showDialog(
    context: context,
    builder: (c) => ApplyPickerDiolog(),
  );
  return res;
}

class Apply extends StatelessWidget {
  final Map<String, dynamic>? item;

  Apply({this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).pop(item);
      },
      leading: Text(item!["name"], style: TextStyle(fontSize: 20)),
      // title: Text(item.name),
      // subtitle: Text(item.dialCode),
    );
  }
}

class ApplyPickerDiolog extends StatefulWidget {
  @override
  _ApplyPickerDiologState createState() => _ApplyPickerDiologState();
}

var dummyApplyes = [
  {"name": "QA"},
  {"name": "Designer"},
  {"name": "Front-end"},
  {"name": "Back-end"},
  {"name": "Project manager"},
];

class _ApplyPickerDiologState extends State<ApplyPickerDiolog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      insetPadding: EdgeInsets.zero,
      child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.6,
          child: ListView.separated(
            separatorBuilder: (c, i) => Divider(),
            itemBuilder: (c, i) => Apply(
              item: dummyApplyes[i],
            ),
            itemCount: dummyApplyes.length,
          )),
    );
  }
}
