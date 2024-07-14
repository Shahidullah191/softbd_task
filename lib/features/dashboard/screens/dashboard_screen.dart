import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:softbd_task/features/dashboard/widget/bottom_nav_item_widget.dart';
import 'package:softbd_task/features/home/screens/home_screen.dart';
import 'package:softbd_task/features/pick_camera/screen/pick_camera_screen.dart';
import 'package:softbd_task/features/profile/screen/profile_screen.dart';
import 'package:softbd_task/features/schedule_menu/screen/schedule_menu_screen.dart';
import 'package:softbd_task/features/timeline/screen/timeline_screen.dart';
import 'package:softbd_task/utils/app_color.dart';
import 'package:softbd_task/utils/dimensions.dart';
import 'package:softbd_task/utils/images.dart';

class DashboardScreen extends StatefulWidget {
  final int pageIndex;
  const DashboardScreen({super.key, required this.pageIndex});

  @override
  DashboardScreenState createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {

  PageController? _pageController;
  int _pageIndex = 0;
  late List<Widget> _screens;
  bool _canExit = false;

  @override
  void initState() {
    super.initState();

    _pageIndex = widget.pageIndex;

    _pageController = PageController(initialPage: widget.pageIndex);

    _screens = [
      const HomeScreen(),
      const TimeLineScreen(),
      const PickCameraScreen(),
      const ScheduleMenuScreen(),
      const ProfileScreen(),
    ];

  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if(_pageIndex != 0) {
          _setPage(0);
        }else {
          if(_canExit) {
            if (GetPlatform.isAndroid) {
              SystemNavigator.pop();
            } else if (GetPlatform.isIOS) {
              exit(0);
            }
          }
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('অ্যাপ থেকে প্রস্থান করতে আবার ব্যাক টিপুন', style: TextStyle(color: Colors.white)),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
            margin: EdgeInsets.all(Dimensions.marginSizeTen),
          ));
          _canExit = true;

          Timer(const Duration(seconds: 2), () {
            _canExit = false;
          });
        }
      },
      child: Scaffold(

        floatingActionButton: Material(
          elevation: 4,
          shape: const CircleBorder(),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 56.0,
                height: 56.0,
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
              ),
              FloatingActionButton(
                onPressed: () => _setPage(2),
                elevation: 0,
                shape: const CircleBorder(),
                backgroundColor: Colors.transparent,
                child: Image.asset(Images.cameraIcon, height: 35, width: 35, color: Colors.white),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: !GetPlatform.isMobile ? null : FloatingActionButtonLocation.centerDocked,

        bottomNavigationBar: !GetPlatform.isMobile ? const SizedBox() : BottomAppBar(
          elevation: 10,
          notchMargin: 5,
          color: AppColor.white,
          shadowColor: AppColor.white,
          surfaceTintColor: Colors.transparent,
          shape: const CircularNotchedRectangle(),

          child: Row(children: [
            BottomNavItemWidget(
              selectedIcon: Images.homeSelectedIcon,
              unselectedIcon: Images.homeUnselectedIcon,
              isSelected: _pageIndex == 0,
              onTap: () => _setPage(0),
            ),

            BottomNavItemWidget(
              selectedIcon: Images.calenderSelectedIcon,
              unselectedIcon: Images.calenderUnselectedIcon,
              isSelected: _pageIndex == 1,
              onTap: () => _setPage(1),
            ),

            const Expanded(child: SizedBox()),

            BottomNavItemWidget(
              selectedIcon: Images.scheduleMenuUnselectedIcon,
              unselectedIcon: Images.scheduleMenuUnselectedIcon,
              isSelected: _pageIndex == 3,
              onTap: () => _setPage(3),
            ),

            BottomNavItemWidget(
              selectedIcon: Images.profileUnselectedIcon,
              unselectedIcon: Images.profileUnselectedIcon,
              isSelected: _pageIndex == 4,
              onTap: () => _setPage(4),
            ),
          ]),
        ),
        body: PageView.builder(
          controller: _pageController,
          itemCount: _screens.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return _screens[index];
          },
        ),
      ),
    );
  }

  void _setPage(int pageIndex) {
    setState(() {
      _pageController!.jumpToPage(pageIndex);
      _pageIndex = pageIndex;
    });
  }
}