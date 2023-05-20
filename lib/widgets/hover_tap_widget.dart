import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HoverTapWidget extends StatefulWidget {
  final Widget widget;
  final void Function()? onTap;
  const HoverTapWidget({super.key, required this.widget, this.onTap});

  @override
  State<HoverTapWidget> createState() => _HoverTapWidgetState();
}

class _HoverTapWidgetState extends State<HoverTapWidget> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) => setState(() {
        isHovered = true;
      }),
      onExit: (event) => setState(() {
        isHovered = false;
      }),
      child: GestureDetector(
        onTap: widget.onTap,
        child: widget.widget,
      ),
    );
  }
}
