<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

FlutterPopupMenuButton is a widget used for a customizable popup menu button.

## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder. 

```dart
class Sample extends StatelessWidget {
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
          direction: MenuDirection.top,
          popupMenuSize: Size(100,120),
          children: const [
            FlutterPopupMenuItem(
              child:  Text(
                'Create Account',
              ),),
            FlutterPopupMenuItem(child:  Text(
              'Create Account',
            )),
            FlutterPopupMenuItem(child:  Text(
              'Create Account',
            )),
            FlutterPopupMenuItem(child:  Text(
              'Create Account',
            )),
            FlutterPopupMenuItem(child:  Text(
              'Create Account',
            )),
            FlutterPopupMenuItem(child:  Text(
              'Create Account',
            )),

          ],
          child:FlutterPopupMenuIcon(
            key:GlobalKey(debugLabel: 'CustomDropdown key'),
            child: const Text(
              'Create Account',
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
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more.
