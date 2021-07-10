import 'package:estimators/data/country.dart';
import 'package:flutter/material.dart';

Future<CountryAndFlags?> countyPickerDialog(
    {required BuildContext context}) async {
  var res = await showDialog(
    context: context,
    builder: (c) => CountryPickerDiolog(),
  );
  return res;
}

class CountryItem extends StatelessWidget {
  final CountryAndFlags item;

  CountryItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(item.flag),
      title: Text(item.name),
      subtitle: Text(item.dialCode),
    );
  }
}

class CountryPickerDiolog extends StatefulWidget {
  @override
  _CountryPickerDiologState createState() => _CountryPickerDiologState();
}

class _CountryPickerDiologState extends State<CountryPickerDiolog> {
  List<CountryAndFlags> sorted = [];
  @override
  void initState() {
    sorted = CountryAndFlags.countries;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("rebuild is called");

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
        child: Column(
          children: [
            TextField(
              onChanged: (v) {
                sorted = [];
                print("onChanged is called");
                setState(() {
                  sorted = CountryAndFlags.countries
                      .where(
                        (element) => element.name
                            .toLowerCase()
                            .trim()
                            .contains(v.toLowerCase().trim()),
                      )
                      .toList();
                });
                print(sorted);
              },
              decoration: InputDecoration(
                hintText: "Country Name",
                prefixIcon: Icon(Icons.search),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (c, i) => ListTile(
                  onTap: () {
                    print("on tap is Called");
                    Navigator.of(context).pop(
                      sorted[i],
                    );
                  },
                  title: Text(sorted[i].name),
                  leading: Text(sorted[i].flag),
                  subtitle: Text(
                    sorted[i].dialCode,
                  ),
                ),
                itemCount: sorted.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
