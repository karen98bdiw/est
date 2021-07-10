import 'package:estimators/base/enums.dart';
import 'package:estimators/base/styles/common_styles.dart';
import 'package:estimators/base/styles/style_values.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FormScreenTitle extends StatelessWidget {
  final String? title;

  FormScreenTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? "",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 24,
        color: titleColor,
      ),
    );
  }
}

class RegisterScreenNumbers extends StatelessWidget {
  final int number;

  RegisterScreenNumbers(this.number);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          numberView(index: 0, curentNumber: number, title: "Detailis"),
          SizedBox(
            width: 10,
          ),
          numberView(index: 1, curentNumber: number, title: "Information")
        ],
      ),
    );
  }

  Widget numberView({int? index, String? title, int? curentNumber}) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8),
                color: index == curentNumber ? lightBlue : Colors.transparent,
                border: index != curentNumber
                    ? Border.all(width: 1, color: greyShape)
                    : null),
            child: Center(
              child: Text(
                (index! + 1).toString(),
                style: mediumTextStyle(
                    color: index == curentNumber ? Colors.white : greyShape),
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            title!,
            style: TextStyle(
              color: index == curentNumber ? lightBlue : greyShape,
            ),
          ),
        ],
      );
}

class TitledCheckBox extends StatefulWidget {
  final bool? value;
  final ValueChanged onChanged;
  final String? title;
  final bool showTitle;

  TitledCheckBox({
    this.value,
    required this.onChanged,
    this.title,
    this.showTitle = true,
  });

  @override
  _TitledCheckBoxState createState() => _TitledCheckBoxState();
}

class _TitledCheckBoxState extends State<TitledCheckBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChanged(!widget.value!);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              border: Border.all(color: mainBorderColor, width: 1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: widget.value!
                ? Center(
                    child: SvgPicture.asset("assets/icons/doneIcon.svg"),
                  )
                : Container(),
          ),
          SizedBox(
            width: 8,
          ),
          widget.showTitle
              ? Expanded(
                  // width: MediaQuery.of(context).size.width * 0.35,

                  child: Text(
                    widget.title ?? "",
                    style: mediumTextStyle(),
                    maxLines: 1,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}

class MoveToSignType extends StatelessWidget {
  final SignType? toType;

  MoveToSignType({this.toType});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.03,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Already have an account?",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
          Text(
            "Sign In",
            style: TextStyle(
              color: mainBorderColor,
              fontWeight: FontWeight.w400,
              fontSize: 17,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}

class TitledRadioButton extends StatelessWidget {
  final bool? value;
  final ValueChanged<bool> onChanged;
  final String? title;

  TitledRadioButton({this.value, required this.onChanged, this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value!),
      child: Container(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 17,
              height: 17,
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 1, color: mainBorderColor),
              ),
              child: Center(
                child: Container(
                  width: 13,
                  height: 13,
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: value! ? lightBlue : Colors.transparent,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              title ?? "",
              style: mediumTextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
