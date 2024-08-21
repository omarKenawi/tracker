import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FinancialRow extends StatelessWidget {
  final String label;
  final String value;
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
              value,
              style: valueStyle,
            ),
          ],
        ),
        SizedBox(height: 5.h),
      ],
    );
  }
}
