import 'package:flutter/material.dart';
import 'package:softbd_task/features/home/model/menu_list.dart';
import 'package:softbd_task/utils/app_color.dart';
import 'package:softbd_task/utils/dimensions.dart';
import 'package:softbd_task/utils/images.dart';
import 'package:softbd_task/utils/styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(left: Dimensions.paddingSizeTen),
          child: Icon(Icons.menu),
        ),
        leadingWidth: 50,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(Images.demoIcon, width: 37, height: 37),
            const SizedBox(width: 10),

            Text('Flutter Task', style: notoSerifBold.copyWith(fontSize: Dimensions.fontSizeSixteen)),
          ],
        ),
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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(Dimensions.paddingSizeTwenty),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                padding: const EdgeInsets.all(Dimensions.paddingSizeFifteen),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(Dimensions.radiusTen),
                  boxShadow: [BoxShadow(color: AppColor.black.withOpacity(0.16), spreadRadius: 0, blurRadius: 6)],
                ),
                child: Row(
                  children: [
                    ClipOval(child: Image.asset(Images.menAvatar, width: 65, height: 65)),
                    const SizedBox(width: 15),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('মোঃ মোহাইমেনুল রেজা', style: notoSerifBold.copyWith(fontSize: Dimensions.fontSizeTwenty)),
                        const SizedBox(height: 10),

                        Text('সফটবিডি লিমিটেড', style: notoSerifRegular.copyWith(color: AppColor.grey)),
                        Row(
                          children: [
                            Image.asset(Images.locationIcon, width: 20, height: 20),
                            const SizedBox(width: 5),
                            Text('ঢাকা', style: notoSerifRegular.copyWith(color: AppColor.grey)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 110, height: 110,
                        child: CircularProgressIndicator(
                          strokeWidth: 10,
                          value: 0.5,
                          backgroundColor: AppColor.lightGrey,
                          valueColor: AlwaysStoppedAnimation<Color>(AppColor.primary),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text('সময় অতিবাহিত', style: notoSerifBold.copyWith(fontSize: Dimensions.fontSizeSixteen)),
                    ],
                  ),
                  const SizedBox(width: 25),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('মেয়াদকাল', style: notoSerifBold.copyWith(fontSize: Dimensions.fontSizeSixteen)),

                        Row(
                          children: [
                            Image.asset(Images.calenderUnselectedIcon, width: 15, height: 15),
                            const SizedBox(width: 5),
                            Flexible(child: Text('১ই জানুয়ারি ২০২৪ - ৩১ই জানুয়ারি ২০৩০', style: notoSerifMedium.copyWith(fontSize: Dimensions.fontSizeTwelve))),
                          ],
                        ),
                        const SizedBox(height: 15),

                        Text('আরও বাকি', style: notoSerifBold.copyWith(fontSize: Dimensions.fontSizeSixteen, color: AppColor.red)),
                        const SizedBox(height: 5),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                const Row(
                                  children: [
                                    TimeBox(time: '০'),
                                    SizedBox(width: 5),

                                    TimeBox(time: '০'),
                                  ],
                                ),
                                const SizedBox(height: 5),

                                Text('বছর', style: notoSerifMedium.copyWith(fontSize: Dimensions.fontSizeTwelve)),
                              ],
                            ),

                            Column(
                              children: [
                                const Row(
                                  children: [
                                    TimeBox(time: '০'),
                                    SizedBox(width: 5),

                                    TimeBox(time: '০'),
                                  ],
                                ),
                                const SizedBox(height: 5),

                                Text('মাস', style: notoSerifMedium.copyWith(fontSize: Dimensions.fontSizeTwelve)),
                              ],
                            ),

                            Column(
                              children: [
                                const Row(
                                  children: [
                                    TimeBox(time: '০'),
                                    SizedBox(width: 5),

                                    TimeBox(time: '০'),
                                  ],
                                ),
                                const SizedBox(height: 5),

                                Text('দিন', style: notoSerifMedium.copyWith(fontSize: Dimensions.fontSizeTwelve)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 40,
                  mainAxisExtent: 125,
                ),
                padding: const EdgeInsets.all(0),
                shrinkWrap: true,
                itemCount: MenuList.menuList.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        padding: const EdgeInsets.all(Dimensions.paddingSizeTwentyFive - 2),
                        decoration: BoxDecoration(
                          color: AppColor.lightGrey,
                          borderRadius: BorderRadius.circular(Dimensions.radiusEight),
                        ),
                        child: Image.asset(MenuList.menuList[index].image, width: 35, height: 35),
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: 70,
                        child: Text(
                          MenuList.menuList[index].menuNo,
                          style: notoSerifMedium.copyWith(fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TimeBox extends StatelessWidget {
  final String time;
  const TimeBox({super.key, required this.time});

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
