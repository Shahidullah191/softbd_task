import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softbd_task/common/custom_button.dart';
import 'package:softbd_task/common/custom_snackbar.dart';
import 'package:softbd_task/features/timeline/controller/timeline_controller.dart';
import 'package:softbd_task/features/timeline/widget/custom_dropdown_button.dart';
import 'package:softbd_task/features/timeline/widget/custom_text_field.dart';
import 'package:softbd_task/utils/app_color.dart';
import 'package:softbd_task/utils/dimensions.dart';
import 'package:softbd_task/utils/images.dart';
import 'package:softbd_task/utils/styles.dart';

class NewAddScreen extends StatefulWidget {
  const NewAddScreen({super.key});

  @override
  State<NewAddScreen> createState() => _NewAddScreenState();
}

class _NewAddScreenState extends State<NewAddScreen> {

  final TextEditingController _paragraphController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        surfaceTintColor: AppColor.white,
        title: Text('নতুন যোগ করুন', style: notoSerifBold.copyWith(fontSize: Dimensions.fontSizeSixteen)),
        centerTitle: true,
      ),
      body: GetBuilder<TimelineController>(builder: (timelineController) {
        return Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeTwenty),
          child: Column(
            children: [

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('অনুচ্ছেদ', style: notoSerifBold.copyWith(fontSize: Dimensions.fontSizeSixteen)),
                          Text('৪৫ শব্দ', style: notoSerifRegular.copyWith(color: AppColor.grey)),
                        ],
                      ),
                      const SizedBox(height: 8),

                      CustomTextField(
                        hintText: 'অনুচ্ছেদ লিখুন',
                        controller: _paragraphController,
                        maxWords: 45,
                      ),
                      const SizedBox(height: 20),

                      Text('অনুচ্ছেদের বিভাগ', style: notoSerifBold.copyWith(fontSize: Dimensions.fontSizeSixteen)),
                      const SizedBox(height: 8),

                      CustomDropdownButton(
                        hint: 'অনুচ্ছেদের বিভাগ নির্বাচন করুন',
                        items: const ['প্রথম', 'দ্বিতীয়', 'তৃতীয়', 'চতুর্থ'],
                        value: timelineController.selectedParagraphDivision,
                        onChanged: (String? value) {
                          timelineController.setSelectedParagraphDivision(value!);
                        },
                      ),
                      const SizedBox(height: 20),

                      Text('তারিখ ও সময়', style: notoSerifBold.copyWith(fontSize: Dimensions.fontSizeSixteen)),
                      const SizedBox(height: 8),

                      CustomDropdownButton(
                        hint: 'নির্বাচন করুন',
                        icon: Images.calenderUnselectedIcon,
                        items: const ['আজ', 'আগামী ১ ঘণ্টা', 'আগামী ২ ঘণ্টা', 'আগামী ৪ ঘণ্টা', 'আগামী ৮ ঘণ্টা', 'আগামী ১৬ ঘণ্টা'],
                        value: timelineController.selectedDate,
                        onChanged: (value) {
                          timelineController.setSelectedDate(value!);
                        },
                      ),
                      const SizedBox(height: 20),

                      Text('স্থান', style: notoSerifBold.copyWith(fontSize: Dimensions.fontSizeSixteen)),
                      const SizedBox(height: 8),

                      CustomDropdownButton(
                        hint: 'নির্বাচন করুন',
                        icon: Images.locationIcon,
                        items: const ['ঢাকা', 'চট্টগ্রাম', 'খুলনা', 'রাজশাহী', 'সিলেট', 'বরিশাল', 'রংপুর'],
                        value: timelineController.selectedLocation,
                        onChanged: (String? value) {
                          timelineController.setSelectedLocation(value!);
                        },
                      ),
                      const SizedBox(height: 20),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('অনুচ্ছেদের বিবরণ', style: notoSerifBold.copyWith(fontSize: Dimensions.fontSizeSixteen)),
                          Text('১২০ শব্দ', style: notoSerifRegular.copyWith(color: AppColor.grey)),
                        ],
                      ),
                      const SizedBox(height: 8),

                      CustomTextField(
                        hintText: 'কার্যক্রমের বিবরণ লিখুন',
                        controller: _descriptionController,
                        maxLines: 10,
                        maxWords: 120,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              CustomButton(
                text: 'সংরক্ষন করুন',
                textColor: AppColor.white,
                onTap: () {
                  if(_paragraphController.text.isEmpty){
                    showCustomSnackBar('অনুচ্ছেদ লিখুন');
                  }else if(timelineController.selectedParagraphDivision == null){
                    showCustomSnackBar('অনুচ্ছেদের বিভাগ নির্বাচন করুন');
                  }else if(timelineController.selectedDate == null){
                    showCustomSnackBar('তারিখ ও সময় নির্বাচন করুন');
                  }else if(timelineController.selectedLocation == null){
                    showCustomSnackBar('স্থান নির্বাচন করুন');
                  }else if(_descriptionController.text.isEmpty){
                    showCustomSnackBar('অনুচ্ছেদের বিবরণ লিখুন');
                  }
                  else{
                    showDialog(
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
                                  onTap: () => Navigator.pop(context),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}
