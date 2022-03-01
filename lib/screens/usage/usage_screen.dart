import 'package:flutter/material.dart';

import '/utilities/constantces.dart';
import '/singleton/singleton.dart';
import '/widgets/popular_plans_card.dart';

class UsageScreen extends StatelessWidget {
  const UsageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 215, 237, 250),
      body: SafeArea(
        child: Padding(
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
                  height: 140,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: Singleton.instance.popularPlans.length,
                    itemBuilder: (context, index) {
                      return popularPlansCard(
                        size,
                        internetPackage: Singleton.instance.popularPlans[index].internetPackage,
                        validationCode: Singleton.instance.popularPlans[index].validationCode,
                        validity:  Singleton.instance.popularPlans[index].validity,
                        onPress: Singleton.instance.popularPlans[index].onPress,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  
}
