import 'package:flutter/material.dart';

import '../utilities/constantces.dart';

Widget popularPlansCard(
  Size size, {
  required String internetPackage,
  required String validationCode,
  required int validity,
  required VoidCallback onPress,
}) {
  return Column(
    children: [
      Container(
        width: size.width * 0.46,
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 12),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 28),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  internetPackage,
                  style: TextStyle(
                    color: AppColors.color.blue,
                    fontSize: 19,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  "per day",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.color.blue,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(validationCode),
                const SizedBox(width: 6),
                Text(
                  "Validity: $validity day",
                  style: TextStyle(
                    color: AppColors.color.grey,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(),
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                height: 28,
                child: TextButton(
                  onPressed: onPress,
                  child: Text(
                    "view detail >>",
                    style: TextStyle(
                      color: AppColors.color.red,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
