import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:softbd_task/common/custom_snackbar.dart';
import 'package:softbd_task/utils/app_color.dart';
import 'package:softbd_task/utils/dimensions.dart';
import 'package:softbd_task/utils/styles.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final int? maxLines;
  final int? maxWords;
  const CustomTextField({super.key, required this.hintText, required this.controller, this.maxLines, this.maxWords});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: maxLines != null ? 20 * double.parse(maxLines.toString()) : 40,
      child: TextField(
        controller: controller,
        maxLines: maxLines ?? 1,
        inputFormatters: [
          FilteringTextInputFormatter.deny(RegExp(r'\s{2,}')), // Prevent multiple spaces
        ],
        onChanged: (value) {
          final wordCount = value.split(RegExp(r'\s+')).length;

          if (wordCount > maxWords!) {
            showCustomSnackBar('সর্বোচ্চ $maxWords শব্দ অনুমোদিত।');

            final words = value.split(RegExp(r'\s+')).take(maxWords!).join(' ');
            controller.value = TextEditingValue(
              text: words,
              selection: TextSelection.fromPosition(TextPosition(offset: words.length)),
            );
          }
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          hintText: hintText,
          hintStyle: notoSerifRegular.copyWith(color: AppColor.grey),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(Dimensions.radiusEight), borderSide: BorderSide(color: AppColor.grey.withOpacity(0.1))),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(Dimensions.radiusEight), borderSide: BorderSide(color: AppColor.grey.withOpacity(0.1))),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(Dimensions.radiusEight), borderSide: BorderSide(color: AppColor.grey.withOpacity(0.1))),
        ),
      ),
    );
  }
}
