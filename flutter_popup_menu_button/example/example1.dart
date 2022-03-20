import 'package:flutter/material.dart';
import 'package:flutter_popup_menu_button/menu_direction.dart';
import 'package:flutter_popup_menu_button/menu_icon.dart';
import 'package:flutter_popup_menu_button/menu_item.dart';
import 'package:flutter_popup_menu_button/popup_menu_button.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Align(
            alignment: Alignment.topLeft,
            child: FlutterPopupMenuButton(
              direction: MenuDirection.right,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white
              ),
              popupMenuSize: const Size(160,200),
              child: FlutterPopupMenuIcon(
                key: GlobalKey(),
                child: const Icon(Icons.more_vert),
              ),
              children: [
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
            ),
          ),
        ),
      ),
    );
  }

}