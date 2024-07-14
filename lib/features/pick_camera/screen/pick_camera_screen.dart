import 'package:flutter/material.dart';
import 'package:softbd_task/utils/dimensions.dart';
import 'package:softbd_task/utils/styles.dart';

class PickCameraScreen extends StatelessWidget {
  const PickCameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('ক্যামেরা পেজ', style: notoSerifBold.copyWith(fontSize: Dimensions.fontSizeSixteen)),
      ),
      body: Center(
        child: Text('ক্যামেরা পেজ বিস্তারিত', style: notoSerifBold.copyWith(fontSize: Dimensions.fontSizeSixteen)),
      ),
    );
  }
}
