import 'package:flutter/material.dart';
import 'package:flutter_popup_menu_button/menu_direction.dart';
import 'package:flutter_popup_menu_button/menu_icon.dart';
import 'package:flutter_popup_menu_button/menu_item.dart';
import 'package:flutter_popup_menu_button/popup_menu_button.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: FlutterPopupMenuButton(
          shiftY: 10,
          customPainter:MyPainter(),
          decoration: const BoxDecoration(
              color: Colors.white
          ),
          direction: MenuDirection.bottom,
          popupMenuSize: const Size(130,120),
          children:  [
            FlutterPopupMenuItem(
                closeOnItemClick: false,
                child: ListTile(
                  title: const Text('List 1'),
                  leading: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        color: Colors.redAccent.withOpacity(0.3),
                        shape: BoxShape.circle
                    ),
                  ),
                )),
            FlutterPopupMenuItem(
                closeOnItemClick: false,
                child: ListTile(
                  title: const Text('List 2'),
                  leading: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.3),
                        shape: BoxShape.circle
                    ),
                  ),
                )),
            FlutterPopupMenuItem(
                child: ListTile(
                  title: const Text('List 3'),
                  leading: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.3),
                        shape: BoxShape.circle
                    ),
                  ),
                )),
            FlutterPopupMenuItem(
                child: ListTile(
                  title: const Text('List 4'),
                  leading: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        color: Colors.cyanAccent.withOpacity(0.3),
                        shape: BoxShape.circle
                    ),
                  ),
                ))
          ],
          child:FlutterPopupMenuIcon(
            key:GlobalKey(debugLabel: 'CustomDropdown key'),
            child: const Text(
              'Open Menu',
            ),
          ),

        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {


    Paint paint = Paint();
    paint.color = Colors.white;
    paint.strokeWidth = 3;
    paint.style = PaintingStyle.fill;

    Path path = Path();
    path.lineTo(size.width*0.1, 0);
    path.lineTo(size.width*0.15, -10);
    path.lineTo(size.width*0.2, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}