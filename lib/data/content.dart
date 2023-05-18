import 'package:clone_spotify/assets.dart';
import 'package:flutter/material.dart';

enum Role {
  ARTIST,
  PLAYLIST,
}

class Content {
  final Role role;
  final String title;
  final List<String> artists;
  final String image;
  final Color? mainColor;
  final String? subTitle;

  const Content(
      {required this.title,
      required this.image,
      required this.artists,
      this.mainColor,
      this.subTitle,
      required this.role});
}

final List<Content> forYouData = [
  const Content(
      role: Role.ARTIST,
      title: "Daily Mix 1",
      image: Assets.dailyMix,
      artists: ["Son Tung MTP, Adele, J.Cole, Ed Sheeran"],
      subTitle: "Artist"),
  const Content(
      role: Role.PLAYLIST,
      title: "Daily Mix 1",
      image: Assets.dailyMix,
      artists: ["Son Tung MTP, Adele, J.Cole, Ed Sheeran"],
      subTitle: "Artist"),
  const Content(
      role: Role.PLAYLIST,
      title: "Daily Mix 1",
      image: Assets.dailyMix,
      artists: ["Son Tung MTP, Adele, J.Cole, Ed Sheeran"],
      subTitle: "Artist"),
  const Content(
      role: Role.PLAYLIST,
      title: "Daily Mix 1",
      image: Assets.dailyMix,
      artists: ["Son Tung MTP, Adele, J.Cole, Ed Sheeran"],
      subTitle: "Artist"),
  const Content(
      role: Role.PLAYLIST,
      title: "Daily Mix 1",
      image: Assets.dailyMix,
      artists: ["Son Tung MTP, Adele, J.Cole, Ed Sheeran"],
      subTitle: "Artist"),
  const Content(
      role: Role.PLAYLIST,
      title: "Daily Mix 1",
      image: Assets.dailyMix,
      artists: ["Son Tung MTP, Adele, J.Cole, Ed Sheeran"],
      subTitle: "Artist"),
  const Content(
      role: Role.PLAYLIST,
      title: "Daily Mix 1",
      image: Assets.dailyMix,
      artists: ["Son Tung MTP, Adele, J.Cole, Ed Sheeran"],
      subTitle: "Artist"),
  const Content(
      role: Role.PLAYLIST,
      title: "Daily Mix 1",
      image: Assets.dailyMix,
      artists: ["Son Tung MTP, Adele, J.Cole, Ed Sheeran"],
      subTitle: "Artist"),
];

final List<Content> recentlyPlayed = [
  const Content(
      role: Role.ARTIST,
      title: "Sau chia tay ta con gi?",
      image: Assets.vu,
      artists: ["Vu."],
      mainColor: Color.fromARGB(255, 35, 101, 38)),
  const Content(
      role: Role.ARTIST,
      title: "Buong doi tay nhau ra",
      image: Assets.mtp,
      artists: ["Son Tung MTP"],
      mainColor: Color.fromARGB(255, 47, 102, 147)),
  const Content(
      role: Role.ARTIST,
      title: "Anh nhan ra",
      image: Assets.vu,
      artists: ["Vu."],
      mainColor: Color.fromARGB(255, 35, 101, 38)),
  const Content(
      role: Role.ARTIST,
      title: "Chay ngay di",
      image: Assets.mtp,
      artists: ["Son Tung MTP"],
      mainColor: Color.fromARGB(255, 47, 102, 147)),
  const Content(
      role: Role.ARTIST,
      title: "La Lung",
      image: Assets.vu,
      artists: ["Vu."],
      mainColor: Color.fromARGB(255, 35, 101, 38)),
  const Content(
      role: Role.ARTIST,
      title: "Am tham ben em",
      image: Assets.mtp,
      artists: ["Son Tung MTP"],
      mainColor: Color.fromARGB(255, 47, 102, 147))
];
