import 'package:flutter/material.dart';

import '../models/profile_data.dart';
import '../utilities/constantces.dart';
import '/models/connected_devices.dart';
import '/models/popular_plans.dart';
import '/models/internet_data.dart';
import '/models/internet_details.dart';

class Singleton {
  Singleton();
  static final Singleton instance = Singleton();

  List<PopularPlans> popularPlans = [
    PopularPlans(
      internetPackage: "Unlimited GB",
      validationCode: "LKR500",
      validity: 34,
      onPress: () {},
      internetSpeed: 120,
    ),
    PopularPlans(
      internetPackage: "10 GB",
      validationCode: "LKR449",
      validity: 34,
      onPress: () {},
      internetSpeed: 60,
    ),
    PopularPlans(
      internetPackage: "8 GB",
      validationCode: "LKR543",
      validity: 14,
      onPress: () {},
      internetSpeed: 60,
    ),
    PopularPlans(
      internetPackage: "6 GB",
      validationCode: "LKF249",
      validity: 10,
      onPress: () {},
      internetSpeed: 30,
    ),
    PopularPlans(
      internetPackage: "5 GB",
      validationCode: "LKS325",
      validity: 7,
      onPress: () {},
      internetSpeed: 12,
    ),
    PopularPlans(
      internetPackage: "2 GB",
      validationCode: "LCR438",
      validity: 4,
      onPress: () {},
      internetSpeed: 10,
    ),
    PopularPlans(
      internetPackage: "1 GB",
      validationCode: "LCR432",
      validity: 3,
      onPress: () {},
      internetSpeed: 6,
    ),
  ];

  List<InternetData> internetData = [
    InternetData(
      day: "Thursday, ",
      date: "Oct 31 - ",
      time: "5:34 PM",
      totalData: 10.0,
      dataUsed: 7.5,
      availableData: 2.5,
    ),
    InternetData(
      day: "Friday, ",
      date: "Sep 30 - ",
      time: "6:00 PM",
      totalData: 20.0,
      dataUsed: 13.5,
      availableData: 6.5,
    ),
    InternetData(
      day: "Sunday, ",
      date: "Aug 31 - ",
      time: "7:25 PM",
      totalData: 15.0,
      dataUsed: 7.5,
      availableData: 7.5,
    ),
    InternetData(
      day: "Sunday, ",
      date: "Aug 31 - ",
      time: "7:25 PM",
      totalData: 25.0,
      dataUsed: 19.5,
      availableData: 5.5,
    ),
  ];

  List<ConnectedDevices> connectedDevices = [
    ConnectedDevices(
      image: "assets/images/iphone.png",
      deviceType: "Mobile",
      deviceName: "iPhone",
      deviceId: "9518 6253 1223 DOXC",
    ),
    ConnectedDevices(
      image: "assets/images/mac.png",
      deviceType: "Laptop",
      deviceName: "Mac Book",
      deviceId: "6224 9544 1274 DOXC",
    ),
    ConnectedDevices(
      image: "assets/images/iwatch.png",
      deviceType: "Watch",
      deviceName: "iWatch",
      deviceId: "1265 7584 1264 DOXC",
    ),
  ];

  List<InternetDetails> internetDetails = [
    InternetDetails(
      icon: Icons.rss_feed,
      text: "Signal strength",
      value: 85,
      indicator: "%",
      bgColor: AppColors.color.red.withOpacity(0.1),
      borderColor: AppColors.color.red.withOpacity(0.4),
      foregroundColor: AppColors.color.red.withOpacity(0.6),
    ),
    InternetDetails(
      icon: Icons.signal_wifi_0_bar,
      text: "Ping rate",
      value: 14,
      indicator: "ms",
      bgColor: AppColors.color.blue.withOpacity(0.1),
      borderColor: AppColors.color.blue.withOpacity(0.4),
      foregroundColor: AppColors.color.blue.withOpacity(0.6),
    ),
    InternetDetails(
      icon: Icons.download_outlined,
      text: "Download speed",
      value: 210.8,
      indicator: "mb/s",
      bgColor: AppColors.color.white.withOpacity(0.1),
      borderColor: AppColors.color.yellow.withOpacity(0.4),
      foregroundColor: AppColors.color.yellow.withOpacity(0.6),
    ),
    InternetDetails(
      icon: Icons.upload_file_outlined,
      text: "Upload speed",
      value: 11.8,
      indicator: "mb/s",
      bgColor: AppColors.color.pink.withOpacity(0.1),
      borderColor: AppColors.color.pink.withOpacity(0.4),
      foregroundColor: AppColors.color.pink.withOpacity(0.6),
    ),
  ];

  List<ProfileData> profileData = [
    ProfileData(
      image: "assets/images/billsandpay.png",
      description: "Bills & Payments",
      onPress: (){},
    ),
    ProfileData(
      image: "assets/images/portalsettings.png",
      description: "Portal settings",
      onPress: (){},
    ),
    ProfileData(
      image: "assets/images/broadband.png",
      description: "Broadband settings",
      onPress: (){},
    ),
    ProfileData(
      image: "assets/images/support.png",
      description: "Support",
      onPress: (){},
    ),
    ProfileData(
      image: "assets/images/signout.png",
      description: "Signout",
      onPress: (){},
    ),
  ];
}
