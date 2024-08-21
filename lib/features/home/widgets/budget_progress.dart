import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BudgetProgress extends StatelessWidget {
  final String month;
  final double percentage;

  const BudgetProgress({
    Key? key,
    required this.month,
    required this.percentage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'BUDGETS',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17.sp,
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              month,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        LayoutBuilder(
          builder: (context, constraints) {
            double progressWidth = constraints.maxWidth * percentage;
            return Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 25.h,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                Container(
                  width: progressWidth,
                  height: 25.h,
                  decoration: BoxDecoration(
                    color: const Color(0xff1951d1),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.r),
                      topLeft: Radius.circular(10.r),
                    ),
                  ),
                ),
                Positioned(
                  left: 317.w, // Adjust position based on progressWidth
                  top: 0.h,
                  bottom: -5.h,
                  child: Container(
                    width: 1.w,
                    color: Colors.grey,
                  ),
                ),
              ],
            );
          },
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Spacer(),
            const Text(
              'TODAY',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}