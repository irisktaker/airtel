import 'package:flutter/material.dart';
import '/utilities/constantces.dart';

Container newOffersCard(Size size) {
    return Container(
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
                  );
  }