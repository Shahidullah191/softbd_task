import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softbd_task/common/custom_button.dart';
import 'package:softbd_task/routes/routes_name.dart';
import 'package:softbd_task/utils/app_color.dart';
import 'package:softbd_task/utils/dimensions.dart';
import 'package:softbd_task/utils/images.dart';
import 'package:softbd_task/utils/styles.dart';

class TimeLineScreen extends StatefulWidget {
  const TimeLineScreen({super.key});

  @override
  State<TimeLineScreen> createState() => _TimeLineScreenState();
}

class _TimeLineScreenState extends State<TimeLineScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(left: Dimensions.paddingSizeTen),
          child: Icon(Icons.menu),
        ),
        leadingWidth: 50,
        title: Text('সময়রেখা', style: notoSerifBold.copyWith(fontSize: Dimensions.fontSizeSixteen)),
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: Dimensions.marginSizeTen),
            padding: const EdgeInsets.all(Dimensions.paddingSizeFive),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.grey.withOpacity(0.07),
            ),
            child: Image.asset(Images.notificationIcon, width: 24, height: 24),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(Dimensions.paddingSizeTwenty),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('আজ, ১২ জুলাই', style: notoSerifBold.copyWith(fontSize: Dimensions.fontSizeSixteen)),

                CustomButton(
                  onTap: () {
                    Get.toNamed(RoutesName.getNewAddScreen());
                  },
                  width: 100, height: 30,
                  text: 'নতুন যোগ করুন',
                  fontSize: Dimensions.fontSizeTwelve,
                  fontWeight: FontWeight.w700,
                  radius: Dimensions.radiusTwenty,
                ),
              ],
            ),
            const SizedBox(height: 20),

            Container(
              height: 100,
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(Dimensions.radiusTen),
                boxShadow: [BoxShadow(color: AppColor.black.withOpacity(0.15), spreadRadius: 0, blurRadius: 5)],
              ),
            ),
            const SizedBox(height: 20),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(Dimensions.paddingSizeFifteen),
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(Dimensions.radiusTen),
                boxShadow: [BoxShadow(color: AppColor.black.withOpacity(0.15), spreadRadius: 0, blurRadius: 5)],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('আজকের কার্যক্রম', style: notoSerifBold.copyWith(fontSize: Dimensions.fontSizeSixteen)),
                  const SizedBox(height: 20),

                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text('সকাল', style: notoSerifMedium),
                            Text('১১:০০ মি.', style: notoSerifMedium),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),

                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(Dimensions.paddingSizeTen),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.radiusTen),
                            gradient: const LinearGradient(
                              colors: [AppColor.secondary, AppColor.primary],
                              begin: Alignment.topLeft, end: Alignment.bottomRight,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.access_time, color: AppColor.white, size: 20),
                                  const SizedBox(width: 5),

                                  Text('সকাল ১১:০০ মি.', style: notoSerifMedium.copyWith(color: AppColor.white)),
                                ],
                              ),
                              const SizedBox(height: 10),

                              Text('সেথায় তোমার কিশোরী বধূটি মাটির প্রদীপ ধরি, তুলসীর মূলে প্রণাম যে আঁকে হয়ত তোমারে স্মরি।', style: notoSerifMedium.copyWith(color: AppColor.white, fontWeight: FontWeight.w600)),
                              const SizedBox(height: 10),

                              Text('বাক্য', style: notoSerifMedium.copyWith(color: AppColor.white)),

                              Row(
                                children: [
                                  Image.asset(Images.locationIcon, width: 15, height: 15, color: AppColor.white),
                                  const SizedBox(width: 5),

                                  Text('ঢাকা, বাংলাদেশ', style: notoSerifMedium.copyWith(color: AppColor.white)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
