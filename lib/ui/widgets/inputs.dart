import 'package:estimators/base/styles/style_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomInput extends StatelessWidget {
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  final String? hint;
  final obscure;

  CustomInput({this.hint, this.onSaved, this.validator, this.obscure = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.all(15),
        fillColor: Color.fromRGBO(228, 225, 225, 1),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: blueShape,
            )),
        hintText: hint,
        hintStyle: TextStyle(
          height: 1,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: trasnparentBlueShape,
        ),
      ),
    );
  }
}

class CustomFormInput extends StatelessWidget {
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final String? hint;
  final Widget? prefix;
  final Widget? sufix;
  final bool? obscureText;
  final bool? textCentered;
  final TextEditingController? controller;
  final AutovalidateMode? autovalidateMode;
  final List<TextInputFormatter>? formatters;

  CustomFormInput({
    this.onSaved,
    this.validator,
    this.hint,
    this.prefix,
    this.obscureText = false,
    this.textCentered = false,
    this.sufix,
    this.controller,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.formatters,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16),
      child: TextFormField(
        initialValue: controller == null
            ? hint == "Email"
                ? "vvv123@mailinator.com"
                : "test"
            : null,
        controller: controller,
        textAlign: textCentered! ? TextAlign.center : TextAlign.start,
        obscureText: obscureText!,
        validator: validator,
        autovalidateMode: autovalidateMode,
        inputFormatters: formatters,
        onSaved: onSaved,
        decoration: InputDecoration(
          prefixIcon: prefix != null
              ? Padding(
                  padding: EdgeInsetsDirectional.only(
                    top: 14,
                    start: 14,
                    end: 14,
                    bottom: 14,
                  ),
                  child: prefix,
                )
              : null,
          suffixIcon: sufix != null
              ? Padding(
                  padding: EdgeInsetsDirectional.only(
                    top: 14,
                    start: 14,
                    end: 14,
                    bottom: 14,
                  ),
                  child: sufix,
                )
              : null,
          isDense: true,
          contentPadding: EdgeInsetsDirectional.only(
            top: 14,
            bottom: 14,
            start: 14,
            end: 14,
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: mainBorderColor,
                width: 1,
              )),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: mainBorderColor,
                width: 1,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: mainBorderColor,
                width: 1,
              )),
          hintText: hint,
          hintStyle: TextStyle(
            color: Color.fromRGBO(137, 137, 137, 1),
            fontSize: 18,
            fontWeight: FontWeight.w400,
            height: 1,
          ),
        ),
      ),
    );
  }
}

class SocialAdressInput extends StatelessWidget {
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final String? hint;
  final Widget? prefix;
  final Widget? sufix;
  final bool obscureText;
  final bool textCentered;

  SocialAdressInput({
    this.onSaved,
    this.validator,
    this.hint = "https://",
    this.prefix,
    this.obscureText = false,
    this.textCentered = false,
    this.sufix,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 0),
      child: TextFormField(
        textAlign: textCentered ? TextAlign.center : TextAlign.start,
        obscureText: obscureText,
        validator: validator,
        onSaved: onSaved,
        decoration: InputDecoration(
          prefixIcon: prefix != null
              ? Padding(
                  padding: EdgeInsetsDirectional.only(
                    top: 20,
                    start: 0,
                    end: 5,
                    bottom: 4,
                  ),
                  child: prefix,
                )
              : null,
          isDense: true,
          isCollapsed: true,
          contentPadding: EdgeInsetsDirectional.only(
            top: 25,
            bottom: 4,
            start: 5,
            end: 14,
          ),
          hintText: hint,
          hintStyle: TextStyle(
            color: Color.fromRGBO(137, 137, 137, 1),
            fontSize: 18,
            fontWeight: FontWeight.w400,
            height: 1,
          ),
        ),
      ),
    );
  }
}
