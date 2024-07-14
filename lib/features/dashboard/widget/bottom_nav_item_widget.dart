import 'package:flutter/material.dart';
import 'package:softbd_task/utils/app_color.dart';

class BottomNavItemWidget extends StatelessWidget {
  final String selectedIcon;
  final String unselectedIcon;
  final Function? onTap;
  final bool isSelected;
  const BottomNavItemWidget({super.key, this.onTap, this.isSelected = false, required this.selectedIcon, required this.unselectedIcon});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: IconButton(
        icon: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(isSelected ? selectedIcon : unselectedIcon, color: AppColor.black, height: 24, width: 24),
            const SizedBox(height: 5),

            isSelected ? Container(
              padding: const EdgeInsets.all(3),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    AppColor.secondary,
                    AppColor.primary
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ) : const SizedBox(),

          ],
        ),
        onPressed: onTap as void Function()?,
      ),
    );
  }
}