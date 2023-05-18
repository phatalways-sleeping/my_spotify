import 'package:clone_spotify/assets.dart';
import 'package:clone_spotify/bloc/recently_play_hover_cubit.dart';
import 'package:clone_spotify/data/content.dart';
import 'package:clone_spotify/widgets/content_list.dart';
import 'package:clone_spotify/widgets/responsive.dart';
import 'package:clone_spotify/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/scroll_cubit_cubit.dart';
import 'custom_app_bar.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  late ScrollController _controller;
  late TextEditingController _textController;

  @override
  void initState() {
    // TODO: implement initState
    _controller = ScrollController()
      ..addListener(() {
        BlocProvider.of<ScrollCubit>(context).changeOffset(_controller.offset);
      });
    _textController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Responsive(
        mobile: _MainViewMobile(
          width: width,
          controller: _controller,
          textController: _textController,
        ),
        desktop: _MainViewDesktop(
          width: width,
          controller: _controller,
          textController: _textController,
        ));
  }
}

class _MainViewDesktop extends StatelessWidget {
  final double width;
  final ScrollController controller;
  final TextEditingController textController;
  const _MainViewDesktop(
      {super.key,
      required this.width,
      required this.controller,
      required this.textController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecentlyPlayHoverCubit, int>(
        builder: (context, index) => Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
              child: Scaffold(
                extendBodyBehindAppBar: true,
                backgroundColor: const Color.fromARGB(255, 17, 17, 17),
                appBar: PreferredSize(
                    preferredSize: Size(width * 7 / 9, 200.0),
                    child: BlocBuilder<ScrollCubit, double>(
                      builder: (context, scrollOffset) => CustomAppBar(
                        controller: textController,
                        key: const PageStorageKey("customeAppBar"),
                        scrollOffset: scrollOffset,
                        mainColor: index == -1
                            ? null
                            : recentlyPlayed[index].mainColor,
                      ),
                    )),
                body: CustomScrollView(
                  key: const PageStorageKey("mainScrollView"),
                  controller: controller,
                  slivers: [
                    SliverToBoxAdapter(
                      child: Stack(
                        alignment: AlignmentDirectional.topStart,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            height: 200.0,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(15.0),
                                    topRight: Radius.circular(15.0)),
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.black.withOpacity(0.2),
                                      index != -1
                                          ? recentlyPlayed[index].mainColor!
                                          : const Color.fromARGB(
                                              255, 249, 127, 83)
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter)),
                          ),
                          Container(
                            height: 200.0,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15.0),
                                    topRight: Radius.circular(15.0))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                SizedBox(
                                  height: 70.0,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  child: Text("Have a good day!",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 35.0,
                                          fontWeight: FontWeight.w800)),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      sliver: SliverGrid(
                          delegate: SliverChildBuilderDelegate(
                              childCount: recentlyPlayed.length,
                              (context, index) => TrackItem(
                                    key: PageStorageKey("track$index"),
                                    image: recentlyPlayed[index].image,
                                    title: recentlyPlayed[index].title,
                                    mainColor: recentlyPlayed[index].mainColor!,
                                    index: index,
                                  )),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 10.0,
                                  crossAxisSpacing: 10.0,
                                  childAspectRatio: 4.0)),
                    ),
                    ContentList(
                        key: const PageStorageKey("forYou"),
                        featureList: forYouData,
                        title: "For You"),
                    ContentList(
                        key: const PageStorageKey("topPlaylists"),
                        featureList: forYouData,
                        title: "Your Top Playlists"),
                    ContentList(
                        key: const PageStorageKey("recentlyPlayed"),
                        featureList: forYouData,
                        title: "Recently Played"),
                    ContentList(
                        key: const PageStorageKey("yourFav"),
                        featureList: forYouData,
                        title: "More of Your Favorite"),
                    ContentList(
                        key: const PageStorageKey("recommendPod"),
                        featureList: forYouData,
                        title: "Recommended Podcasts"),
                  ],
                ),
              ),
            ));
  }
}

class _MainViewMobile extends StatelessWidget {
  final double width;
  final ScrollController controller;
  final TextEditingController textController;
  const _MainViewMobile(
      {super.key,
      required this.width,
      required this.controller,
      required this.textController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecentlyPlayHoverCubit, int>(
        builder: (context, index) => Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
              child: Scaffold(
                extendBodyBehindAppBar: true,
                backgroundColor: const Color.fromARGB(255, 17, 17, 17),
                appBar: PreferredSize(
                    preferredSize: Size(width * 7 / 9, 200.0),
                    child: BlocBuilder<ScrollCubit, double>(
                      builder: (context, scrollOffset) => CustomAppBar(
                        controller: textController,
                        key: const PageStorageKey("customeAppBar"),
                        scrollOffset: scrollOffset,
                        mainColor: index == -1
                            ? null
                            : recentlyPlayed[index].mainColor,
                      ),
                    )),
                body: CustomScrollView(
                  key: const PageStorageKey("mainScrollView"),
                  controller: controller,
                  slivers: [
                    SliverToBoxAdapter(
                      child: Stack(
                        alignment: AlignmentDirectional.topStart,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            height: 200.0,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(15.0),
                                    topRight: Radius.circular(15.0)),
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.black.withOpacity(0.2),
                                      index != -1
                                          ? recentlyPlayed[index].mainColor!
                                          : const Color.fromARGB(
                                              255, 249, 127, 83)
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter)),
                          ),
                          Container(
                            height: 200.0,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15.0),
                                    topRight: Radius.circular(15.0))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                SizedBox(
                                  height: 70.0,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  child: Text("Have a good day!",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 35.0,
                                          fontWeight: FontWeight.w800)),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    ContentList(
                        key: const PageStorageKey("forYou"),
                        featureList: forYouData,
                        title: "For You"),
                    ContentList(
                        key: const PageStorageKey("topPlaylists"),
                        featureList: forYouData,
                        title: "Your Top Playlists"),
                    ContentList(
                        key: const PageStorageKey("recentlyPlayed"),
                        featureList: forYouData,
                        title: "Recently Played"),
                    ContentList(
                        key: const PageStorageKey("yourFav"),
                        featureList: forYouData,
                        title: "More of Your Favorite"),
                    ContentList(
                        key: const PageStorageKey("recommendPod"),
                        featureList: forYouData,
                        title: "Recommended Podcasts"),
                  ],
                ),
              ),
            ));
  }
}
