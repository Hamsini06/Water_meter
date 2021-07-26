import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'widgets_graph.dart';
String text="12";

List<BarChartGroupData> itemData(){
  return BarRod().barData.map(
        (data)=>BarChartGroupData(
      x: data.day,
      barRods: [
        BarChartRodData(y: data.value, colors: [Colors.lightBlueAccent, Colors.greenAccent])
      ],
      showingTooltipIndicators: [0],
    ),
  ).toList();
}
List<BarChartGroupData> itemDataMonth(){
  return BarRod().monthBarData.map(
        (data)=>BarChartGroupData(
      x: data.month,
      barRods: [
        BarChartRodData(
            y: data.monthValue,
            colors: [Colors.lightBlueAccent, Colors.greenAccent],
          width: 7
        )
      ],
      showingTooltipIndicators: [0],
    ),
  ).toList();
}

Expanded barChartDaily = Expanded(
  child: Container(
    child: BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        groupsSpace: 35,
        maxY: 20,
        barTouchData: BarTouchData(
          enabled: false,
          touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.transparent,
            tooltipPadding: const EdgeInsets.all(0),
            tooltipMargin: 8,
            getTooltipItem: (
                BarChartGroupData group,
                int groupIndex,
                BarChartRodData rod,
                int rodIndex,
                ) {
              return BarTooltipItem(
                rod.y.round().toString(),
                TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,

                ),
              );
            },
          ),
        ),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: SideTitles(
            showTitles: true,
            getTextStyles: (value) => const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
            margin: 20,
            getTitles: (double value) {
              switch (value.toInt()) {
                case 0:
                  return 'Mn';
                case 1:
                  return 'Te';
                case 2:
                  return 'Wd';
                case 3:
                  return 'Th';
                case 4:
                  return 'Fr';
                case 5:
                  return 'St';
                case 6:
                  return 'Sn';
                default:
                  return '';
              }
            },
          ),
          leftTitles: SideTitles(showTitles: false),
        ),
        borderData: FlBorderData(
          show: false,
        ),
        barGroups: itemData()  ,
      ),
    ),
  ),
) ;

Widget barChartMonthly =  SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: Container(
    height: 170,
    width:470,
    child: Padding(
        padding: EdgeInsets.only(top:20,left:8,right: 8),
        child:BarChart(
          BarChartData(

            maxY: 120,
            barTouchData: BarTouchData(
              enabled: false,
              touchTooltipData: BarTouchTooltipData(
                tooltipBgColor: Colors.transparent,
                tooltipPadding: const EdgeInsets.all(0),
                tooltipMargin: 8,
                getTooltipItem: (
                    BarChartGroupData group,
                    int groupIndex,
                    BarChartRodData rod,
                    int rodIndex,
                    ) {
                  return BarTooltipItem(
                    rod.y.round().toString(),
                    TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ),
            titlesData: FlTitlesData(
              show: true,
              bottomTitles: SideTitles(
                showTitles: true,
                getTextStyles: (value) => const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold,  ),
                margin: 20,
                getTitles: (double value) {
                  switch (value.toInt()) {
                    case 0:
                      return 'Jan';
                    case 1:
                      return 'Feb';
                    case 2:
                      return 'Mar';
                    case 3:
                      return 'Apr';
                    case 4:
                      return 'May';
                    case 5:
                      return 'Jun';
                    case 6:
                      return 'Jul';
                    case 7:
                      return 'Aug';
                    case 8:
                      return 'Sep';
                    case 9:
                      return 'Oct';
                    case 10:
                      return 'Nov';
                    case 11:
                      return 'Dec';
                    default:
                      return '';
                  }
                },
              ),
              leftTitles: SideTitles(showTitles: false),
            ),
            borderData: FlBorderData(
              show: false,
            ),
            barGroups: itemDataMonth()  ,
          ),
        )
    ),
  ),
);


