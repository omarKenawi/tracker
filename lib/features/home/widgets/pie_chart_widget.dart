import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tracker/features/home/widgets/pie_chart_info_widget.dart';

class PieChartWidget extends StatelessWidget {
  const PieChartWidget({
    super.key,
    required this.month,
    required this.homePercentage,
    required this.clothingPercentage,
    required this.carPercentage,
    required this.utilPercentage,
    required this.eatingPercentage,
  });

  final String month;
  final int homePercentage;
  final int clothingPercentage;
  final int carPercentage;
  final int utilPercentage;
  final int eatingPercentage;

  @override
  Widget build(BuildContext context) {
    final data = [
      Data(name: 'Rent', percent: homePercentage.toDouble(), color: const Color(0xff1c88e5)),
      Data(name: 'Utilities', percent: utilPercentage.toDouble(), color: const Color(0xffff6e40)),
      Data(name: 'Clothing', percent: clothingPercentage.toDouble(), color:const Color(0xfffbc02e)),
      Data(name: 'Car', percent: carPercentage.toDouble(), color: const Color(0xff00bfa5)),
      Data(name: 'Eating out', percent: eatingPercentage.toDouble(), color: const Color(0xff673ab7)),
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'SPENDING',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17.sp,
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              month,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            SizedBox(
              height: 120.h,
              width: 120.w,
              child: PieChart(
                PieChartData(
                  sections: getSections(data),
                ),
              ),
            ),
            SizedBox(
              width: 50.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                const PieChartInfoWidget(
                  color: Color(0xff1c88e5),
                  text: 'Home',
                ),
                SizedBox(
                  height: 10.h,
                ),
                const PieChartInfoWidget(
                  color: Color(0xff00bfa5),
                  text: 'Auto & Transport',
                ),
                SizedBox(
                  height: 10.h,
                ),
                const PieChartInfoWidget(
                  color: Color(0xfffbc02e),
                  text: 'Cellular & Broadband',
                ),
                SizedBox(
                  height: 10.h,
                ),
                const PieChartInfoWidget(
                  color: Colors.red,
                  text: 'Hotel & Restaurant',
                ),
                SizedBox(
                  height: 10.h,
                ),
                const PieChartInfoWidget(
                  color: Color(0xff673ab7),
                  text: 'Travelling',
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  List<PieChartSectionData> getSections(List<Data> data) {
    double radius = 40.r; // Move the .r usage here, where it's not a constant
    return data
        .asMap()
        .map<int, PieChartSectionData>((index, data) {
      final value = PieChartSectionData(
        color: data.color,
        value: data.percent,
        showTitle: false,
        radius: radius,
      );
      return MapEntry(index, value);
    })
        .values
        .toList();
  }
}

class Data {
  final String name;
  final double percent;
  final Color color;

  Data({required this.name, required this.percent, required this.color});
}
