import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onPress,
    required this.text,
    this.buttonColor = Colors.blue,
    this.overlayColor = Colors.blueGrey,
    this.iconColor = Colors.blue,
    this.height,
    this.width,
    this.elevation,
    this.textStyle,
    this.hasIcon = false,
    this.hasPressed = false,
    this.iconPath,
  }) : super(key: key);

  final double? height;
  final double? width;
  final double? elevation;

  final Color buttonColor;
  final Color overlayColor;
  final Color iconColor;

  final String text;
  final TextStyle? textStyle;

  final VoidCallback onPress;

  final String? iconPath;

  final bool hasIcon;
  final bool hasPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      //TODO EN KEYİFLİ YERİ SANA BIRAKTIM KIYMETİNİ BİLMEN LAZIM
      color: Colors.transparent,
      width: width ?? 100.w,
      height: height,
      child: TextButton(
          onPressed: onPress,
          style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.all(0)),
            elevation: MaterialStateProperty.all(elevation),
            backgroundColor: MaterialStateProperty.all(buttonColor),
            shadowColor: MaterialStateProperty.all(Colors.black),
            overlayColor: MaterialStateProperty.all(overlayColor),
            foregroundColor: MaterialStateProperty.all(Colors.black),
          ),
          child: hasIcon
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                      ImageIcon(
                        AssetImage(
                          iconPath ?? 'assets/logo/facebook-f-logo-2019.png',
                        ),
                        color: iconColor,
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Text(text)
                    ])
              : hasPressed
                  ? SpinKitFadingCircle(
                      color: Color(0xFF014288),
                      size: 25,
                    )
                  : Text(
                      text,
                      style: textStyle,
                    )),
    );
  }
}
