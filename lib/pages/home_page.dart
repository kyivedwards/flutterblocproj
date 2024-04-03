import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterblocproj/misc/colors.dart';
import 'package:flutterblocproj/widgets/app_large_text.dart';
import 'package:flutterblocproj/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {          //provide tab bar controller access
  var images = {
    "ballooning.png":"Ballooning",
    "hiking.png":"Hiking",
    "kayaking.png":"Kayaking",
    "snorkling.png":"Snorkling",
  };
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //menu text
          Container(
            padding: const EdgeInsets.only(top: 70, left: 20),
            child: Row(
              children: [
                Icon(Icons.menu, size: 30, color: Colors.black54),
                Expanded(child: Container()),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.5)
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20,),
          //title text
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: AppLargeText(text: "Discover"),
         ),
        SizedBox(height: 20,),
        //tab bar
        Container(
          child: Align(
            alignment: Alignment.center,
            child: TabBar(                                                            //Tab bar contains tabs
              labelPadding: const EdgeInsets.only(left: 20, right: 30),
              controller: _tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: CircleTabIndicator(color: AppColors.mainColor, radius: 4),
              tabs: [
                Tab(text: "Places"),
                Tab(text: "Inspiration"),
                Tab(text: "Emotions"),
              ]
            ),
          ),
        ),
        SizedBox(height: 25,),                                                          //added sized box 
        Container(
          padding: const EdgeInsets.only(left: 20),
          height: 300,
          width: double.maxFinite,
          child: TabBarView(
            controller: _tabController,
            children: [
              ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return
                  Container(
                    margin: const EdgeInsets.only(right: 15, top: 10),
                    width: 200,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage(
                          "img/mountain.jpeg"
                        ),
                       fit: BoxFit.cover,
                      )
                    ),
                  );
                },
              ),
              Text("There"),
              Text("Bye"),
            ],
          ),
        ),
        
        SizedBox(height: 40,),
        
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20,),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppLargeText(text: "Explore more", size: 22, color: Colors.black87,),
              AppText(text: "See all", color:AppColors.textColor1)
            ],
          ),
        ),

        SizedBox(height: 20,),
       
       Container(
          height: 150,
          width: double.maxFinite,
          margin: const EdgeInsets.only(left: 20),
          child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index){
            return Container(
              margin: EdgeInsets.only(right: 30),
              child: Column(
                children: [
                  Container(
                      margin: const EdgeInsets.only(right: 5,),
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage("img/"+images.keys.elementAt(index)),
                         fit: BoxFit.cover,
                        )
                      ),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    child: AppText(
                      text: images.values.elementAt(index), 
                      color: AppColors.textColor2,),
                  )
                ],
              ),
            );
          })
        )

        ],
      ),
    );
  }
}


class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color:color, radius:radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias=true;
    final Offset circleOffset = Offset(configuration.size!.width/2 - radius/2, configuration.size!.height-radius*2.5);              //Offset circle tab indicator to halfway through tab
    canvas.drawCircle(offset+circleOffset, radius, _paint);
    
  }
    
  }