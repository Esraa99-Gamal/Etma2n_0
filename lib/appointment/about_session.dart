
import 'package:etma2n/appointment/session_date.dart';
import 'package:etma2n/shared/component/components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import '../Settings/main_setting_page.dart';
import '../widgets/constant.dart';

//import 'session_date.dart';

class AboutSession extends StatefulWidget {
  final int docindex;
  static String id = 'AboutSession';

  const AboutSession({Key? key, required this.docindex,}) : super(key: key);

  @override
  _AboutSessionState createState() => _AboutSessionState();
}

class _AboutSessionState extends State<AboutSession> {

/*
                          //result= price/30
                          // if time 45  =>result= (.5*price+price)/45
                          // if time 60 =>result= 2*price/60
                          // => result * n_session
                          if(value=='30 دقيقة')
                            result=result;
                          else if(value=='60 دقيقة')
                            result=result*2;
                          else if(value=='45 دقيقة')
                            result=(result*1.5) as int;
                          print(result);
 */
  int price=250;
  String selectedDuration='30 دقيقة';
  late String times='1';
  List<String> items = ['30 دقيقه', '45 دقيقه', '60 دقيقه'];
  List<String> sessiontimes = ['1 جلسه','2 جلسه','4 جلسه','6 جلسه','8 جلسه'];
  late String? selectedGender = '30 دقيقه';
  late String? selectedTimes = '1 جلسه';
  late int res;
  int result=250;
  String time='30 دقيقه';

  @override
  Widget build(BuildContext context) {
    double height1 = MediaQuery.of(context).size.height;
    //double width1 = MediaQuery.of(context).size.width;

    return Directionality(
      textDirection: ui.TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(

          title: const Text(
            'جلسه جديدة',
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.menu,
              ),
              onPressed: () {
                navigateTo(context, const SettingScreen());
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                SizedBox(height: height1 * .25,),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 1,),
                  child: Material(
                    shadowColor: const Color(0xFF5271ff),
                    elevation: 8.5,
                    borderRadius: BorderRadius.circular(30),
                    child: DecoratedBox(
                      decoration: const ShapeDecoration(
                        color:  Colors.white54,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 2.0, style: BorderStyle.solid,
                              color: Color(0xFF5271ff)),
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: selectedGender!,
                          elevation: 10,
                          hint: Text('اختر مدة الجلسة',style: TextStyle(
                              color: Colors.grey[500],
                            fontWeight: FontWeight.w600,
                            fontSize: 20
                          ),),
                          icon: const Icon(Icons.arrow_drop_down,color: Colors.black,),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedGender = newValue!;
                            });
                            result=250;
                          if(selectedGender! ==items[0]){
                            result=result;
                            selectedDuration=items[0];
                          }
                          else if(selectedGender! ==items[2]){
                            result=result*2;
                            selectedDuration=items[2];
                          }
                          else if(selectedGender! ==items[1]){
                            result=(result+125);
                            selectedDuration=items[1];
                          }
                          price=result;
                          if (kDebugMode) {
                            print(price);
                          }
                          },
                          underline: const SizedBox(),
                          items: items
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: height1 * .051,),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 1,),
                  child: Material(
                    shadowColor: const Color(0xFF5271ff),
                    elevation: 8.0,
                    borderRadius: BorderRadius.circular(30),
                    child: DecoratedBox(
                      decoration: const ShapeDecoration(
                        color:  Colors.white54,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 2.0, style: BorderStyle.solid,
                              color: Color(0xFF5271ff)),
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: selectedTimes,
                          elevation: 10,
                          hint: Text('اختر عدد الجلسات',style: TextStyle(
                              color: Colors.grey[500],
                              fontWeight: FontWeight.w600,
                              fontSize: 20
                          ),
                          ),
                          icon: const Icon(Icons.arrow_drop_down,color: Colors.black,),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedTimes = newValue!;
                            });

                            if(selectedTimes==sessiontimes[0]){
                              times='1';
                              res=price  ;}
                            if(selectedTimes==sessiontimes[1]){
                              times='2';
                              res=(price*2) ;}
                            if(selectedTimes==sessiontimes[2]){
                              times='4';
                              res=(price*4) ;}
                            if(selectedTimes==sessiontimes[3]){
                              res=(price*6) ;
                              times='6';}
                            if(selectedTimes==sessiontimes[4]){
                              times='8';
                              res=(price*8);
                            }
                            price=res;
                            if (kDebugMode) {
                              print(price);
                            }
                            if (kDebugMode) {
                              print(times);
                            }
                          },
                          underline: const SizedBox(),
                          items: sessiontimes
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.only(right: 15, left: 8),
          decoration: BoxDecoration(
           // color: Colors.grey[100],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) =>
                        SessionDate(docindex: widget.docindex,result: result,
                          price: price, selectedDuration: selectedDuration,times: times,)),
                  );
                },
                color: Colors.indigoAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: const [
                    Text(
                      'التالي',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 18.5,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.download_done_outlined,
                      color: Colors.white,
                      // size: 15,
                    ),
                  ],
                ),
              ),
              const Spacer(),
//              SizedBox(width: 99,),
              Expanded(
                child: Text(
                  '$result ج.م / $selectedDuration',
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: Colors.indigoAccent),
                  // maxLines: 2,
                  // overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
