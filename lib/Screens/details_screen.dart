import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/size/gf_size.dart';


import '../Model/Controller/controller.dart';
import 'add_service.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final _ProductsController = ProductsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15,right: 15,top: 50),
          child: Column(
            children: [
              Text('Safe & Tracked, At home Service, by Experted,Services with Every Deal',style: TextStyle(fontSize: 17,color: Color(0xfff591919),fontWeight: FontWeight.bold),),
              SizedBox(
                height: 30,
              ),


              //product cards
              Expanded(
                child: GridView.builder(
                    gridDelegate:  SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: (165 / 300),
                    ),

                    itemCount: _ProductsController.modelData.length,
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
                            Image.asset(_ProductsController.modelData[index].image.toString(),height: 120,),
                            SizedBox(
                              height: 10,
                            ),
                            Text(_ProductsController.modelData[index].name.toString(),style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                            Text(_ProductsController.modelData[index].price.toString(),style: TextStyle(fontSize: 17,),),

                            GFButton(
                              size: GFSize.SMALL,
                              color: Color(0xfff591919),
                              onPressed: (){
                                // print(_homeScreenController.modelData[index].name);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const AddService()),
                                );
                              },
                              text:"Book Now",
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
