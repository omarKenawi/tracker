import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class FinancialRow extends StatelessWidget {
  final String label;
  final int value;
  final TextStyle labelStyle;
  final TextStyle valueStyle;

  const FinancialRow({
    super.key,
    required this.label,
    required this.value,
    required this.labelStyle,
    required this.valueStyle,
  });

  @override
  Widget build(BuildContext context) {
    final numberFormat = NumberFormat('#,##0');
    String formattedValue = numberFormat.format(value);

    return Column(
      children: [
        Row(
          children: [
            Text(
              label,
              style: labelStyle,
            ),
            const Spacer(),
            Text(
              '-\$${formattedValue}',
              style: valueStyle,
            ),
          ],
        ),
        SizedBox(height: 5.h),
      ],
    );
  }
}
