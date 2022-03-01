import 'package:airtel/screens/usage/usage_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:circular_chart_flutter/circular_chart_flutter.dart';

import '/widgets/new_offers.dart';
import '/utilities/constantces.dart';
import '/singleton/singleton.dart';

class UsageScreen extends StatefulWidget {
  const UsageScreen({Key? key}) : super(key: key);

  @override
  State<UsageScreen> createState() => _UsageScreenState();
}

int index = 0;

class _UsageScreenState extends State<UsageScreen> {
  final GlobalKey<AnimatedCircularChartState> _chartKey =
      GlobalKey<AnimatedCircularChartState>();

  double dataUsed = Singleton.instance.internetData[index].dataUsed /
      Singleton.instance.internetData[index].totalData *
      100;

  double availableData = Singleton.instance.internetData[index].availableData /
      Singleton.instance.internetData[index].totalData *
      100;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 215, 237, 250),
      body: ListView(
        children: [
          Container(
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
          ),
          Container(
            width: size.width,
            height: size.height,
            padding: const EdgeInsets.all(16),
            child: ListView(
              children: [
                Container(
                  width: size.width,
                  height: size.height * 0.45,
                  decoration: BoxDecoration(
                    color: AppColors.color.white,
                    border: Border.all(
                      color: const Color.fromARGB(255, 15, 211, 15),
                      width: 2,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 36),
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
                            key: _chartKey,
                            size: const Size(220.0, 220.0),
                            initialChartData: [
                              CircularStackEntry(
                                [
                                  CircularSegmentEntry(
                                    dataUsed,
                                    AppColors.color.red,
                                    rankKey: 'completed',
                                  ),
                                  CircularSegmentEntry(
                                    availableData,
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
                            holeLabel: "${dataUsed.toStringAsFixed(0)}%",
                            holeRadius: 70,
                            labelStyle: TextStyle(
                              color: AppColors.color.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 24.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 26),
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
                              builder: (context) => const UsageDetailsScreen(),
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
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  height: size.height * 0.18,
                  width: size.width - 32,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: Singleton.instance.internetData.length,
                    itemBuilder: ((context, index) {
                      return Column(
                        children: [
                          Container(
                            width: size.width - 32,
                            height: size.height * 0.18,
                            margin: const EdgeInsets.only(right: 16),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: AppColors.color.white,
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
                                      Singleton
                                          .instance.internetData[index].day,
                                    ),
                                    Text(
                                      Singleton
                                          .instance.internetData[index].date,
                                    ),
                                    Text(
                                      Singleton
                                          .instance.internetData[index].time,
                                    ),
                                    const Spacer(),
                                    CircleAvatar(
                                      backgroundColor:
                                          AppColors.color.red.withOpacity(0.3),
                                      child: Image.asset(
                                        "assets/icons/calender.png",
                                        scale: 0.8,
                                      ),
                                      radius: 16,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                const Divider(),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                                      color:
                                          AppColors.color.grey.withOpacity(0.3),
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
                                      color:
                                          AppColors.color.grey.withOpacity(0.3),
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
                Container(
                  width: size.width,
                  height: size.height * 0.18,
                  decoration: BoxDecoration(
                    color: AppColors.color.red,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 3.0,
                      ),
                    ],
                  ),
                ),
                newOffersCard(size),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
