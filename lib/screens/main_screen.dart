import 'package:clone_spotify/bloc/recently_play_hover_cubit.dart';
import 'package:clone_spotify/bloc/scroll_cubit_cubit.dart';
import 'package:clone_spotify/bloc/selected_screen_cubit.dart';
import 'package:clone_spotify/widgets/responsive.dart';
import 'package:clone_spotify/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return const Responsive(
        mobile: _MainScreenMobile(), desktop: _MainScreenDesktop());
  }
}

class _MainScreenDesktop extends StatelessWidget {
  const _MainScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Row(children: [
          Expanded(
              flex: 2,
              child: Column(
                children: const [
                  MainRoute(
                    key: PageStorageKey("mainRoute"),
                  ),
                  Library(
                    key: PageStorageKey("libraryView"),
                  ),
                ],
              )),
          MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => ScrollCubit()),
                BlocProvider(create: (context) => RecentlyPlayHoverCubit())
              ],
              child: BlocBuilder<SelectedScreenCubit, int>(
                builder: (context, key) => Expanded(
                    flex: 7,
                    child: key == 0 ? const MainView() : const SearchView()),
              ))
        ]),
      ),
    );
  }
}

class _MainScreenMobile extends StatelessWidget {
  const _MainScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Column(children: [
          Expanded(
              child: Row(
            children: const [
              MainRoute(
                key: PageStorageKey("mainRoute"),
              ),
            ],
          )),
          MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => ScrollCubit()),
                BlocProvider(create: (context) => RecentlyPlayHoverCubit())
              ],
              child: BlocBuilder<SelectedScreenCubit, int>(
                builder: (context, key) => Expanded(
                    flex: 7,
                    child: key == 0 ? const MainView() : const SearchView()),
              ))
        ]),
      ),
    );
  }
}
