import 'package:clone_spotify/widgets/music_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../data/content.dart';

class BottomMusicDisplay extends StatefulWidget {
  final Content? content;
  const BottomMusicDisplay({super.key, required this.content});

  @override
  State<BottomMusicDisplay> createState() => _BottomMusicDisplayState();
}

class _BottomMusicDisplayState extends State<BottomMusicDisplay> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: 80.0,
      decoration: const BoxDecoration(color: Colors.black),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (widget.content != null)
            Expanded(flex: 1, child: MusicItem(content: widget.content!)),
          Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(
                          color: Colors.white,
                          size: 30.0,
                          Icons.shuffle_rounded),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Icon(
                            color: Colors.white,
                            size: 30.0,
                            Icons.skip_previous),
                      ),
                      Icon(
                          color: Colors.white,
                          size: 30.0,
                          Icons.play_arrow_rounded),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Icon(
                            color: Colors.white, size: 30.0, Icons.skip_next),
                      ),
                      Icon(
                          color: Colors.white,
                          size: 30.0,
                          Icons.repeat_one_rounded)
                    ],
                  ),
                  Container(
                    height: 2.5,
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    constraints:
                        const BoxConstraints(minWidth: 500.0, maxWidth: 800.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey),
                  )
                ],
              )),
          Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.lyrics,
                    size: 20.0,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Icon(
                      Icons.queue_music,
                      size: 20.0,
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    Icons.connected_tv_rounded,
                    size: 20.0,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Icon(Icons.volume_up, size: 20.0, color: Colors.white,),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
