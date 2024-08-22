import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VisaCard extends StatelessWidget {
  final String month;
  final String? amount;
  final Color color;
  final double leftOffset;

  const VisaCard({
    super.key,
    required this.month,
    this.amount,
    required this.color,
    required this.leftOffset,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: leftOffset,
      child: Container(
        width: 260.w,
        height: 170.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Spacer(),
                  Text(
                    'Spent until now in $month 2024',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              if (amount != null) // Check if the amount is provided
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(
                    '-$amount',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w600,

                    ),
                  ),
                ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  month,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
