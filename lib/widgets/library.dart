import 'package:clone_spotify/assets.dart';
import 'package:clone_spotify/data/content.dart';
import 'package:flutter/material.dart';

class Library extends StatelessWidget {
  const Library({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 7,
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 17, 17, 17),
            borderRadius: BorderRadius.circular(8.0)),
        margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        _HoveredButton(
                          icon: Icons.library_books,
                          option: "My Library",
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        _HoveredButton(
                          icon: Icons.add,
                        ),
                        _HoveredButton(
                          icon: Icons.exit_to_app_outlined,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        _FilteredOption(
                            key: PageStorageKey("filtered0"),
                            content: "Playlist"),
                        _FilteredOption(
                            key: PageStorageKey("filtered1"),
                            content: "Artists"),
                        _FilteredOption(
                            key: PageStorageKey("filtered2"), content: "Album")
                      ],
                    )
                  ]),
                )),
            Expanded(
                flex: 8,
                child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListView.builder(
                      itemCount: forYouData.length,
                      itemBuilder: (context, index) => _MusicItem(
                        key: PageStorageKey("musicItem$index"),
                        content: forYouData[index],
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}

class _MusicItem extends StatefulWidget {
  final Content content;
  const _MusicItem({super.key, required this.content});

  @override
  State<_MusicItem> createState() => _MusicItemState();
}

class _MusicItemState extends State<_MusicItem> {
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

class _FilteredOption extends StatelessWidget {
  final String content;

  const _FilteredOption({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 29, 26, 26),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          content,
          style: const TextStyle(
              fontSize: 15.0, color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

class _HoveredButton extends StatefulWidget {
  final IconData icon;
  final String? option;
  const _HoveredButton({super.key, required this.icon, this.option});

  @override
  State<_HoveredButton> createState() => _HoveredButtonState();
}

class _HoveredButtonState extends State<_HoveredButton> {
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
      child: Row(
        children: [
          Icon(
            widget.icon,
            color: Colors.white,
          ),
          if (widget.option != null)
            const SizedBox(
              width: 10,
            ),
          if (widget.option != null)
            Text(
              widget.option!,
              style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: isHovered ? FontWeight.w700 : FontWeight.w600),
            )
        ],
      ),
    );
  }
}
