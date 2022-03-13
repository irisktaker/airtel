import 'package:airtel/screens/usage/usage_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:circular_chart_flutter/circular_chart_flutter.dart';
import 'package:intl/intl.dart';

import '../../widgets/custom_calendar.dart';
import '/widgets/new_offers.dart';
import '/utilities/constantces.dart';
import '/singleton/singleton.dart';
import '/screens/usage/usage_details_screen.dart';

class UsageScreen extends StatefulWidget {
  const UsageScreen({Key? key}) : super(key: key);

  @override
  State<UsageScreen> createState() => _UsageScreenState();
}

UsageScreenBloc _bloc = UsageScreenBloc();

class _UsageScreenState extends State<UsageScreen> {
  static DateTime _selectedDate = DateTime.now();

  DateTime? _datePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(), // must be in rang with firstDate
      firstDate: DateTime.now(),
      lastDate: DateTime(2023),
    ).then((value) {
      if (value == null) {
        return 'Pick a date';
      } else {
        setState(() {
          _selectedDate = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 215, 237, 250),
      body: ListView(
        children: [
          Stack(
            children: [
              buildInternetSpeedSection(size),
              Container(
                margin: const EdgeInsets.only(
                    top: 70, left: 16, right: 16, bottom: 20),
                child: Column(
                  children: [
                    buildUsageChartSection(context, size),
                    buildCalenderAndDataSection(size),
                    buildPlansSection(size),
                    const NewOfferCard(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container buildInternetSpeedSection(Size size) {
    return Container(
      width: size.width,
      height: 40,
      margin: const EdgeInsets.only(top: 16),
      color: const Color.fromARGB(200, 165, 238, 220),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Your internet speed is ",
            style: TextStyle(
              color: AppColors.color.darkGrey,
            ),
          ),
          const Text(
            "Good",
            style: TextStyle(
              color: Color.fromARGB(255, 15, 211, 15),
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            " now!",
            style: TextStyle(
              color: AppColors.color.darkGrey,
            ),
          ),
        ],
      ),
    );
  }

  InkWell buildUsageChartSection(BuildContext context, Size size) {
    return InkWell(
      onTap: () {
        setState(() {
          _bloc.showInternetSpeedSectionBorder =
              !_bloc.showInternetSpeedSectionBorder;
        });
      },
      child: Container(
        width: size.width,
        height: size.height * 0.45,
        decoration: BoxDecoration(
          color: AppColors.color.white,
          border: _bloc.showInternetSpeedSectionBorder ? _bloc.border : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(
              flex: 2,
            ),
            Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue[300]!,
                  width: 2,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.color.blue.withOpacity(0.1),
                ),
                child: AnimatedCircularChart(
                  key: _bloc.chartKey,
                  size: const Size(200.0, 200.0),
                  initialChartData: [
                    CircularStackEntry(
                      [
                        CircularSegmentEntry(
                          _bloc.dataUsed,
                          AppColors.color.red,
                          rankKey: 'completed',
                        ),
                        CircularSegmentEntry(
                          _bloc.availableData,
                          AppColors.color.white,
                          rankKey: 'remaining',
                        ),
                      ],
                      rankKey: 'progress',
                    ),
                  ],
                  chartType: CircularChartType.Radial,
                  edgeStyle: SegmentEdgeStyle.round,
                  percentageValues: true,
                  duration: const Duration(seconds: 1),
                  holeLabel: "${_bloc.dataUsed.toStringAsFixed(0)}%",
                  holeRadius: 70,
                  labelStyle: TextStyle(
                    color: AppColors.color.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 28.0,
                  ),
                ),
              ),
            ),
            const Spacer(),
            Text(
              "Renews in 4 Hrs",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: AppColors.color.darkGrey,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UsageDetailsScreen(),
                  ),
                );
              },
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UsageDetailsScreen(),
                    ),
                  );
                },
                child: Text(
                  "Tap to view detailed usage details >>",
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.color.red.withOpacity(0.70),
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget buildCalenderAndDataSection(Size size) {
    return InkWell(
      onTap: () {
        setState(() {
          _bloc.showCalenderAndDataSectionBorder =
              !_bloc.showCalenderAndDataSectionBorder;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 16),
        height: size.height * 0.19,
        width: size.width - 32,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: Singleton.instance.internetData.length,
          itemBuilder: ((context, index) {
            return Column(
              children: [
                Container(
                  width: size.width - 32,
                  height: size.height * 0.19,
                  margin: const EdgeInsets.only(right: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.color.white,
                    border: _bloc.showCalenderAndDataSectionBorder
                        ? _bloc.border
                        : null,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 3.0,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            // Singleton.instance.internetData[index].day,
                            "${DateFormat('EEEE').format(_selectedDate)}, ",
                          ),
                          Text(
                            // Singleton.instance.internetData[index].date,
                            "${DateFormat.MMMd().format(_selectedDate)} - ",
                          ),
                          Text(
                            //   Singleton.instance.internetData[index].time,
                            DateFormat('h:mm a').format(DateTime.now()),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              _datePicker();

                              // showDialog(
                              //   context: context,
                              //   builder: (BuildContext context) {
                              //     return AlertDialog(
                              //       content: customCalender(),
                              //     );
                              //   },
                              // );
                            },
                            child: CircleAvatar(
                              backgroundColor:
                                  AppColors.color.red.withOpacity(0.3),
                              child: Image.asset(
                                "assets/icons/calender.png",
                                scale: 0.8,
                              ),
                              radius: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      const Divider(),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Total data",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.color.red,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "${Singleton.instance.internetData[index].totalData} GB",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: AppColors.color.red,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 1,
                            height: 50,
                            color: AppColors.color.grey.withOpacity(0.3),
                          ),
                          Column(
                            children: [
                              Text(
                                "Data used",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.color.blue,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "${Singleton.instance.internetData[index].dataUsed} GB",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: AppColors.color.blue,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 1,
                            height: 50,
                            color: AppColors.color.grey.withOpacity(0.3),
                          ),
                          Column(
                            children: [
                              const Text(
                                "Available data",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.green,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "${Singleton.instance.internetData[index].availableData} GB",
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget buildPlansSection(Size size) {
    return InkWell(
      onTap: () {
        setState(() {
          _bloc.showPlansSectionBorder = !_bloc.showPlansSectionBorder;
        });
      },
      child: Container(
        width: size.width,
        height: size.height * 0.19,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.color.red,
          border: _bloc.showPlansSectionBorder ? _bloc.border : null,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 3.0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: size.width * 0.49,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          const SizedBox(width: 20),
                          Text(
                            "LKR449",
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColors.color.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "plan",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.color.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "expires on 01 jan 2020",
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.color.white.withOpacity(0.60),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 5,
                            height: 5,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.color.white,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "10 GB data per day",
                            style: TextStyle(
                              fontSize: 11,
                              color: AppColors.color.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 5,
                            height: 5,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.color.white,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "12 PM - 2 PM unlimited data",
                            style: TextStyle(
                              fontSize: 11,
                              color: AppColors.color.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            ///
            ///
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/sale.png",
                  width: 70,
                  height: 50,
                  scale: 0.8,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      "25+",
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.color.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "surprising plans",
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.color.white,
                      ),
                    ),
                  ],
                ),
                TextButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(
                        horizontal: 34,
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      AppColors.color.white,
                    ),
                    foregroundColor: MaterialStateProperty.all(
                      AppColors.color.red,
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Other Plans",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
