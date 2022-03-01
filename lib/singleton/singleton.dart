import 'package:airtel/models/popular_plans.dart';

class Singleton {
  Singleton();
  static final Singleton instance = Singleton();

  List<PopularPlans> popularPlans = [
    PopularPlans(
      internetPackage: "10 GB",
      validationCode: "LKR449",
      validity: 34,
      onPress: (){},
    ),
    PopularPlans(
      internetPackage: "8 GB",
      validationCode: "LKR543",
      validity: 14,
      onPress: (){},
    ),
    PopularPlans(
      internetPackage: "6 GB",
      validationCode: "LKF249",
      validity: 10,
      onPress: (){},
    ),
    PopularPlans(
      internetPackage: "5 GB",
      validationCode: "LKS325",
      validity: 7,
      onPress: (){},
    ),
    PopularPlans(
      internetPackage: "2 GB",
      validationCode: "LCR438",
      validity: 4,
      onPress: (){},
    ),
    PopularPlans(
      internetPackage: "1 GB",
      validationCode: "LCR432",
      validity: 3,
      onPress: (){},
    ),
  ];
}
