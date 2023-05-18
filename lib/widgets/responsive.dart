import 'package:flutter/widgets.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;
  const Responsive(
      {super.key, required this.mobile, this.tablet, required this.desktop});

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width > 1200;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width > 600 &&
      MediaQuery.of(context).size.width <= 1200;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= 600;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (isDesktop(context)) return desktop;
      if (isTablet(context)) return tablet ?? mobile;
      return mobile;
    });
  }
}
