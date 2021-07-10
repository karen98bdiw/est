import 'package:estimators/base/styles/style_values.dart';
import 'package:estimators/ui/widgets/buttons.dart';
import 'package:estimators/ui/widgets/common.dart';
import 'package:estimators/ui/widgets/inputs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: mainWhiteBackgroundColor,
        body: SafeArea(
          child: Stack(
            children: [
              SvgPicture.asset(
                "assets/images/linearBackground.svg",
                fit: BoxFit.cover,
              ),
              LayoutBuilder(
                builder: (c, cnst) => SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: cnst.maxWidth,
                      minHeight: cnst.maxHeight,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 30,
                      ),
                      child: Container(
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 18,
                                ),
                                child: Column(
                                  children: [
                                    FormScreenTitle("Sign In"),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Add your details to login",
                                      style: TextStyle(
                                        color: blueShape,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    _form(),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        // Navigator.of(context).push(
                                        //   MaterialPageRoute(
                                        //     builder: (c) =>
                                        //         ForgotPasswordScreen(),
                                        //   ),
                                        // );
                                      },
                                      child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 8),
                                        child: Text(
                                          "Forgot your password?",
                                          style: TextStyle(
                                            color: blueShape,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        // Navigator.of(context).push(
                                        //   MaterialPageRoute(
                                        //     builder: (c) => ResetCodeScreen(),
                                        //   ),
                                        // );
                                      },
                                      child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 8),
                                        child: Text(
                                          "Reset Code Test",
                                          style: TextStyle(
                                            color: blueShape,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    _availiableLoginServices(),
                                  ],
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _form() => Form(
          child: Column(
        children: [
          CustomFormInput(
            prefix: SvgPicture.asset("assets/icons/emailPrefix.svg"),
            hint: "Your Email",
          ),
          SizedBox(
            height: 26,
          ),
          CustomFormInput(
            prefix: SvgPicture.asset("assets/icons/passwordPrefix.svg"),
            obscureText: true,
            hint: "Password",
          ),
          SizedBox(
            height: 26,
          ),
          CustomBtn(
            icon: Container(),
            fill: true,
            onClick: () {},
            title: "Login",
          ),
        ],
      ));

  Widget _availiableLoginServices() => Column(
        children: [
          CustomBtn(
            color: blueShape,
            title: "Login With Linkedin",
            onClick: () {},
            icon: SvgPicture.asset(
              "assets/images/linkedinIcon.svg",
            ),
          ),
          SizedBox(
            height: 15,
          ),
          CustomBtn(
            onClick: () {},
            title: "Login With Google",
            fill: true,
            icon: SvgPicture.asset("assets/images/googlePlusIcon.svg"),
          )
        ],
      );
}
