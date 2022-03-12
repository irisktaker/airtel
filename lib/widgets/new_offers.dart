import 'dart:async';

import 'package:flutter/material.dart';
import '/utilities/constantces.dart';

class NewOfferCard extends StatefulWidget {
  const NewOfferCard({Key? key}) : super(key: key);

  @override
  State<NewOfferCard> createState() => _NewOfferCardState();
}

class _NewOfferCardState extends State<NewOfferCard> {
  var localDate = DateTime(2022, 3, 12, 02, 30, 53);
  Timer? timer;

  @override
  void initState() {
    setState(() {
      timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
        localDate = DateTime(localDate.year, localDate.month, localDate.day,
            localDate.hour, localDate.minute, localDate.second - 1);

        if (localDate.hour == 0 &&
            localDate.minute == 0 &&
            localDate.second == 0) {
          timer!.cancel();
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: 100,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
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
                "${localDate.hour} Hrs ${localDate.minute} Min ${localDate.second} Sec",
                style: TextStyle(
                  color: AppColors.color.red,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
