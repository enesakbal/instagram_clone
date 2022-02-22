import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:sizer/sizer.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String? hintText;
  final Widget? counter;
  final bool isObscure;
  final TextStyle? hintStyle;
  final String? Function(String?) validator;
  final List<TextInputFormatter>? inputFormatter;

  const CustomTextFormField(
      {Key? key,
      required this.textEditingController,
      required this.validator,
      this.hintText,
      this.counter,
      this.isObscure = false,
      this.hintStyle,
      this.inputFormatter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //initialValue: '+90',
      
      validator: validator,
      controller: textEditingController,
      inputFormatters: inputFormatter,
      obscuringCharacter: '*',
      obscureText: isObscure,
      cursorColor: Colors.black26,
      decoration: InputDecoration(
        errorMaxLines: 2,
        contentPadding: EdgeInsets.symmetric(horizontal: 4.w),
        //counter: counter,
        hintText: hintText,
        hintStyle: hintStyle ?? TextStyle(fontSize: 11.sp),
        fillColor: Colors.grey.shade100,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.zero),
          borderSide: BorderSide(color: Colors.transparent, width: 0),
          gapPadding: 0,
        ),
        enabledBorder: OutlineInputBorder(
          /**Burası tıklanılmamış hali */
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.black, width: 0.4),
          gapPadding: 0,
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.black, width: 0.4),
          gapPadding: 0,
        ),
        focusedBorder: OutlineInputBorder(
          /**Burası tıklanılmış hali */
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.black, width: 1),
          gapPadding: 0,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.red, width: 1),
          gapPadding: 0,
        ),
        focusedErrorBorder: OutlineInputBorder(
          /**Burası hata varken tıklanılmış hali */
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.red, width: 1),
          gapPadding: 0,
        ),
      ),
    );
  }
}
