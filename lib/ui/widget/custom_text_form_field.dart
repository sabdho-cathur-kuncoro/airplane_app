import 'package:airplane_app/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomTextFromField extends StatelessWidget {
  final String title;
  final String hintText;
  final bool obscureText;
  final EdgeInsets margin;
  final TextEditingController controller;

  const CustomTextFromField(
      {Key? key,
      required this.title,
      required this.hintText,
      this.obscureText = false,
      this.margin = const EdgeInsets.only(bottom: 20),
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          const SizedBox(
            height: 6,
          ),
          TextFormField(
            controller: controller,
            obscureText: obscureText,
            cursorColor: kBlackColor,
            decoration: InputDecoration(
                hintText: hintText,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(defaultRadius),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultRadius),
                    borderSide: BorderSide(color: kPrimaryColor))),
          )
        ],
      ),
    );
  }
}
