import 'package:flutter/material.dart';

import '/utilities/constantces.dart';
import '/singleton/singleton.dart';

class UsageDetailsScreen extends StatefulWidget {
  const UsageDetailsScreen({Key? key}) : super(key: key);

  @override
  _UsageDetailsScreenState createState() => _UsageDetailsScreenState();
}

class _UsageDetailsScreenState extends State<UsageDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 215, 237, 250),
      appBar: AppBar(
        backgroundColor: AppColors.color.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.keyboard_backspace_outlined,
            color: AppColors.color.darkGrey,
          ),
        ),
        title: Text(
          "usage details".toUpperCase(),
          style: TextStyle(
            color: AppColors.color.darkGrey,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              "assets/images/menu.png",
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            width: size.width,
            height: 48,
            margin: const EdgeInsets.only(left: 16, right: 16, top: 32),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: AppColors.color.white,
            ),
            child: Row(
              children: [
                Container(
                  width: size.width * 0.30,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppColors.color.red,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 3.0,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      "Daily",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.color.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  width: size.width * 0.30,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    // color: Colors.transparent,
                    // boxShadow: const [
                    //   BoxShadow(
                    //     color: Colors.grey,
                    //     offset: Offset(0.0, 1.0), //(x,y)
                    //     blurRadius: 3.0,
                    //   ),
                    // ],
                  ),
                  child: Center(
                    child: Text(
                      "Weekly",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.color.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  width: size.width * 0.30,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    // color: AppColors.color.red,
                    // boxShadow: const [
                    //   BoxShadow(
                    //     color: Colors.grey,
                    //     offset: Offset(0.0, 1.0), //(x,y)
                    //     blurRadius: 3.0,
                    //   ),
                    // ],
                  ),
                  child: Center(
                    child: Text(
                      "Monthly",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.color.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            width: size.width - 32,
            height: size.height,
            child: ListView.builder(
              itemCount: Singleton.instance.internetData.length,
              itemBuilder: ((context, index) {
                return Column(
                  children: [
                    Container(
                      width: size.width - 32,
                      height: size.height * 0.19,
                      margin: const EdgeInsets.all(16),
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
                                Singleton.instance.internetData[index].day,
                              ),
                              Text(
                                Singleton.instance.internetData[index].date,
                              ),
                              Text(
                                Singleton.instance.internetData[index].time,
                              ),
                            ],
                          ),
                          const SizedBox(height: 14),
                          Row(
                            children: [
                              Container(
                                height: 7,
                                width: size.width *
                                    Singleton
                                        .instance.internetData[index].dataUsed /
                                    Singleton
                                        .instance.internetData[index].totalData,
                                decoration: BoxDecoration(
                                  color: AppColors.color.yellow,
                                ),
                              ),
                              Container(
                                height: 7,
                                width: (size.width - 64) -
                                    size.width *
                                        Singleton.instance.internetData[index]
                                            .dataUsed /
                                        Singleton.instance.internetData[index]
                                            .totalData,
                                decoration: BoxDecoration(
                                  color: AppColors.color.pink,
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
        ],
      ),
    );
  }
}
