import 'package:softbd_task/utils/images.dart';

class MenuList{
  final String image;
  final String menuNo;

  MenuList({required this.image, required this.menuNo});

  static List<MenuList> menuList = [
    MenuList(image: Images.menuNo01, menuNo: 'মেনু নং ০০০০১'),
    MenuList(image: Images.menuNo02, menuNo: 'মেনু নং ০০০০২'),
    MenuList(image: Images.menuNo03, menuNo: 'মেনু নং ০০০০৩'),
    MenuList(image: Images.menuNo04, menuNo: 'মেনু নং ০০০০৪'),
    MenuList(image: Images.menuNo05, menuNo: 'মেনু নং ০০০০৫'),
    MenuList(image: Images.menuNo06, menuNo: 'মেনু নং ০০০০৬'),
  ];

}