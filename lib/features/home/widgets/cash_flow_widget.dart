import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:tracker/features/home/widgets/progress_bar_widget.dart';

class CashFlowWidget extends StatelessWidget {
  final int earnedAmount;
  final int spentAmount;
  final double earnedProgressWidth;
  final double spentProgressWidth;

  const CashFlowWidget({
    super.key,
    required this.earnedAmount,
    required this.spentAmount,
    required this.earnedProgressWidth,
    required this.spentProgressWidth,
  });

  @override
  Widget build(BuildContext context) {
    final NumberFormat currencyFormat = NumberFormat('#,##0');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'CASH FLOW',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17.sp,
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProgressBarWidget(
                  color: const Color(0xFF1450D1),
                  progressWidth: earnedProgressWidth,
                ),
                SizedBox(
                  height: 10.h,
                ),
                ProgressBarWidget(
                  color: Colors.red,
                  progressWidth: spentProgressWidth,
                ),
              ],
            ),
            SizedBox(
              width: 10.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '\$${currencyFormat.format(earnedAmount)} Earned',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  '\$${currencyFormat.format(spentAmount)} Spent',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              '\$${currencyFormat.format(earnedAmount - spentAmount)}',
              style: TextStyle(
                fontSize: 22.sp,
                color: const Color(0xFF1450D1),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
