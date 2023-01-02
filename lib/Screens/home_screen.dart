import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/size/gf_size.dart';
import 'package:searchbar_animation/searchbar_animation.dart';

import 'package:ustad_g/Screens/details_screen.dart';

import '../Model/Controller/controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    final _homeScreenController = HomeScreenController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15,right: 15,top: 50),
          child: Column(
            children: [

              Center(
                  child: Text('Professional Services at Your DoorStep',style: TextStyle(fontSize: 17,color: Color(0xfff591919),fontWeight: FontWeight.bold),)
              ),
              SizedBox(
                height: 10,
              ),
              // Serch bar animation
              Container(
                // height: 660.0,
                decoration: BoxDecoration(
                  // color: Colors.white.withOpacity(.8),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    SearchBarAnimation(
                      textEditingController: TextEditingController(),
                      isOriginalAnimation: true,
                      enableKeyboardFocus: true,
                      onExpansionComplete: () {
                        debugPrint(
                            'do something just after searchbox is opened.');
                      },
                      onCollapseComplete: () {
                        debugPrint(
                            'do something just after searchbox is closed.');
                      },
                      onPressButton: (isSearchBarOpens) {
                        debugPrint(
                            'do something before animation started. It\'s the ${isSearchBarOpens ? 'opening' : 'closing'} animation');
                      },
                      trailingWidget: const Icon(
                        Icons.search,
                        size: 20,
                        color: Colors.black,
                      ),
                      secondaryButtonWidget: const Icon(
                        Icons.close,
                        size: 20,
                        color: Colors.black,
                      ),
                      buttonWidget: const Icon(
                        Icons.search,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              //product cards
              Expanded(
                child: GridView.builder(
                    gridDelegate:  SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: (165 / 260),
                    ),

                    itemCount: _homeScreenController.modelData.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xfff591919),width: 1.5.w),
                          borderRadius: BorderRadius.all(Radius.circular(10)),

                        ),
                        height: 250.h,
                        width: 160.w,
                        // color: Colors.blue,
                        child: Column(
                          children: [
                            SizedBox(height: 13.h,),
                            Image.asset(_homeScreenController.modelData[index].image.toString(),height: 120,),
                            SizedBox(
                              height: 10,
                            ),
                            Text(_homeScreenController.modelData[index].name.toString(),style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                            Text(_homeScreenController.modelData[index].price.toString(),style: TextStyle(fontSize: 17,),),
                            Text('(Starting From)',style: TextStyle(fontSize: 12,),),
                            GFButton(
                              size: GFSize.SMALL,
                              color: Color(0xfff591919),
                              onPressed: (){
                                // print(_homeScreenController.modelData[index].name);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const DetailsScreen()),
                                );
                              },
                              text:"Select",
                            ),
                          ],
                        ),
                      );
                    }),
              ),


    ],
          ),
        ),
        ),
      );
  }
}
