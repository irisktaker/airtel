import 'package:airtel/constantces.dart';
import 'package:flutter/material.dart';

class ShowBottomSheetForLanguages {
  Future showBottomSheetForLanguages(BuildContext context) {
    List<Map<String, dynamic>> languages = [
      {
        'icon': "assets/icons/en.png",
        'language': "English",
        'isSelect': true,
      },
      {
        'icon': "assets/icons/ch.png",
        'language': "Chinese",
        'isSelect': false,
      },
      {
        'icon': "assets/icons/ar.png",
        'language': "العربية",
        'isSelect': false,
      },
    ];

    Column languagesSelected({
      required String txt,
      required String icon,
      required Color bgColor,
      required Color color,
    }) {
      return Column(
        children: [
          CircleAvatar(
            backgroundColor: bgColor,
            child: Image.asset(
              icon,
              width: 24,
              height: 24,
            ),
            radius: 24,
          ),
          const SizedBox(height: 10),
          Text(
            txt,
            style: TextStyle(
              fontSize: 14,
              color: color,
            ),
          ),
        ],
      );
    }

    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      enableDrag: true,
      context: context,

      builder: (BuildContext context) {
        return Container(
          height: 180,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: AppColors.color.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(36),
              topRight: Radius.circular(36),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Select language",
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.color.darkGrey,
                ),
              ),
              const SizedBox(height: 26),
              SizedBox(
                height: 90,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemExtent: 120,
                  shrinkWrap: true,
                  itemCount: languages.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        // switch case ??
                        // setState((){

                        // });
                      },
                      child: languagesSelected(
                        txt: languages[index]['language'],
                        icon: languages[index]['icon'],
                        bgColor: languages[index]['isSelect']
                            ? AppColors.color.red.withOpacity(0.8)
                            : AppColors.color.red.withOpacity(0.2),
                        color: languages[index]['isSelect']
                            ? AppColors.color.red
                            : AppColors.color.darkGrey,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
