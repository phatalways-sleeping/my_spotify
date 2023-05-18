import 'package:clone_spotify/data/data.dart';
import 'package:clone_spotify/widgets/content_list_item.dart';
import 'package:flutter/material.dart';

class ContentList extends StatelessWidget {
  final List<Content> featureList;
  final String title;
  const ContentList(
      {super.key, required this.featureList, required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      sliver: SliverToBoxAdapter(
        child: Container(
          height: 300.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700)),
              Expanded(
                child: ListView.builder(
                    itemCount: forYouData.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                        ContentListItem(content: forYouData[index])),
              )
            ],
          ),
        ),
      ),
    );
  }
}
