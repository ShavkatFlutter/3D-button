import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final Widget text;
  final void Function()? onTap;
  final Color color;

  const Button({
    super.key,
    required this.text, required this.onTap, required this.color,
  });

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  static const double _shadowHeight = 5;
  double _positioned = 5;
  late int count = 0;

  @override
  Widget build(BuildContext context) {
    const double _height = 64 - _shadowHeight;
    return GestureDetector(
      onTapUp: (_) {
        setState(() {
          _positioned = 5;
        });
      },
      onTapDown: (_) {
        setState(() {
          _positioned = 0;
        });
      },
      onTapCancel: () {
        setState(() {
          _positioned = 5;
        });
      },
      onTap: widget.onTap,
      child: Container(
        height: _height + _shadowHeight,
        width: 200,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                height: _height,
                width: 200,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                ),
              ),
            ),
            AnimatedPositioned(
              curve: Curves.easeIn,
              bottom: _positioned,
              duration: const Duration(milliseconds: 70),
              child: Container(
                height: _height,
                width: 200,
                decoration: BoxDecoration(
                  color: widget.color,
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                ),
                child: Center(
                  child: widget.text,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
