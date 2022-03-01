import 'package:flutter/material.dart';

import '/utilities/constantces.dart';
import '/singleton/singleton.dart';
import '/widgets/popular_plans_card.dart';

class UsageScreen extends StatefulWidget {
  const UsageScreen({Key? key}) : super(key: key);

  @override
  State<UsageScreen> createState() => _UsageScreenState();
}

class _UsageScreenState extends State<UsageScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 215, 237, 250),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: DefaultTextStyle(
                style: TextStyle(
                  color: AppColors.color.darkGrey,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  // fontFamily: '',
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Popular plans"),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 138,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: Singleton.instance.popularPlans.length,
                        itemBuilder: (context, index) {
                          return popularPlansCard(
                            size,
                            internetPackage: Singleton
                                .instance.popularPlans[index].internetPackage,
                            validationCode: Singleton
                                .instance.popularPlans[index].validationCode,
                            validity:
                                Singleton.instance.popularPlans[index].validity,
                            onPress:
                                Singleton.instance.popularPlans[index].onPress,
                          );
                        },
                      ),
                    ),
                    Container(
                      width: size.width,
                      height: 100,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      margin: const EdgeInsets.only(top: 16),
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 3.0,
                          ),
                        ],
                        color: AppColors.color.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Image.asset(
                                "assets/images/yellowsahp.png",
                              ),
                              Positioned(
                                left: 9,
                                top: 9,
                                child: CircleAvatar(
                                  backgroundColor: AppColors.color.white,
                                  child: CircleAvatar(
                                    backgroundColor: AppColors.color.red,
                                    radius: 16,
                                    child: Image.asset(
                                      "assets/icons/percentage.png",
                                      color: AppColors.color.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  const Text("New Offers"),
                                  const SizedBox(width: 16),
                                  Text(
                                    "Only for you, avail today",
                                    style: TextStyle(
                                      color: AppColors.color.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "02 Hrs 30 Min 54 Sec",
                                style: TextStyle(
                                  color: AppColors.color.red,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  SizedBox(
                    height: 40,
                    child: Container(
                      width: size.width,
                      color: AppColors.color.white,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: months.length,
                        itemBuilder: ((context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 16),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  currentIndex = index;
                                  print(index);
                                });
                              },
                              child: Text(
                                months[index],
                                style: TextStyle(
                                  color: currentIndex == index
                                      ? AppColors.color.red
                                      : AppColors.color.grey,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: size.width,
                      height: size.height * 0.38,
                      color: AppColors.color.white,
                      padding: const EdgeInsets.only(bottom: 16),
                      child: ListView.builder(
                        itemCount: Singleton.instance.popularPlans.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                width: size.width,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 10),
                                color: AppColors.color.white,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 60,
                                      color:
                                          AppColors.color.grey.withOpacity(0.1),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "${Singleton.instance.popularPlans[index].internetSpeed}",
                                            style: TextStyle(
                                              color: AppColors.color.blue,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 2),
                                          Text(
                                            "Mb/s",
                                            style: TextStyle(
                                              color: AppColors.color.blue,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(Singleton.instance.popularPlans[index].internetPackage),
                                        const SizedBox(height: 10),
                                        Text(Singleton.instance.popularPlans[index].validationCode),
                                      ],
                                    ),
                                    const Spacer(),
                                    TextButton(
                                      onPressed: (){},
                                      child: Text(
                                        "buy now >>",
                                        style: TextStyle(
                                          color: AppColors.color.darkGrey,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 36),
          ],
        ),
      ),
    );
  }

  List<String> months = [
    "1 month",
    "3 months",
    "6 months",
    "8 months",
    "10 months",
    "12 months",
  ];
}
