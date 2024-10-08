import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class InfoCard extends StatelessWidget {
  final Widget? imageIcon;
  final IconData? icon;
  final Color iconBackgroundColor;
  final String title;
  final int money;
  final int total;

  const InfoCard({
    super.key,
    this.imageIcon,
    this.icon,
    required this.iconBackgroundColor,
    required this.title,
    required this.money,
    required this.total,
  }) : assert(imageIcon != null || icon != null);

  @override
  Widget build(BuildContext context) {
    // Create an instance of NumberFormat
    final numberFormat = NumberFormat('#,###');

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey.shade200,
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                color: iconBackgroundColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: iconBackgroundColor.withOpacity(0.5),
                    blurRadius: 20.r,
                    offset: Offset(0, 5.h),
                  ),
                ],
              ),
              padding: EdgeInsets.all(10.r),
              child: imageIcon ?? Icon(
                icon,
                color: Colors.white,
                size: 24.sp,
              ),
            ),
            SizedBox(width: 15.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    '${(money * 100 / total).round()} %',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              '-\$${numberFormat.format(money)}', // Format the money value
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
