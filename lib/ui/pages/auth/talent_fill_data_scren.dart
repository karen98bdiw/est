import 'package:estimators/base/common/country_picker.dart';
import 'package:estimators/base/images.dart';
import 'package:estimators/data/country.dart';
import 'package:estimators/manager/manager.dart';
import 'package:estimators/models/auth/auth.dart';
import 'package:estimators/ui/pages/auth/talent_additional_data_fill_screen.dart';
import 'package:estimators/ui/widgets/buttons.dart';
import 'package:estimators/ui/widgets/common.dart';
import 'package:estimators/ui/widgets/inputs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uuid/uuid.dart';

class TalentDataFillScreen extends StatefulWidget {
  final SignUpRequest model;

  TalentDataFillScreen({required this.model});

  @override
  _TallentAdditionalDataFillScreenState createState() =>
      _TallentAdditionalDataFillScreenState();
}

class _TallentAdditionalDataFillScreenState
    extends State<TalentDataFillScreen> {
  CountryAndFlags pickerCountry = CountryAndFlags(
    name: "Armenia",
    flag: "🇦🇲",
    code: "AM",
    dialCode: "+374",
  );

  bool isCopmany = true; //or individual
  bool isIndividual = false;

  bool isLoading = false;

  final countryController = TextEditingController();
  final scroll = ScrollController();

  @override
  void dispose() {
    countryController.dispose();
    super.dispose();
  }

  final GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  void initState() {
    widget.model.location = Location();
    widget.model.links = [];
    super.initState();
  }

  void onSave() async {
    resetModel();

    Navigator.of(context).push(
        MaterialPageRoute(builder: (c) => TalentAdditionaFillDataScreen()));
  }

  void resetModel() {
    widget.model.location = Location();
    widget.model.links = [];
    widget.model.clientRequest = ClientRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SvgPicture.asset(
              "assets/images/linearBackground.svg",
              fit: BoxFit.fill,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 30,
                bottom: 10,
              ),
              child: Column(
                children: [
                  FormScreenTitle("Profile Client"),
                  Expanded(child: body()),
                  isLoading
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(),
                            ),
                          ],
                        )
                      : ScreenActionChangeButton(
                          buttonTitle: "Register Client",
                          onBackButtonClick: () {
                            Navigator.of(context).pop();
                          },
                          onButtonClick: () {
                            onSave();
                          },
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget body() {
    return Container(
      // resizeToAvoidBottomInset: true,
      // resizeToAvoidBottomPadding: true,
      child: LayoutBuilder(
        builder: (c, cn) => SingleChildScrollView(
          controller: scroll,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: cn.maxWidth,
              minHeight: cn.maxHeight,
            ),
            child: Form(
              key: formState,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  checkAccauntTarget(),
                  if (isCopmany)
                    CustomFormInput(
                      hint: "Company name",
                      prefix: companyPrefix,
                      onSaved: (v) =>
                          widget.model.clientRequest!.companyName = v!,
                    ),
                  if (isCopmany)
                    CustomFormInput(
                      hint: "Positon",
                      prefix: positonPrefix,
                      onSaved: (v) =>
                          widget.model.clientRequest!.yourPosition = v!,
                    ),
                  CustomFormInput(
                    hint: "First name",
                    prefix: userPrefix,
                    onSaved: (v) => widget.model.firstName = v!,
                  ),
                  CustomFormInput(
                    hint: "Last name",
                    prefix: userPrefix,
                    onSaved: (v) => widget.model.lastName = v!,
                  ),
                  CustomFormInput(
                    controller: countryController,
                    hint: "Country",
                    onSaved: (v) =>
                        widget.model.location!.country = pickerCountry.name,
                    sufix: GestureDetector(
                      child: GestureDetector(
                        child:
                            SvgPicture.asset("assets/icons/dropDownIcon.svg"),
                        onTap: () async {
                          var res = await countyPickerDialog(context: context);
                          if (res != null) {
                            setState(() {
                              pickerCountry = res;
                              countryController.clear();
                              countryController.text = pickerCountry.name;
                            });
                          }
                        },
                      ),
                    ),
                    prefix: GestureDetector(
                      child: Text(pickerCountry.flag),
                      onTap: () async {
                        var res = await countyPickerDialog(context: context);
                        if (res != null) {
                          setState(() {
                            pickerCountry = res;
                            countryController.text = pickerCountry.name;
                          });
                        }
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: CustomFormInput(
                          onSaved: (v) => widget.model.location!.state = v!,
                          hint: "State",
                          textCentered: true,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        flex: 2,
                        child: CustomFormInput(
                          onSaved: (v) => widget.model.location!.city = v!,
                          hint: "City",
                          prefix: locationPrefix,
                        ),
                      ),
                    ],
                  ),
                  CustomFormInput(
                    onSaved: (v) => widget.model.location!.streetAddress = v!,
                    hint: "Street adress",
                    prefix: adressPrefix,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomFormInput(
                          onSaved: (v) => widget.model.location!.aptSuite = v!,
                          prefix: buildingPrefix,
                          hint: "Apt/Suite",
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: CustomFormInput(
                          onSaved: (v) => widget.model.location!.zipCode = v!,
                          hint: "Zip code",
                          prefix: zipPrefix,
                        ),
                      ),
                    ],
                  ),
                  SocialAdressInput(
                    onSaved: (v) => widget.model.links!.add(Link(name: v!)),
                    prefix: linkedinPrefix,
                  ),
                  SocialAdressInput(
                    onSaved: (v) => widget.model.links!.add(Link(name: v!)),
                    prefix: behancePrefix,
                  ),
                  SocialAdressInput(
                    onSaved: (v) => widget.model.links!.add(Link(name: v!)),
                    prefix: dribblePrefix,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget checkAccauntTarget() => Container(
        child: Row(
          children: [
            Expanded(
              child: TitledRadioButton(
                title: "Company",
                value: isCopmany,
                onChanged: (v) {
                  setState(() {
                    isCopmany = v;
                  });
                },
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: TitledRadioButton(
                title: "Individual",
                value: !isCopmany,
                onChanged: (v) {
                  setState(() {
                    isCopmany = !v;
                  });
                },
              ),
            ),
          ],
        ),
      );
}
