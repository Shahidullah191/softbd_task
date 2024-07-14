import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:softbd_task/utils/app_color.dart';
import 'package:softbd_task/utils/dimensions.dart';
import 'package:softbd_task/utils/styles.dart';
import 'package:get/get.dart';
import 'package:softbd_task/features/timeline/controller/timeline_controller.dart';

class DateListWidget extends StatefulWidget {
  const DateListWidget({super.key});

  @override
  State<DateListWidget> createState() => _DateListWidgetState();
}

class _DateListWidgetState extends State<DateListWidget> {
  final int totalDays = 15;
  final int daysBefore = 7;
  final ScrollController _scrollController = ScrollController();

  List<DateTime> dateList = [];
  late TimelineController _timelineController;

  @override
  void initState() {
    super.initState();
    _timelineController = Get.find<TimelineController>();
    generateDateList();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      double initialScrollOffset = (40 + 10) * (daysBefore - 3);
      _scrollController.jumpTo(initialScrollOffset);

      _timelineController.getTimelineData();
      _timelineController.setCurrentDate(dateList[daysBefore]);
    });
  }

  void generateDateList() {
    DateTime today = DateTime.now();
    for (int i = 0; i < totalDays; i++) {
      dateList.add(today.subtract(Duration(days: daysBefore - i)));
    }
  }

  String convertToBengali(String input) {
    const englishToBengali = {
      '0': '০',
      '1': '১',
      '2': '২',
      '3': '৩',
      '4': '৪',
      '5': '৫',
      '6': '৬',
      '7': '৭',
      '8': '৮',
      '9': '৯',
    };

    return input.split('').map((e) => englishToBengali[e] ?? e).join();
  }

  String getDayInBengali(DateTime date) {
    final dayNames = ['রবি', 'সোম', 'মঙ্গল', 'বুধ', 'বৃহঃ', 'শুক্র', 'শনি'];
    return dayNames[date.weekday % 7];
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TimelineController>(
      builder: (timelineController) {
        return Container(
          height: 100,
          padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeFifteen),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.15), spreadRadius: 0, blurRadius: 5)],
          ),
          child: ListView.builder(
            controller: _scrollController,
            itemCount: totalDays,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: Dimensions.paddingSizeTen - 2),
            itemBuilder: (context, index) {

              DateTime date = dateList[index];

              return InkWell(
                onTap: () {
                 timelineController.setSelectedDate(date);
                },
                child: Container(
                  width: 40,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radiusFifty),
                    border: (timelineController.selectedDate == date) ? Border.all(color: AppColor.secondary, width: 2) : null,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        getDayInBengali(date),
                        style: notoSerifRegular.copyWith(color: AppColor.grey),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        convertToBengali(DateFormat('d').format(date)),
                        style: notoSerifRegular.copyWith(color: AppColor.black),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }
    );
  }
}
