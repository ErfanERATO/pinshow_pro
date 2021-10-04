import 'package:flutter/material.dart';
import 'package:pinshow_pro/size_config.dart';

class LanguageOption extends StatelessWidget {
  const LanguageOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getScreenWidth(double.infinity),
      decoration: const BoxDecoration(
        color: Color(0xff5c6ccd),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  const Text(
                    'به پین‌شو خوش‌آمدید',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily:
                            ("assets/fonts/farsi/Vazir-Bold-FD-WOL.ttf"),
                        fontSize: 28),
                  ),
                  const Text(
                    'زبان برنامه را مشخص کنید',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily:
                            ("assets/fonts/farsi/Vazir-Medium-FD-WOL.ttf"),
                        fontSize: 18),
                  ),
                  
                  Padding(
                    padding: EdgeInsets.all(26),
                    child: Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            TextButton(child: const Text("English",style: TextStyle(color: Colors.white,fontSize: 17),),onPressed: (){},),
                            Divider(height: getScreenHeight(10),color: Colors.white,),
                            TextButton(child: const Text("فارسی",style: TextStyle(color: Colors.white,fontSize: 17),),onPressed: (){})
                          ],
                        ),

                        // SizedBox(width: getScreenWidth(40)),
                        //
                        // Column(
                        //   children: <Widget>[
                        //     TextButton(child: Text("Deutsch",style: TextStyle(color: Colors.white,fontSize: 17),),onPressed: (){}),
                        //     Divider(height: getScreenHeight(10),color: Colors.white,),
                        //     TextButton(child: Text("Turkish",style: TextStyle(color: Colors.white,fontSize: 17),),onPressed: (){})
                        //   ],
                        // ),

                        // SizedBox(width: getScreenWidth(35)),

                        // Column(
                        //   children: <Widget>[
                        //     TextButton(child: Text("فارسی‌دری",style: TextStyle(color: Colors.white,fontSize: 17),),onPressed: (){}),
                        //     Divider(height: getScreenHeight(10),color: Colors.white,),
                        //     TextButton(child: Text("Arabic",style: TextStyle(color: Colors.white,fontSize: 17),),onPressed: (){})
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
