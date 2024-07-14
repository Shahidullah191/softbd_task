import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:softbd_task/common/custom_button.dart';
import 'package:softbd_task/features/timeline/controller/timeline_controller.dart';
import 'package:softbd_task/features/timeline/widget/timeline_shimmer_widget.dart';
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
  void initState() {
    super.initState();
    Get.find<TimelineController>().getTimelineData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        surfaceTintColor: AppColor.white,
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
      body: GetBuilder<TimelineController>(builder: (timelineController) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Dimensions.paddingSizeTwenty),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(formatDate(DateTime.now()), style: notoSerifBold.copyWith(fontSize: Dimensions.fontSizeSixteen)),
          
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
                  height: 300,
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(Dimensions.radiusTen),
                    boxShadow: [BoxShadow(color: AppColor.black.withOpacity(0.15), spreadRadius: 0, blurRadius: 5)],
                  ),
                  child: EasyDateTimeLine(
                    initialDate: DateTime.now(),
                    onDateChange: (selectedDate) {
                      //`selectedDate` the new date selected.
                    },

                    dayProps: const EasyDayProps(
                      dayStructure: DayStructure.dayStrDayNum,
                      activeDayStyle: DayStyle(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xff3371FF),
                              Color(0xff8426D6),
                            ],
                          ),
                        ),
                      ),
                    ),
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
          
                      timelineController.timelineModel?.data != null ? timelineController.timelineModel!.data!.isNotEmpty ? ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: timelineController.timelineModel?.data?.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: Dimensions.paddingSizeTwenty),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        timelineController.timelineModel?.data?[index].date?.split(' ')[0] ?? '',
                                        style: notoSerifMedium.copyWith(color: index.isEven ? AppColor.black : AppColor.blue),
                                      ),
                                      Text(
                                        '${timelineController.timelineModel?.data?[index].date?.split(' ')[1] ?? ''} ${timelineController.timelineModel?.data?[index].date?.split(' ')[2] ?? ''}',
                                        style: notoSerifMedium.copyWith(color: index.isEven ? AppColor.black : AppColor.blue),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 20),

                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(Dimensions.paddingSizeTen),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(Dimensions.radiusTen),
                                      gradient: index.isEven ? const LinearGradient(
                                        colors: [AppColor.secondary, AppColor.primary],
                                        begin: Alignment.topLeft, end: Alignment.bottomRight,
                                      ) : const LinearGradient(
                                        colors: [AppColor.black, AppColor.black],
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

                                            Text(timelineController.timelineModel?.data?[index].date ?? '', style: notoSerifMedium.copyWith(color: AppColor.white)),
                                          ],
                                        ),
                                        const SizedBox(height: 10),

                                        Text(timelineController.timelineModel?.data?[index].name ?? '', style: notoSerifMedium.copyWith(color: AppColor.white, fontWeight: FontWeight.w600)),
                                        const SizedBox(height: 10),

                                        Text(timelineController.timelineModel?.data?[index].category ?? '', style: notoSerifMedium.copyWith(color: AppColor.white)),

                                        Row(
                                          children: [
                                            Image.asset(Images.locationIcon, width: 15, height: 15, color: AppColor.white),
                                            const SizedBox(width: 5),

                                            Text(timelineController.timelineModel?.data?[index].location ?? '', style: notoSerifMedium.copyWith(color: AppColor.white)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ) : const Center(child: Text('কোন তথ্য পাওয়া যায়নি')) : const TimelineShimmerWidget(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  String formatDate(DateTime date) {
    final DateFormat dayFormat = DateFormat('EEE', 'bn'); // Weekday in Bengali
    final DateFormat dateFormat = DateFormat('d', 'bn'); // Day in Bengali
    final DateFormat monthFormat = DateFormat('MMMM', 'bn'); // Month in Bengali

    final DateTime today = DateTime.now();

    String dayPrefix = (date.year == today.year && date.month == today.month && date.day == today.day) ? 'আজ' : dayFormat.format(date);

    String formattedDate = '$dayPrefix, ${dateFormat.format(date)} ${monthFormat.format(date)}';
    return formattedDate;
  }

}