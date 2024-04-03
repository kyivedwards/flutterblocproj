import 'package:flutter/material.dart';
import 'package:flutterblocproj/misc/colors.dart';
import 'package:flutterblocproj/widgets/app_large_text.dart';
import 'package:flutterblocproj/widgets/app_text.dart';
import 'package:flutterblocproj/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "welcome-one.png",
    "welcome-two.png",
    "welcome-three.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder: (_, index){             //Create custom sliding capabilities
        return Container(
          width: double.maxFinite,           //Arrange height and width to take up full screen
          height: double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "img/"+images[index]
              ),
              fit: BoxFit.cover              //Fit to cover entire screen
            )
          ),
          child: Container(
            margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
            child: Row(
              mainAxisAlignment:  MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,               //Align all widgets in column
                  children: [
                    AppLargeText(text: "Trips"),                              //Large text widget used for consistency and reusability
                    AppText(text: "Mountain", size: 28),
                    SizedBox(height: 20,),
                    Container(
                      width: 250,
                      child: AppText(
                        text: "Mountain hikes give you an incredible sense of freedom, along with endurance testing.",
                        color: AppColors.textColor2,
                        size: 18,
                      )
                    ),
                    SizedBox(height: 40,),
                    ResponsiveButton(width: 120,)
                  ],
                ),
                Column(                                                               //Building custom slider
                  children: List.generate(3, (indexDots){
                    return Container(
                      margin: const EdgeInsets.only(bottom: 2),
                      width: 8,
                      height: index==indexDots?25:8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: index==indexDots?AppColors.mainColor:AppColors.mainColor.withOpacity(0.3)
                      ),
                    );
                  }),
                )
              ],
            ),
         ),
        );
      }),
    );
  }
}