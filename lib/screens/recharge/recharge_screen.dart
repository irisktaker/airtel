import 'package:airtel/utilities/constantces.dart';
import 'package:airtel/widgets/new_offers.dart';
import 'package:flutter/material.dart';

class RechargeScreen extends StatelessWidget {
  const RechargeScreen({Key? key}) : super(key: key);

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
                      )),
                ),
                Container(
                  width: size.width,
                  height: size.height * 0.18,
                  margin: const EdgeInsets.symmetric(vertical: 16),
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
                ),
                Container(
                  width: size.width,
                  height: size.height * 0.18,
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
