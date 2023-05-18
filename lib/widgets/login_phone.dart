import 'package:clone_spotify/assets.dart';
import 'package:clone_spotify/route.dart';
import 'package:flutter/material.dart';

class LoginPhone extends StatelessWidget {
  const LoginPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40.0),
        constraints: const BoxConstraints(maxHeight: 800.0),
        child: Column(
          children: const [
            Expanded(
                flex: 4,
                child: _LoginPhoneHeader(
                    backgroundImage: Assets.loginBG,
                    titleImage: Assets.loginTitle)),
            Expanded(
              flex: 3,
              child: _ContentBody(),
            )
          ],
        ),
      ),
    );
  }
}

class _LoginPhoneHeader extends StatelessWidget {
  final String backgroundImage;
  final String titleImage;

  const _LoginPhoneHeader(
      {super.key, required this.backgroundImage, required this.titleImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 560.0,
      height: 400.0,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        image: DecorationImage(
            image: AssetImage(backgroundImage), fit: BoxFit.cover),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Image.asset(
          titleImage,
          width: 350.0,
        ),
      ),
    );
  }
}

class _ContentBody extends StatelessWidget {
  const _ContentBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.black),
      width: 560.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _CustomButton(
            description: "Continue with phone number",
            onTap: () => print("Phone number"),
          ),
          _CustomButton(
            description: "Continue with Google",
            icon: Assets.googleLogo,
            onTap: () => print("Google"),
          ),
          _CustomButton(
            description: "Continue with Facebook",
            icon: Assets.facebookLogo,
            onTap: () => print("Facebook"),
          ),
          _CustomButton(
            description: "Free Access",
            onTap: () => Navigator.of(context).pushNamed(RouteGenerator.home),
          ),
        ],
      ),
    );
  }
}

class _CustomButton extends StatefulWidget {
  final String description;
  String? icon;
  final void Function()? onTap;

  _CustomButton(
      {super.key, required this.description, this.icon, required this.onTap});

  @override
  State<_CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<_CustomButton> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    double buttonHeight = height > 650.0 ? 50 : 30;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ElevatedButton.icon(
            style: ButtonStyle(
                shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)))),
                backgroundColor: const MaterialStatePropertyAll(Colors.black),
                fixedSize: MaterialStatePropertyAll(Size(350, buttonHeight)),
                side: const MaterialStatePropertyAll(BorderSide(
                  color: Colors.white,
                  width: 0.6,
                  style: BorderStyle.solid,
                ))),
            onPressed: widget.onTap,
            icon: widget.icon != null
                ? Image.asset(
                    widget.icon!,
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  )
                : const Icon(Icons.phone),
            label: Text(
              widget.description,
              style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            )),
      ),
    );
  }
}
