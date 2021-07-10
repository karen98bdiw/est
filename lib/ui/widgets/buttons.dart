import 'package:estimators/base/styles/style_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBtn extends StatelessWidget {
  final String? title;
  final Function onClick;
  final bool fill;
  final bool outlined;
  final Widget? icon;
  final Color color;
  final Color outlineColor;
  final Color textColor;

  CustomBtn({
    this.fill = false,
    this.outlined = false,
    this.title,
    required this.onClick,
    this.icon,
    this.color = mainBtnColor,
    this.outlineColor = mainBorderColor,
    this.textColor = mainBorderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: fill ? double.infinity : null,
      child: FlatButton(
        color: outlined ? Colors.transparent : color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: outlined
              ? BorderSide(color: outlineColor, width: 2)
              : BorderSide.none,
        ),
        padding: EdgeInsets.all(15),
        onPressed: () => onClick(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) icon!,
            icon != null
                ? SizedBox(
                    width: 15,
                  )
                : Container(),
            Text(
              title!,
              style: TextStyle(
                color: outlined ? textColor : Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ScreenActionChangeButton extends StatelessWidget {
  final Function? onBackButtonClick;
  final Function? onButtonClick;
  final String? buttonTitle;

  ScreenActionChangeButton(
      {this.buttonTitle, this.onBackButtonClick, this.onButtonClick});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          CustomBackButton(
            onTap: onBackButtonClick!,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
              child: CustomBtn(
            icon: Container(),
            title: buttonTitle ?? "",
            onClick: onButtonClick!,
          )),
        ],
      ),
    );
  }
}

class CustomBackButton extends StatelessWidget {
  final Function onTap;
  CustomBackButton({required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 9),
        decoration: BoxDecoration(
          border: Border.all(
            color: Color.fromRGBO(203, 203, 203, 1),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: SvgPicture.asset("assets/icons/backIcon.svg"),
        ),
      ),
    );
  }
}
