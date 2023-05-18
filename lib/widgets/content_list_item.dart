import 'package:clone_spotify/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../data/data.dart';

class ContentListItem extends StatefulWidget {
  final Content content;
  const ContentListItem({super.key, required this.content});

  @override
  State<ContentListItem> createState() => _ContentListItemState();
}

class _ContentListItemState extends State<ContentListItem> {
  bool isHovered = false;
  bool isPlayed = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) => setState(() {
        isHovered = true;
      }),
      onExit: (event) => setState(() {
        isHovered = false;
      }),
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(microseconds: 300),
            height: 400.0,
            width: 200.0,
            margin: const EdgeInsets.only(right: 10.0, top: 10.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: !isHovered
                    ? const Color.fromARGB(255, 42, 41, 41).withOpacity(0.5)
                    : const Color.fromARGB(255, 88, 88, 88).withOpacity(0.5),
                borderRadius: BorderRadius.circular(10.0)),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 5.0, vertical: 5.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color:
                        const Color.fromARGB(255, 73, 71, 71).withOpacity(0.5),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      widget.content.image,
                      height: 180.0,
                      width: 180.0,
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      widget.content.title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: RichText(
                    text: TextSpan(
                        text: widget.content.artists
                            .reduce((value, element) => "$value, $element"),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10.0,
                            fontWeight: FontWeight.w500)),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            right: 25.0,
            child: GestureDetector(
              onTap: () => setState(() {
                isPlayed = !isPlayed;
              }),
              child: Align(
                alignment: AlignmentDirectional.center,
                child: PlayButton(
                    isHoveredPlayedButton: isHovered, isPlayed: isPlayed),
              ),
            ),
          )
        ],
      ),
    );
  }
}
