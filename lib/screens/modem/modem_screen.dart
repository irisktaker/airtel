import 'package:airtel/singleton/singleton.dart';
import 'package:airtel/utilities/constantces.dart';
import 'package:flutter/material.dart';

class ModemScreen extends StatefulWidget {
  const ModemScreen({Key? key}) : super(key: key);

  @override
  State<ModemScreen> createState() => _ModemScreenState();
}

class _ModemScreenState extends State<ModemScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 215, 237, 250),
      body: ListView(
        children: [
          Container(
            width: size.width,
            height: size.height * 0.47,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Katutara",
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.color.darkGrey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Change tower",
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.color.red,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Last updated on",
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.color.grey,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "1:15 PM, Fri, Nov 1,2020",
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.color.darkGrey,
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {},
                          child: CircleAvatar(
                            backgroundColor:
                                AppColors.color.red.withOpacity(0.20),
                            radius: 14,
                            child: Icon(
                              Icons.replay,
                              size: 20,
                              color: AppColors.color.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "Update every 50mins automatically",
                      style: TextStyle(
                        fontSize: 11,
                        color: AppColors.color.grey,
                      ),
                    ),
                  ],
                ),
                const Divider(),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      mainAxisExtent: 120,
                    ),
                    itemCount: Singleton.instance.internetDetails.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color:
                              Singleton.instance.internetDetails[index].bgColor,
                          border: Border.all(
                            color: Singleton
                                .instance.internetDetails[index].borderColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              Singleton.instance.internetDetails[index].icon,
                              color: Singleton.instance.internetDetails[index]
                                  .foregroundColor,
                              width: 24,
                              height: 24,
                            ),
                            Text(
                              Singleton.instance.internetDetails[index].text,
                              style: TextStyle(
                                color: AppColors.color.darkGrey,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  Singleton
                                      .instance.internetDetails[index].value
                                      .toString(),
                                  style: TextStyle(
                                      color: Singleton
                                          .instance
                                          .internetDetails[index]
                                          .foregroundColor,
                                      fontSize: 20),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  Singleton.instance.internetDetails[index]
                                      .indicator,
                                  style: TextStyle(
                                    color: Singleton.instance
                                        .internetDetails[index].foregroundColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: size.width,
            height: size.height * 0.32,
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: AppColors.color.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Connected Devices:",
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.color.darkGrey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 6),
                const Divider(height: 2),
                Expanded(
                  child: SizedBox(
                    child: ListView.builder(
                      itemCount: Singleton.instance.connectedDevices.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: size.width,
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 3),
                          color: AppColors.color.white,
                          child: Row(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.color.grey.withOpacity(0.1),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(Singleton.instance
                                        .connectedDevices[index].image),
                                    const SizedBox(height: 2),
                                    Text(
                                      Singleton.instance.connectedDevices[index]
                                          .deviceType,
                                      style: TextStyle(
                                        color: AppColors.color.darkGrey,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    Singleton.instance.connectedDevices[index]
                                        .deviceName,
                                    style: TextStyle(
                                      color: AppColors.color.darkGrey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    Singleton.instance.connectedDevices[index]
                                        .deviceId,
                                    style: TextStyle(
                                      color: AppColors.color.darkGrey,
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    Singleton.instance.connectedDevices[index]
                                            .isConnect =
                                        !Singleton.instance
                                            .connectedDevices[index].isConnect;
                                  });
                                },
                                child: Text(
                                  Singleton.instance.connectedDevices[index]
                                              .isConnect ==
                                          true
                                      ? "Connect"
                                      : "Disconnect",
                                  style: TextStyle(
                                    color: Singleton.instance
                                            .connectedDevices[index].isConnect
                                        ? AppColors.color.darkGrey
                                        : AppColors.color.red,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const Divider(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
