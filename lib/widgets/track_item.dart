import 'package:clone_spotify/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/recently_play_hover_cubit.dart';
import 'widgets.dart';

class TrackItem extends StatefulWidget {
  final String image;
  final String title;
  final Color mainColor;
  final int index;
  const TrackItem(
      {super.key,
      required this.image,
      required this.title,
      required this.mainColor,
      required this.index});

  @override
  State<TrackItem> createState() => _TrackItemState();
}

class _TrackItemState extends State<TrackItem> {
  bool isHovered = false;
  bool isPlayed = false;
  bool isHoveredPlayedButton = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) => setState(() {
        isHovered = true;
        BlocProvider.of<RecentlyPlayHoverCubit>(context)
            .setHoveredTrack(widget.index);
      }),
      onExit: (event) => setState(() {
        isHovered = false;
        BlocProvider.of<RecentlyPlayHoverCubit>(context).setHoveredTrack(-1);
      }),
      child: GestureDetector(
        onTap: () => print("Open track"),
        child: Container(
          height: 40.0,
          width: 70.0,
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: const BorderRadius.all(Radius.circular(3.0))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Image.asset(
                  widget.image,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      height: 90.0,
                      decoration: BoxDecoration(
                          color: isHovered
                              ? const Color.fromARGB(255, 160, 158, 158)
                                  .withOpacity(0.3)
                              : Colors.black.withOpacity(0.4)),
                      child: Row(children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Text(widget.title,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Responsive.isDesktop(context)
                                      ? 20.0
                                      : 15.0,
                                  fontWeight: FontWeight.w900)),
                        ),
                      ]),
                    ),
                    if (isHovered || isPlayed)
                      Align(
                        alignment: FractionalOffset.centerRight,
                        child: MouseRegion(
                          onHover: (event) => setState(() {
                            isHoveredPlayedButton = true;
                          }),
                          onExit: (event) => setState(() {
                            isHoveredPlayedButton = false;
                          }),
                          child: GestureDetector(
                            onTap: () => setState(() {
                              isPlayed = !isPlayed;
                            }),
                            child: PlayButton(
                                isHoveredPlayedButton: isHoveredPlayedButton,
                                isPlayed: isPlayed),
                          ),
                        ),
                      )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
