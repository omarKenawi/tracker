import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'visa_card.dart';

class CascadingCardWidget extends StatelessWidget {
  const CascadingCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 200,
        child: Stack(
          children: [
            VisaCard(
              month: 'oct',
              color: const Color(0xff73caf1),
              leftOffset: 100.w,
            ),
            VisaCard(
              month: 'oct',
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
              month: 'JUL',
              color: const Color(0xffffbb33),
              leftOffset: 50.w,
            ),
            VisaCard(
              month: 'AUG',
              color: const Color(0xff01f6dc),
              leftOffset: 20.w,
            ),
            VisaCard(
              month: 'September',
              amount: '\$3,250',
              color: const Color(0xff1758fd),
              leftOffset: -30.w,
            )
          ],
        ),
      ),
    );
  }
}
