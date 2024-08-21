import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgressBarWidget extends StatelessWidget {
  final double progressWidth;
  final Color color;

  const ProgressBarWidget({
    super.key,
    required this.progressWidth,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: progressWidth,
      height: 18.h,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.r),
      ),
    );
  }
}
