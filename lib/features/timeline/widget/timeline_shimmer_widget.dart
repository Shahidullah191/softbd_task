import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:softbd_task/utils/app_color.dart';
import 'package:softbd_task/utils/dimensions.dart';

class TimelineShimmerWidget extends StatelessWidget {
  const TimelineShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: Dimensions.paddingSizeTwenty),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Shimmer(
                      gradient: LinearGradient(
                        colors: [AppColor.grey.withOpacity(0.07), AppColor.grey.withOpacity(0.2), AppColor.grey.withOpacity(0.07)],
                      ),
                      child: Container(
                        width: 70, height: 15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColor.grey.withOpacity(0.3),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    Shimmer(
                      gradient: LinearGradient(
                        colors: [AppColor.grey.withOpacity(0.07), AppColor.grey.withOpacity(0.2), AppColor.grey.withOpacity(0.07)],
                      ),
                      child: Container(
                        width: 100, height: 15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColor.grey.withOpacity(0.3),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),

              Expanded(
                child: Shimmer(
                  gradient: LinearGradient(
                    colors: [AppColor.grey.withOpacity(0.07), AppColor.grey.withOpacity(0.2), AppColor.grey.withOpacity(0.07)],
                  ),
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    padding: const EdgeInsets.all(Dimensions.paddingSizeTen),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radiusTen),
                      color: AppColor.grey.withOpacity(0.3),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.access_time, color: AppColor.white, size: 20),
                            const SizedBox(width: 5),

                            Container(
                              width: 100, height: 15,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppColor.grey.withOpacity(0.07),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),

                        Container(
                          width: 200, height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColor.grey.withOpacity(0.07),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
