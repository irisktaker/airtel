import 'package:airtel/models/popular_plans.dart';

class Singleton {
  Singleton();
  static final Singleton instance = Singleton();

  List<PopularPlans> popularPlans = [
    PopularPlans(
      internetPackage: "Unlimited GB",
      validationCode: "LKR500",
      validity: 34,
      onPress: (){},
      internetSpeed: 120,
    ),
    PopularPlans(
      internetPackage: "10 GB",
      validationCode: "LKR449",
      validity: 34,
      onPress: (){},
      internetSpeed: 60,
    ),
    PopularPlans(
      internetPackage: "8 GB",
      validationCode: "LKR543",
      validity: 14,
      onPress: (){},
      internetSpeed: 60,
    ),
    PopularPlans(
      internetPackage: "6 GB",
      validationCode: "LKF249",
      validity: 10,
      onPress: (){},
      internetSpeed: 30,
    ),
    PopularPlans(
      internetPackage: "5 GB",
      validationCode: "LKS325",
      validity: 7,
      onPress: (){},
      internetSpeed: 12,
    ),
    PopularPlans(
      internetPackage: "2 GB",
      validationCode: "LCR438",
      validity: 4,
      onPress: (){},
      internetSpeed: 10,
    ),
    PopularPlans(
      internetPackage: "1 GB",
      validationCode: "LCR432",
      validity: 3,
      onPress: (){},
      internetSpeed: 6,
    ),
  ];
}
