import 'package:airtel/singleton/singleton.dart';
import 'package:airtel/utilities/constantces.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 215, 237, 250),
      body: ListView(
        children: [
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            color: AppColors.color.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Subscribe ID",
                  style: TextStyle(
                    color: AppColors.color.grey,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "1598 2364 8564 2456 159",
                  style: TextStyle(
                    color: AppColors.color.darkGrey,
                    fontSize: 14,
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                  height: 30,
                ),
                Text(
                  "Upcoming billing date",
                  style: TextStyle(
                    color: AppColors.color.grey,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "5 Nov, 2020",
                      style: TextStyle(
                        color: AppColors.color.darkGrey,
                        fontSize: 14,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "more details >>",
                        style: TextStyle(
                          color: AppColors.color.red,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: size.height * 0.60,
            child: ListView.builder(
                itemCount: Singleton.instance.profileData.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(16),
                    margin:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                    decoration: BoxDecoration(
                      color: AppColors.color.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColors.color.red.withOpacity(0.1),
                          radius: 20,
                          child: Image.asset(
                            Singleton.instance.profileData[index].image,
                            scale: 0.7,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(Singleton.instance.profileData[index].description),
                        const Spacer(),
                        SizedBox(
                          width: 20,
                          height: 28,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: AppColors.color.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
