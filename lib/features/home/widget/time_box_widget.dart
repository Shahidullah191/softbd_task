import 'package:flutter/material.dart';
import 'package:softbd_task/utils/app_color.dart';
import 'package:softbd_task/utils/dimensions.dart';
import 'package:softbd_task/utils/styles.dart';

class TimeBoxWidget extends StatelessWidget {
  final String time;
  const TimeBoxWidget({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeTen - 2, vertical: Dimensions.paddingSizeFive),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radiusFive),
        border: Border.all(color: AppColor.red, width: 1),
      ),
      child: Text(time, style: notoSerifMedium.copyWith(fontSize: Dimensions.fontSizeTwelve)),
    );
  }
}