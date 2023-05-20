import 'package:clone_spotify/assets.dart';
import 'package:clone_spotify/bloc/scroll_cubit_cubit.dart';
import 'package:clone_spotify/bloc/selected_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAppBar extends StatefulWidget {
  final double scrollOffset;
  final Color? mainColor;
  final Color? defaultColor;
  final TextEditingController controller;
  const CustomAppBar(
      {super.key,
      required this.scrollOffset,
      this.mainColor,
      required this.controller,
      this.defaultColor});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 70.0,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
        color: widget.mainColor != null
            ? widget.mainColor!
                .withOpacity((widget.scrollOffset / 350).clamp(0, 1).toDouble())
            : widget.defaultColor != null
                ? widget.defaultColor!.withOpacity(
                    (widget.scrollOffset / 350).clamp(0, 1).toDouble())
                : const Color.fromARGB(255, 249, 127, 83).withOpacity(
                    (widget.scrollOffset / 350).clamp(0, 1).toDouble()),
      ),
      child: Row(children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _CustomButton(
                icon: Icons.navigate_before_sharp,
                onTap: () => print("Back"),
              ),
              _CustomButton(
                icon: Icons.navigate_next_sharp,
                onTap: () => print("Next"),
              ),
              if (BlocProvider.of<SelectedScreenCubit>(context).state == 1)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Form(
                        child: TextFormField(
                      controller: widget.controller,
                      style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          overflow: TextOverflow.fade),
                      decoration: InputDecoration(
                          prefixIconConstraints: const BoxConstraints(
                              minHeight: 35.0, minWidth: 35.0),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 117, 115, 115)
                              .withOpacity(0.5),
                          prefixIcon: const Icon(Icons.search),
                          prefixIconColor: Colors.black,
                          constraints: const BoxConstraints(
                              minHeight: 40.0, maxHeight: 40.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0))),
                    )),
                  ),
                )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            _ActionButton(
                content: "Upgrade to Premium",
                bgColor: Colors.white,
                contentColor: Colors.black),
            _ActionButton(
              content: "Download Spotify",
              bgColor: Colors.black,
              contentColor: Colors.white,
              icon: Icons.downloading_sharp,
            ),
            _CustomProfileIcon(
              image: Assets.facebookLogo,
            )
          ],
        )
      ]),
    );
  }
}

class _CustomProfileIcon extends StatelessWidget {
  final String? image;

  const _CustomProfileIcon({super.key, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        alignment: Alignment.center,
        height: 35.0,
        width: 35.0,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: image != null ? null : Colors.black.withOpacity(0.6)),
        child: image != null
            ? Image.asset(
                image!,
                width: 35.0,
                height: 35.0,
                fit: BoxFit.cover,
              )
            : const Icon(
                Icons.account_box,
                color: Colors.white,
                size: 35.0,
              ));
  }
}

class _ActionButton extends StatefulWidget {
  final String content;
  final Color bgColor;
  final Color contentColor;
  final IconData? icon;
  final void Function()? onTap;
  const _ActionButton(
      {super.key,
      required this.content,
      this.icon,
      this.onTap,
      required this.bgColor,
      required this.contentColor});

  @override
  State<_ActionButton> createState() => __ActionButtonState();
}

class __ActionButtonState extends State<_ActionButton> {
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
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          alignment: Alignment.center,
          height: 35.0,
          decoration: BoxDecoration(
              color: widget.bgColor, borderRadius: BorderRadius.circular(10.0)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              if (widget.icon != null)
                Icon(
                  widget.icon,
                  size: 20.0,
                  color: widget.contentColor,
                ),
              if (widget.icon != null)
                const SizedBox(
                  width: 10.0,
                ),
              Text(
                widget.content,
                style: TextStyle(
                    color: widget.contentColor,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w800),
              )
            ]),
          ),
        ),
      ),
    );
  }
}

class _CustomButton extends StatefulWidget {
  final IconData icon;
  final void Function()? onTap;
  const _CustomButton({super.key, required this.icon, this.onTap});

  @override
  State<_CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<_CustomButton> {
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
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          height: 40.0,
          width: 40.0,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: !isHovered ? Colors.black.withOpacity(0.3) : Colors.white),
          child: Align(
            alignment: AlignmentDirectional.center,
            child: Icon(
              widget.icon,
              size: 35.0,
              color: isHovered ? Colors.black : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
