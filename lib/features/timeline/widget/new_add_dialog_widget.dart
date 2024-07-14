import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softbd_task/common/custom_button.dart';
import 'package:softbd_task/features/timeline/controller/timeline_controller.dart';
import 'package:softbd_task/utils/app_color.dart';
import 'package:softbd_task/utils/dimensions.dart';
import 'package:softbd_task/utils/images.dart';
import 'package:softbd_task/utils/styles.dart';

 newAddDialogWidget(BuildContext context){
  return showDialog(
    context: context,
    builder: (context) => SizedBox(
      child: AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.radiusTwelve)),
        surfaceTintColor: AppColor.white,
        insetPadding: const EdgeInsets.all(Dimensions.paddingSizeTwenty),
        contentPadding: const EdgeInsets.only(
          top: Dimensions.paddingSizeTwentyFive, bottom: Dimensions.paddingSizeTwenty,
          left: Dimensions.paddingSizeForty, right: Dimensions.paddingSizeForty,
        ),
        content: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(Images.checkMarkIcon, width: 83, height: 75),
              const SizedBox(height: 20),

              Text('নতুন অনুচ্ছেদ সংরক্ষন', style: notoSerifBold.copyWith(fontSize: Dimensions.fontSizeSixteen)),
              const SizedBox(height: 10),

              Text('আপনার সময়রেখাতে নতুন অনুচ্ছেদ সংরক্ষণ সম্পুর্ন হয়েছে', style: notoSerifRegular.copyWith(color: AppColor.grey), textAlign: TextAlign.center),
              const SizedBox(height: 20),

              CustomButton(
                text: 'আরও যোগ করুন',
                width: context.width * 0.45,
                textColor: AppColor.white,
                onTap: () {
                  Get.find<TimelineController>().dataClear();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
