import 'package:estimators/api/api.dart';
import 'package:estimators/base/common/apply_picker.dart';
import 'package:estimators/base/common/country_picker.dart';
import 'package:estimators/base/const.dart';
import 'package:estimators/base/enums.dart';
import 'package:estimators/base/styles/style_values.dart';
import 'package:estimators/data/country.dart';
import 'package:estimators/models/auth/auth.dart';
import 'package:estimators/ui/pages/auth/client_data_fill_screen.dart';
import 'package:estimators/ui/pages/auth/talent_fill_data_scren.dart';
import 'package:estimators/ui/widgets/buttons.dart';
import 'package:estimators/ui/widgets/common.dart';
import 'package:estimators/ui/widgets/inputs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool obscurePassword = true;

  bool obscureRepeatPassword = true;
  bool isAgreeWithAgreement = false;
  bool isClient = false;
  bool isTallent = false;

  SignUpRequest signUpRequest = SignUpRequest();

  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formState = GlobalKey<FormState>();

  Map<String, dynamic> apply = {"name": "Tallent"};

  CountryAndFlags pickerCountry = CountryAndFlags(
    name: "Armenia",
    flag: "🇦🇲",
    code: "AM",
    dialCode: "+374",
  );

  @override
  void dispose() {
    passwordController.clear();
    passwordController.dispose();

    super.dispose();
  }

  onSingUp() {
    if (!_formState.currentState!.validate()) return;

    _formState.currentState!.save();
    if (isClient) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (c) => ClientDataFillScreen(model: signUpRequest),
      ));
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
            builder: (c) => TalentDataFillScreen(
                  model: signUpRequest,
                )),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        backgroundColor: mainWhiteBackgroundColor,
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Stack(
            children: [
              SvgPicture.asset(
                "assets/images/linearBackground.svg",
                fit: BoxFit.fill,
              ),
              Padding(
                padding: formScaffoldPadding,
                child: LayoutBuilder(
                  builder: (c, cn) => SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: cn.maxWidth,
                        minHeight: cn.maxHeight,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Sign Up",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                              color: titleColor,
                            ),
                          ),
                          _form(),
                          _checkAction(),
                          bottom(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottom() => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          agreement(),
          SizedBox(
            height: 15,
          ),
          CustomBtn(
            icon: Container(),
            title: "Sign Up",
            onClick: onSingUp,
          ),
          SizedBox(
            height: 5,
          ),
          MoveToSignType(
            toType: SignType.Sign,
          ),
        ],
      );

  Widget _checkAction() => Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Apply as",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isClient = !isClient;
                                isTallent = false;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              decoration: BoxDecoration(
                                color: blueShape,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                "Client",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        TitledCheckBox(
                          showTitle: false,
                          onChanged: (v) {
                            setState(() {
                              isClient = v;
                              isTallent = false;
                            });
                          },
                          value: isClient,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              Map<String, dynamic>? res =
                                  await applyPicker(context: context);
                              if (res != null) {
                                setState(() {
                                  apply = res;
                                });
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              decoration: BoxDecoration(
                                color: mainBtnColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    child: Text(
                                      apply["name"],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                      ),
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  SvgPicture.asset(
                                    "assets/icons/dropDownIcon.svg",
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        TitledCheckBox(
                          showTitle: false,
                          onChanged: (v) {
                            setState(() {
                              isTallent = v;
                              isClient = false;
                            });
                          },
                          value: isTallent,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  Widget _form() => Form(
        key: _formState,
        child: Column(
          children: [
            CustomFormInput(
              validator: MultiValidator([
                PatternValidator(AppContstats.Regexp_Email,
                    errorText: "Please write valid email!"),
                RequiredValidator(errorText: "Please write email!"),
              ]),
              onSaved: (v) => signUpRequest.email = v,
              hint: "Email",
              prefix: SvgPicture.asset(
                "assets/icons/emailPrefix.svg",
              ),
            ),
            CustomFormInput(
              onSaved: (v) =>
                  signUpRequest.phoneNumber = pickerCountry.dialCode + v!,
              validator: RequiredValidator(errorText: "Please write phone!"),
              hint: "Phone Number",
              formatters: [FilteringTextInputFormatter.digitsOnly],
              prefix: GestureDetector(
                child: Text(pickerCountry.flag + " " + pickerCountry.dialCode),
                onTap: () async {
                  CountryAndFlags? res =
                      await countyPickerDialog(context: context);
                  if (res != null) {
                    setState(() {
                      pickerCountry = res;
                    });
                  }
                },
              ),
            ),
            CustomFormInput(
              onSaved: (v) => signUpRequest.password = v,
              validator: RequiredValidator(errorText: "Please write password"),
              controller: passwordController,
              hint: "Create Password",
              obscureText: obscurePassword,
              prefix: SvgPicture.asset(
                "assets/icons/passwordPrefix.svg",
              ),
              sufix: GestureDetector(
                onTap: () {
                  setState(() {
                    obscurePassword = !obscurePassword;
                  });
                },
                child: SvgPicture.asset("assets/icons/passwordSuffix.svg"),
              ),
            ),
            CustomFormInput(
              onSaved: (v) => signUpRequest.confirmPassword = v,
              validator: (newValue) => newValue!.isEmpty
                  ? "Please repeat password!"
                  : newValue == passwordController.text
                      ? null
                      : "Password did't match!",
              obscureText: obscureRepeatPassword,
              sufix: GestureDetector(
                onTap: () {
                  setState(() {
                    obscureRepeatPassword = !obscureRepeatPassword;
                  });
                },
                child: SvgPicture.asset("assets/icons/passwordSuffix.svg"),
              ),
              hint: "Repeat Password",
              prefix: SvgPicture.asset(
                "assets/icons/passwordPrefix.svg",
              ),
            ),
          ],
        ),
      );

  Widget agreement() => Container(
        height: MediaQuery.of(context).size.height * 0.05,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isAgreeWithAgreement = !isAgreeWithAgreement;
                });
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.025,
                width: MediaQuery.of(context).size.height * 0.025,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: mainBorderColor),
                ),
                child: isAgreeWithAgreement
                    ? Center(
                        child: SvgPicture.asset(
                          "assets/icons/doneIcon.svg",
                        ),
                      )
                    : Container(),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                "I agree to Estimate’s Terms & Conditions and Privacy Policy ",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      );
}
