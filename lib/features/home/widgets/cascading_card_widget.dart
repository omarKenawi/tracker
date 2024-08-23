import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../models/expenses_model.dart';
import 'visa_card.dart';

class CascadingCardWidget extends StatelessWidget {
  const CascadingCardWidget({super.key, required this.expense});
  final Expense expense;

  @override
  Widget build(BuildContext context) {
    final numberFormat = NumberFormat('#,###');

    // Get the current month and previous month
    final now = DateTime.now();
    final currentMonth = DateFormat('MMMM').format(now).toUpperCase();
    final previousMonth = DateFormat('MMMM').format(DateTime(now.year, now.month - 1)).toUpperCase();
    final previousMonth2 = DateFormat('MMMM').format(DateTime(now.year, now.month - 2)).toUpperCase();

    return Center(
      child: SizedBox(
        height: 200.h,
        child: Stack(
          children: [
            VisaCard(
              month: currentMonth,
              color: const Color(0xff73caf1),
              leftOffset: 100.w,
            ),
            VisaCard(
              month: previousMonth,
              color: const Color(0xff73caf1),
              leftOffset: 100.w,
            ),
            VisaCard(
              month: 'APR',
              color: const Color(0xff41f8b0),
              leftOffset: 95.w,
            ),
            VisaCard(
              month: 'MAY',
              color: const Color(0xff6651e0),
              leftOffset: 85.w,
            ),
            VisaCard(
              month: 'JUN',
              color: const Color(0xffff966e),
              leftOffset: 70.w,
            ),
            VisaCard(
              month: previousMonth2,
              color: const Color(0xffffbb33),
              leftOffset: 50.w,
            ),
            VisaCard(
              month: previousMonth,
              color: const Color(0xff01f6dc),
              leftOffset: 20.w,
            ),
            VisaCard(
              month: currentMonth,
              amount: '\$${numberFormat.format(expense.dept)}',
              color: const Color(0xff1758fd),
              leftOffset: -30.w,
            )
          ],
        ),
      ),
    );
  }
}
