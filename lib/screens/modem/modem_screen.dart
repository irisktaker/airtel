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
            height: size.height * 0.46,
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
              ],
            ),
          ),
          Container(
            width: size.width,
            height: size.height * 0.32,
            padding: const EdgeInsets.all(16),
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
                                  Text(Singleton.instance
                                      .connectedDevices[index].deviceId,
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
                                    color: Singleton.instance.connectedDevices[index]
                                              .isConnect ? AppColors.color.darkGrey : AppColors.color.red,
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
                const Divider(height: 2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
