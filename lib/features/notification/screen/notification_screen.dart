import 'package:flutter/material.dart';
import 'package:softbd_task/utils/dimensions.dart';
import 'package:softbd_task/utils/styles.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('নোটিফিকেশ', style: notoSerifBold.copyWith(fontSize: Dimensions.fontSizeSixteen)),
      ),
      body: ListView.builder(
        itemCount: 15,
        padding: const EdgeInsets.all(Dimensions.paddingSizeFifteen),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              tileColor: Colors.grey.withOpacity(0.1),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              title: Text('নোটিফিকেশন টাইটেল', style: notoSerifBold.copyWith(fontSize: Dimensions.fontSizeSixteen)),
              subtitle: Text('নোটিফিকেশন বডি', style: notoSerifRegular.copyWith(fontSize: Dimensions.fontSizeFourteen)),
              trailing: Text('১১:০০ মি.', style: notoSerifRegular.copyWith(fontSize: Dimensions.fontSizeFourteen)),
            ),
          );
        },
      ),
    );
  }
}
