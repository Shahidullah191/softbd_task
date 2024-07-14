import 'package:flutter/material.dart';
import 'package:softbd_task/utils/app_color.dart';
import 'package:softbd_task/utils/dimensions.dart';
import 'package:softbd_task/utils/images.dart';
import 'package:softbd_task/utils/styles.dart';

class CustomDropdownButton extends StatelessWidget {
  final String hint;
  final String? icon;
  final List<String>? items;
  final String? value;
  final Function(String?) onChanged;

  const CustomDropdownButton({
    super.key,
    required this.hint,
    this.items,
    this.value,
    required this.onChanged,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radiusEight),
            borderSide: BorderSide(color: AppColor.grey.withOpacity(0.1)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radiusEight),
            borderSide: BorderSide(color: AppColor.grey.withOpacity(0.1)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radiusEight),
            borderSide: BorderSide(color: AppColor.grey.withOpacity(0.1)),
          ),
        ),
        hint: Row(
          children: [
            icon != null ? Image.asset(icon!, height: 20, width: 20, color: AppColor.grey) : const SizedBox(),
            SizedBox(width: icon != null ? 10 : 0),

            Text(hint, style: notoSerifRegular.copyWith(color: AppColor.grey)),
          ],
        ),

        icon: Icon(Icons.arrow_forward_ios, color: AppColor.grey.withOpacity(0.3), size: 20),
        value: value,
        items: items?.map((String category) {
          return DropdownMenuItem<String>(
            value: category,
            child: Text(category, style: notoSerifRegular.copyWith(color: AppColor.grey)),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
