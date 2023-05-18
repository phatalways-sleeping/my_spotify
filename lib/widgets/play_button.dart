import 'package:flutter/material.dart';

class PlayButton extends StatelessWidget {
  final bool isHoveredPlayedButton;
  final bool isPlayed;
  const PlayButton(
      {super.key, required this.isHoveredPlayedButton, required this.isPlayed});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isHoveredPlayedButton ? 60.0 : 50.0,
      width: isHoveredPlayedButton ? 60.0 : 50.0,
      margin: const EdgeInsets.only(right: 8.0),
      decoration:
          BoxDecoration(color: Colors.green[700], shape: BoxShape.circle),
      child: Icon(
        isPlayed ? Icons.pause : Icons.play_arrow,
        color: Colors.white,
        size: isHoveredPlayedButton ? 50.0 : 40.0,
      ),
    );
  }
}
