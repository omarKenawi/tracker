import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tracker/features/home/widgets/pie_chart_info_widget.dart';

class PieChartWidget extends StatelessWidget {
  const PieChartWidget({super.key, required this.month});

  final String month;

  @override
  Widget build(BuildContext context) {
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
                  sections: getSections(),
                ),
              ),
            ),
            SizedBox(
              width: 50.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PieChartInfoWidget(
                  color:Color(0xff1c88e5) ,
                  text: 'Home',
                ),
                SizedBox(height: 10.h,),
                const PieChartInfoWidget(
                  color:Color(0xff00bfa5) ,
                  text: 'Auto & Transport',
                ),
                SizedBox(height: 10.h,),
                const PieChartInfoWidget(
                  color:Color(0xfffbc02e) ,
                  text: 'Cellular & Broadband',
                ),
                SizedBox(height: 10.h,),
                //Colors.red.withOpacity(0.5)
                const PieChartInfoWidget(
                  color:Colors.red,
                  text: 'Cellular & Broadband',
                ),
                SizedBox(height: 10.h,),
                const PieChartInfoWidget(
                  color:Color(0xff673ab7),
                  text: 'Travelling',
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

List<PieChartSectionData> getSections() => PieData.data
    .asMap()
    .map<int, PieChartSectionData>((index, data) {
  final value = PieChartSectionData(
    color: data.color,
    value: data.percent,
    showTitle: false,
    radius: 40.r,
  );
  return MapEntry(index, value);
}).values.toList();

class PieData {
  static List<Data> data = [
    Data(name: 'Rent', percent: 51, color: const Color(0xffff6e40)),
    Data(name: 'Utilities', percent: 19, color: const Color(0xff1c88e5)),
    Data(name: 'Clothing', percent: 16, color: const Color(0xff00bfa5)),
    Data(name: 'Car', percent: 5, color: const Color(0xfffbc02e)),
    Data(name: 'Eating out', percent: 4, color: const Color(0xff673ab7)),
  ];
}

class Data {
  final String name;
  final double percent;
  final Color color;

  Data({required this.name, required this.percent, required this.color});
}
