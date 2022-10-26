import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'package:ksrm_sfa/utils/my_colors.dart';

class AppFormField extends StatelessWidget {
  final String hintText;
  final double hintfontSize;
  final String? fontStyles;
  // final String labelText;
  final double fontSize;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final TextInputType inputType;
  final TextInputAction? inputAction;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final double width;
  final double height;
  final FocusNode? focus;
  final bool readonly;
  final bool obscureText;

  final FontWeight fontWeight;
  const AppFormField({
    Key? key,
    required this.hintText,
    this.onTap,
    this.onChanged,
    this.validator,
    this.inputType = TextInputType.text,
    this.inputAction,
    required this.hintfontSize,
    this.fontStyles,
    this.obscureText = false,
    // required this.labelText,
    required this.fontSize,
    this.suffixIcon,
    this.controller,
    required this.width,
    required this.height,
    this.focus,
    this.readonly = false,
    required this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      // color: Colors.amber,
      height: height, // size.height * 0.065,
      width: width, //size.width, //size.width,
      child: TextFormField(
        onChanged: onChanged,
        onTap: onTap,
        textInputAction: inputAction,
        //textCapitalization: TextCapitalization.sentences,
        validator: validator,
        keyboardType: inputType,
        obscureText: obscureText,
        controller: controller,
        focusNode: focus,
        readOnly: readonly,
        style: GoogleFonts.mulish(
            fontSize: fontSize,
            color: Colors.black,
            fontStyle: FontStyle.normal,
            fontWeight: fontWeight //FontWeight.w600

            ),
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: suffixIcon,
          suffixIconColor: Colors.amber,
          suffixIconConstraints: BoxConstraints(maxHeight: 34, maxWidth: 34),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1.0),
          ),
          hintText: hintText,
          contentPadding: EdgeInsets.only(left: 16),
          hintStyle: GoogleFonts.mulish(
              fontSize: hintfontSize,
              color: Colors.black,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400),
          // labelText: labelText,
          labelStyle: GoogleFonts.mulish(
              fontSize: 14,
              color: Colors.red,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
