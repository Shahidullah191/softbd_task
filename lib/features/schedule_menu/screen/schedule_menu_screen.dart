import 'package:flutter/material.dart';
import 'package:softbd_task/utils/app_color.dart';
import 'package:softbd_task/utils/dimensions.dart';
import 'package:softbd_task/utils/styles.dart';

class ScheduleMenuScreen extends StatelessWidget {
  const ScheduleMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('সময়সূচি মেনু', style: notoSerifBold.copyWith(fontSize: Dimensions.fontSizeSixteen)),
        backgroundColor: AppColor.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(Dimensions.paddingSizeTwenty),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'আপনার কাজের সময়সূচি দেখুন',
              style: notoSerifBold.copyWith(fontSize: Dimensions.fontSizeEighteen),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.schedule),
              title: Text('দৈনিক সময়সূচি', style: notoSerifMedium.copyWith(fontSize: Dimensions.fontSizeSixteen)),
              onTap: () {
              },
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: Text('সাপ্তাহিক সময়সূচি', style: notoSerifMedium.copyWith(fontSize: Dimensions.fontSizeSixteen)),
              onTap: () {
              },
            ),
            ListTile(
              leading: const Icon(Icons.event),
              title: Text('মাসিক সময়সূচি', style: notoSerifMedium.copyWith(fontSize: Dimensions.fontSizeSixteen)),
              onTap: () {
              },
            ),
          ],
        ),
      ),
    );
  }
}
