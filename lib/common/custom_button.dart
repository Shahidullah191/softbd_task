import 'package:flutter/material.dart';
import 'package:softbd_task/utils/app_color.dart';
import 'package:softbd_task/utils/dimensions.dart';
import 'package:softbd_task/utils/styles.dart';

class CustomButton extends StatelessWidget {
  final double? height;
  final double? width;
  final String text;
  final Color? textColor;
  final Function()? onTap;
  final double? radius;
  final double? fontSize;
  final FontWeight? fontWeight;
  const CustomButton({super.key, this.height = 40, this.width, required this.text, this.textColor, this.onTap, this.radius, this.fontSize, this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        width: width ?? MediaQuery.of(context).size.width,
        height: height,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppColor.secondary, AppColor.primary],
            begin: Alignment.topLeft, end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(radius ?? Dimensions.radiusEight),
        ),
        child: Center(
          child: Text(
            text,
            style: notoSerifMedium.copyWith(
              color: textColor ?? AppColor.white,
              fontSize: fontSize ?? Dimensions.fontSizeSixteen,
              fontWeight: fontWeight ?? FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
