
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sorting_app/utils/colors.dart';
import 'package:sorting_app/views/sorting_page.dart';

const List algoList = [
  {
    "name": "Bubble Sort",
    "imgUrl": "assets/bubble.png",
    "type": "bubble"
  },
  {
    "name": "Selection Sort",
    "imgUrl": "assets/selection.png",
    "type": "selection"
  },
  {
    "name": "Insertion Sort",
    "imgUrl": "assets/insertion.png",
    "type": "insertion"
  },
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGreenishColor,
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                right: -14.w,
                top: 0.h,
                child: Image.asset('assets/peek.png'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 120.h,),
                    Text("Hello There,", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500, color: Colors.white, height: 0),),
                    Text("Welcome To", style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.w700, color: Colors.white, height: 0),),
                    Text("SortWiz!", style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.w700, color: Colors.white, height: 0),),
                    SizedBox(height: 60.h,),
                    Text('Select Any Algorithm', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500, color: Colors.white, height: 0),),
                    SizedBox(height: 5.h,),
                    Container(
                      height: 5.h,
                      width: 120.w,
                      color: kPurpleColor,
                    ),
                    SizedBox(height: 20.h,),
                    Expanded(
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 18.w,
                          mainAxisSpacing: 18.h,
                          mainAxisExtent: 250.h
                        ),
                        itemCount: algoList.length,
                        itemBuilder: (context, index) {
                          final mySort = algoList[index];
                          return InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SortingPage(sortTitle: mySort["name"], sortType: mySort["type"]),));
                            },
                            child: Card(
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(algoList[index]["imgUrl"])
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: EdgeInsets.all(16.h),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(30.r),
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                                            child: Container(
                                              height: 140.h,
                                              decoration: BoxDecoration(
                                                color: Colors.white.withOpacity(0.1),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: EdgeInsets.all(16.w),
                                        child: Text(algoList[index]["name"], style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold, color: Colors.white, height: 0,), textAlign: TextAlign.center,),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
