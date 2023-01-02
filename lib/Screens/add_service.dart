import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddService extends StatefulWidget {
  const AddService({Key? key}) : super(key: key);

  @override
  State<AddService> createState() => _AddServiceState();
}

class _AddServiceState extends State<AddService> {
  String? selectedValue = null;
  final _dropdownFormKey = GlobalKey<FormState>();
//Time
  TimeOfDay selectedTime = TimeOfDay.now();
  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,

    );
    if(timeOfDay != null && timeOfDay != selectedTime)
    {
      setState(() {
        selectedTime = timeOfDay;
      });
    }
  }
//Calaneder
  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title:Text('Add Service',style: TextStyle(color: Colors.black),),
      iconTheme: IconThemeData(
          color: Colors.black
      ),
      backgroundColor: Colors.white,
    ),
    body:Padding(
      padding: const EdgeInsets.only(top: 40),
      child: SingleChildScrollView(
        child: Column(

          children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 180),
                    child: Text('Service Required',style: TextStyle(fontSize: 18),),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    color: Color(0xfffd6d6d6),
                    height: 40.h,
                    width: 310.w,

                  child:  Padding(
                    padding: const EdgeInsets.only(top: 10,left: 10),
                    child: Text('Deal Package #01',style: TextStyle(fontSize: 18)),
                  ),
                  ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(right: 170),
              child: Text('Services Charges',style: TextStyle(fontSize: 18)),
            ),
            SizedBox(height: 10,),
            Container(
              color: Color(0xfffd6d6d6),
              height: 100.h,
              width: 310.w,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Rs.499',style: TextStyle(fontSize: 18,color: Colors.blue)),
                      Text('Fixed'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Text('( Details is the proces car mechaninc is same prodc to produce to sht cline advande )'),
                ),
              ],),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 180,left: 15),
              child: Text('Services Charges',style: TextStyle(fontSize: 18)),
            ),
            Padding(
              padding: const EdgeInsets.only(left:20.0,right:20),
              child: Card(
                  color: Color(0xfffd6d6d6),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      maxLines: 5, //or null
                      decoration: InputDecoration.collapsed(hintText: "Enter Your Adress"),
                    ),
                  )
              ),
            ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(right: 150,),
                      child: Text('Select Service Type:',style: TextStyle(fontSize: 18),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3,left: 20,right: 20),
                      child: Form(
                      key: _dropdownFormKey,
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    DropdownButtonFormField(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xfffd6d6d6), width: 1),
              borderRadius: BorderRadius.circular(20),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xfffd6d6d6), width:1),
              borderRadius: BorderRadius.circular(20),
            ),
            filled: true,
            fillColor:  Color(0xfffd6d6d6),
          ),
          validator: (value) => value == null ? "Select a country" : null,
          dropdownColor: Color(0xfffd6d6d6),
          value: selectedValue,
          onChanged: (String? newValue) {
            setState(() {
              selectedValue = newValue!;
            });
            },
          items: dropdownItems),
    ],
    )),
                    ),
     Padding(
         padding: const EdgeInsets.only(left: 30,top: 10,bottom: 4),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: [
           Text('Date',style: TextStyle(fontSize: 18),),
           Text('Service time',style: TextStyle(fontSize: 18),)
         ],),
     ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () => _selectDate(context),
              child: Container(
                height: 40,
                width: 130,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),


                child:Center(child: Text("${selectedDate.toLocal()}".split(' ')[0],style: TextStyle(fontSize: 20,color: Colors.white),)),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _selectTime(context);
              },
              child:  Text("${selectedTime.hour}:${selectedTime.minute}"),),





        ],),

            Padding(
              padding: const EdgeInsets.only(right: 200,top: 10,left: 10),
              child: Text('Service Details',style: TextStyle(fontSize: 18),),
            ),
            Padding(
              padding: const EdgeInsets.only(left:20.0,right:20),
              child: Card(
                  color: Color(0xfffd6d6d6),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      maxLines: 5, //or null
                      decoration: InputDecoration.collapsed(hintText: "Wrtie Service Details"),
                    ),
                  )
              ),
            ),
            //Bottom button


          ],),
      ),
    ),
      bottomNavigationBar: Row(
        children: [
          Material(

            child: InkWell(
              onTap: () {
                //print('called on tap');
              },
              child: const SizedBox(
                height: kToolbarHeight,
                width: 100,
                child: Center(
                  child: Text(
                    'Cancel',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Material(

              child: InkWell(
                onTap: () {
                  //print('called on tap');
                },
                child: const SizedBox(
                  height: kToolbarHeight,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),);
  }
}

//dropdown items
List<DropdownMenuItem<String>> get dropdownItems{
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("Urgent (Need Today)"),value: "USA"),
    DropdownMenuItem(child: Text("Urgent (Need Today)"),value: "Canada"),

  ];
  return menuItems;
}

