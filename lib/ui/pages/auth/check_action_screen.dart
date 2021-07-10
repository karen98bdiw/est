import 'package:estimators/base/styles/style_values.dart';
import 'package:estimators/ui/pages/auth/login_screen.dart';
import 'package:estimators/ui/pages/auth/register_screen.dart';
import 'package:estimators/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';

class CheckActionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: formScaffoldPadding,
          child: LayoutBuilder(
            builder: (c, cn) => SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    minHeight: cn.maxHeight, minWidth: cn.maxWidth),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    top(context),
                    buttons(context),
                    bottom(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buttons(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomBtn(
            icon: Container(),
            color: blueShape,
            title: "Get Started",
            onClick: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (c) => LoginScreen()),
              );
            },
            fill: true,
          ),
          SizedBox(
            height: 15,
          ),
          CustomBtn(
            icon: Container(),
            textColor: mainBtnColor,
            outlineColor: mainBtnColor,
            outlined: true,
            title: "Sign Up",
            onClick: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (c) => RegisterScreen()),
              );
            },
            fill: true,
          ),
        ],
      );

  Widget top(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "ESTIMATORS",
                    style: TextStyle(
                      color: blueShape,
                      fontSize: 40,
                      height: 1,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                height: MediaQuery.of(context).size.height * 0.15,
                child: Image.asset(
                  "assets/images/logo.gif",
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "The Perfect Space for Project Estimating",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "ESTIMATORS is the world’s most powerful relationship and workflow managment tool",
            style: TextStyle(
              fontSize: 17,
              color: Colors.black,
            ),
          ),
        ],
      );

  Widget bottom() => RichText(
        text: TextSpan(children: [
          TextSpan(
            text:
                "By Proceeding you acknowledge that you have read, understood and agree to our",
            style: TextStyle(
              fontSize: 17,
              color: Colors.black,
            ),
          ),
          WidgetSpan(
            child: GestureDetector(
              child: Text(
                "Terms and Conditions",
                style: TextStyle(
                  fontSize: 17,
                  color: blueShape,
                  decoration: TextDecoration.underline,
                ),
              ),
              onTap: () {},
            ),
          ),
        ]),
      );
}
