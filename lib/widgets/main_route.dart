import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/selected_screen_cubit.dart';

class MainRoute extends StatelessWidget {
  const MainRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 17, 17, 17),
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: Column(
            children: const [
              _RouteButton(
                icon: Icons.home,
                option: "Home",
                index: 0,
              ),
              _RouteButton(
                icon: Icons.search,
                option: "Search",
                index: 1,
              )
            ],
          ),
        ));
  }
}

class _RouteButton extends StatefulWidget {
  final IconData icon;
  final String option;
  final int index;
  const _RouteButton(
      {super.key,
      required this.icon,
      required this.option,
      required this.index});

  @override
  State<_RouteButton> createState() => _RouteButtonState();
}

class _RouteButtonState extends State<_RouteButton> {
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
        onTap: () => BlocProvider.of<SelectedScreenCubit>(context)
            .changeScreen(widget.index),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                widget.icon,
                color: Colors.white,
              ),
              const SizedBox(
                width: 40,
              ),
              Text(
                widget.option,
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: isHovered ||
                            BlocProvider.of<SelectedScreenCubit>(context)
                                    .state ==
                                widget.index
                        ? FontWeight.w700
                        : FontWeight.w500),
              )
            ],
          ),
        ),
      ),
    );
  }
}
