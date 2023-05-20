import 'package:flutter/material.dart';

import '../data/content.dart';


class MusicItem extends StatefulWidget {
  final Content content;
  const MusicItem({super.key, required this.content});

  @override
  State<MusicItem> createState() => _MusicItemState();
}

class _MusicItemState extends State<MusicItem> {
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
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 1.0),
          height: 70.0,
          
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: isHovered
                  ? const Color.fromARGB(255, 32, 32, 32)
                  : const Color.fromARGB(255, 17, 17, 17)),
          child: Row(
            children: [
              if (widget.content.role == Role.PLAYLIST)
                Image.asset(
                  widget.content.image,
                  height: 70.0,
                  fit: BoxFit.cover,
                ),
              if (widget.content.role == Role.ARTIST)
                CircleAvatar(
                  backgroundImage: AssetImage(widget.content.image),
                  radius: 35.0,
                ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.content.title,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 18.0)),
                      Text(widget.content.subTitle!,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontSize: 14.0))
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
