import 'package:clone_spotify/assets.dart';
import 'package:clone_spotify/widgets/responsive.dart';
import 'package:flutter/material.dart';

import '../widgets/login_phone.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return const Responsive(mobile: _LoginMobile(), desktop: _LoginDesktop());
  }
}

class _LoginDesktop extends StatelessWidget {
  const _LoginDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[800],
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Image.asset(
                    Assets.spotifyLogo0,
                    fit: BoxFit.cover,
                  ),
                )),
            const Expanded(
              flex: 1,
              child: LoginPhone(),
            )
          ],
        ));
  }
}

class _LoginMobile extends StatelessWidget {
  const _LoginMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[800],
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const <Widget>[
            LoginPhone(),
          ],
        ));
  }
}
