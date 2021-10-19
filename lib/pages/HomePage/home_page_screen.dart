import 'package:flutter/material.dart';
import 'package:pinshow_pro/localization/language_constants.dart';
import 'package:pinshow_pro/pages/HomePage/components/body.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static String routeName = "/home_screen";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () {
              debugPrint("info_pressed");
            },
          ),
        ],
        title: Text(
          getTranslated(context, 'home_page_app_bar_title')!,
          style: const TextStyle(
            fontFamily: ("assets/fonts/farsi/IRANYekanMobileBold.ttf"),
            fontSize: 25,
          ),
        ),
        elevation: 0,
      ),
      //استفاده از استک برای قرار دادن شیپ دست ساز روی تمام آبجکت ها
      body: Stack(
        children: <Widget>[
          const Body(),
          Container(
            margin: const EdgeInsets.only(top: 628),
            width: size.width,
            height: 65,
            // color: Colors.indigo,
            child: Stack(
              children: <Widget>[
                CustomPaint(
                  size: Size(size.width, 65),
                  painter: BNBCustomPainter(),
                ),
                //ساخت دکمه شناور درخواست ردیابی
                Center(
                  heightFactor: 0.6,
                  child: FloatingActionButton(
                    child: const Icon(Icons.place),
                    backgroundColor: Colors.deepOrangeAccent,
                    onPressed: () {
                      debugPrint("Tracking request pressed");
                    },
                  ),
                ),
                //مرتب سازی و ساخت دکمه های اپ بار پایین
                SizedBox(
                  width: size.width,
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.settings, color: Colors.white),
                        onPressed: () {
                          debugPrint("settings pressed");
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.place, color: Colors.white),
                        onPressed: () {
                          debugPrint("place pressed");
                        },
                      ),
                      Container(
                        width: size.width * 0.20,
                      ),
                      IconButton(
                        icon: const Icon(Icons.message, color: Colors.white),
                        onPressed: () {
                          debugPrint("message pressed");
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.check_box_outlined,
                            color: Colors.white),
                        onPressed: () {
                          debugPrint("my places pressed");
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//ساخت شیپ دستی اپپ بار پایین صفحه
class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.indigo
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 20);

    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: const Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
