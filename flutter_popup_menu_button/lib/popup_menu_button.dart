import 'package:flutter_popup_menu_button/menu_direction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'menu_item.dart';
import 'menu_icon.dart';

class FlutterPopupMenuButton extends StatefulWidget {
  ///list of children to show in menu.
  final List<FlutterPopupMenuItem> children;
  final FlutterPopupMenuIcon child;
  final Size popupMenuSize;

  ///This defines the direction of menu opening.
  ///if the direction is provided then only the given direction will be considered.
  final MenuDirection direction;
  final BoxDecoration? decoration;
  final bool barrierDismissible;
  final EdgeInsets? margin;
  ///custom painter can be used to draw custom shape.
  final CustomPainter? customPainter;
  ///shiftX property can be used to shift the menu left and right.
  ///case 1: if the direction is left and shiftX is 10 it widget will shift 10 pixels to right.
  ///case 2: if the direction is right and shiftX is 10 it widget will shift 10 pixels to left.
  ///and it is similar for shiftY on y axis.
  final int shiftX;
  final int shiftY;
  const FlutterPopupMenuButton(
      {Key? key,
      required this.popupMenuSize,
      required this.children,
      required this.child,
      this.barrierDismissible = true,
      this.decoration,
      this.direction = MenuDirection.none,
        this.margin,
        this.shiftX=0,
        this.shiftY=0,
      this.customPainter})
      : super(key: key);

  @override
  State<FlutterPopupMenuButton> createState() => _FlutterPopupMenuButtonState();
}

class _FlutterPopupMenuButtonState extends State<FlutterPopupMenuButton> with SingleTickerProviderStateMixin{
  RenderBox? _childWidgetRenderBox;
  Offset? _childWidgetOffset;
  Size? _screenSize;
  double height =0,width=0;
 late Animation<double> _animation;
 late AnimationController _controller;
late MenuDirection currDirection;
  @override
  void initState() {
    super.initState();
    currDirection = widget.direction;
    _controller = AnimationController(vsync: this,duration: const Duration(milliseconds: 200),);
    _animation = Tween<double>(begin: 0,end:1.0).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));

  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          _childWidgetRenderBox = (widget.child.key)
              .currentContext!
              .findRenderObject() as RenderBox;
          _childWidgetOffset =
              _childWidgetRenderBox!.localToGlobal(Offset.zero);
          _screenSize = MediaQuery.of(context).size;
          showCupertinoDialog(
            useRootNavigator: true,
              barrierDismissible: widget.barrierDismissible,
              context: context,
              builder: (BuildContext context) {
                return getMenu();
              });
          _controller.forward(from: 0);
        },
        child: widget.child);
  }

  double? _getTopPosition() {
    double totalHeight = _childWidgetOffset!.dy +
        widget.popupMenuSize.height +
        _childWidgetRenderBox!.size.height;
    if (widget.direction == MenuDirection.bottom ||
        (widget.direction != MenuDirection.top &&
            totalHeight <= _screenSize!.height)) {
      currDirection = MenuDirection.bottom;
      return (_childWidgetOffset!.dy + _childWidgetRenderBox!.size.height+widget.shiftY);
    }
    currDirection = MenuDirection.top;
    return _childWidgetOffset!.dy -
        (widget.popupMenuSize.height + _childWidgetRenderBox!.size.height - widget.shiftY);
  }

  double? _getLeftPosition() {
    if ((widget.direction == MenuDirection.left && _childWidgetOffset!.dx - widget.popupMenuSize.width >= 0)) {
      return (_childWidgetOffset!.dx - widget.popupMenuSize.width+widget.shiftX);
    }
    if (widget.direction == MenuDirection.right) {
      return (_childWidgetOffset!.dx + _childWidgetRenderBox!.size.width - widget.shiftX);
    }
    return _childWidgetOffset!.dx;
  }

  Widget getMenu(){
    return WillPopScope(
      onWillPop: () async{
        return _controller.reverse(from:1).then((value){
          return true;
        });
      },
      child: Material(
        type: MaterialType.transparency,
        child: SizedBox(
          width: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                  top: _getTopPosition(),
                  left: _getLeftPosition(),
                  child: AnimatedBuilder(
                    animation: _animation,
                    builder: (BuildContext context,Widget? child){
                      return Transform.scale(
                        scaleY: _animation.value,
                        child: child,
                        alignment: currDirection == MenuDirection.top?Alignment.bottomCenter:Alignment.topCenter,
                      );
                    },
                    child: Container(
                        margin: widget.margin,
                        decoration: widget.decoration??const BoxDecoration(color: Colors.white),
                        height: widget.popupMenuSize.height,
                        width: widget.popupMenuSize.width,
                        child: widget.customPainter != null
                            ? CustomPaint(
                          painter: widget.customPainter,
                          child: ListView(
                            children: widget.children,
                          ),
                        )
                            : ListView(
                          children: widget.children,
                        )),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}



