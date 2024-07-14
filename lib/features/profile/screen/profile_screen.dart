import 'package:flutter/material.dart';
import 'package:softbd_task/utils/app_color.dart';
import 'package:softbd_task/utils/dimensions.dart';
import 'package:softbd_task/utils/images.dart';
import 'package:softbd_task/utils/styles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        surfaceTintColor: AppColor.white,
        title: Text('প্রোফাইল', style: notoSerifBold.copyWith(fontSize: Dimensions.fontSizeSixteen)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(Dimensions.paddingSizeTwenty),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(Images.menAvatar),
            ),
            const SizedBox(height: 20),

            Text(
              'মোঃ মোহাইমেনুল রেজা',
              style: notoSerifBold.copyWith(fontSize: Dimensions.fontSizeTwenty),
            ),
            const SizedBox(height: 10),

            Text('সফটবিডি লিমিটেড', style: notoSerifRegular.copyWith(color: AppColor.grey)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Images.locationIcon, width: 20, height: 20),
                const SizedBox(width: 5),
                Text('ঢাকা', style: notoSerifRegular.copyWith(color: AppColor.grey)),
              ],
            ),
            const SizedBox(height: 20),

            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: Text('অ্যাকাউন্ট', style: notoSerifMedium.copyWith(fontSize: Dimensions.fontSizeSixteen)),
                  ),

                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: Text('সেটিংস', style: notoSerifMedium.copyWith(fontSize: Dimensions.fontSizeSixteen)),
                  ),

                  ListTile(
                    leading: const Icon(Icons.help),
                    title: Text('সাহায্য সহযোগীতা', style: notoSerifMedium.copyWith(fontSize: Dimensions.fontSizeSixteen)),
                  ),

                  ListTile(
                    leading: const Icon(Icons.info),
                    title: Text('তথ্য', style: notoSerifMedium.copyWith(fontSize: Dimensions.fontSizeSixteen)),
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
