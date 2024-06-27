import 'dart:math';

import 'package:blur/blur.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:day_25_26_06_2024/src/config/theme/color.dart';
import 'package:day_25_26_06_2024/src/core/common/widgets/circle_button_appbar.dart';
import 'package:day_25_26_06_2024/src/core/constants/api.dart';
import 'package:day_25_26_06_2024/src/features/movie/domain/entities/movie.dart';
import 'package:flutter/material.dart';
import '../../../../../config/theme/style.dart';
import '../../../../../core/common/widgets/elevated_button.dart';
import '../../../../../core/constants/size.dart';
import '../../../data/models/genre.dart';

// ignore: must_be_immutable
class MovieDetailPage extends StatefulWidget {
  MovieDetailPage({super.key, this.movie});

  MovieEntity? movie;

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: _buildBackgroundImage(context),
      ),
    );
  }

  _buildBackgroundImage(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverLayoutBuilder(
          builder: (BuildContext context, constraints) {
            final scrolled = constraints.scrollOffset > 260;
            return SliverAppBar(
              expandedHeight: 340,
              collapsedHeight: 80,
              toolbarHeight: 80,
              pinned: true,
              title: scrolled
                  ? Text(
                      widget.movie!.title!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  : const SizedBox(),
              backgroundColor:
                  scrolled ? HAppColor.otherColor : Colors.transparent,
              leading: Container(
                padding: hAppDefaultPaddingL,
                alignment: Alignment.center,
                child: HBlurCircleIcon(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 20,
                    )),
              ),
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(HAppAPI.imageBaseUrl +
                              widget.movie!.backdropPath!),
                          fit: BoxFit.cover)),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomRight,
                            colors: [
                          HAppColor.otherColor,
                          HAppColor.otherColor.withOpacity(.3)
                        ])),
                    child: Padding(
                      padding: hAppDefaultPaddingLTRB,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Row(
                            children: [
                              Image.asset('assets/images/imdb_logo.png',
                                  height: 12),
                              gapW4,
                              Text(
                                widget.movie!.voteAverage!.toString(),
                                style: HAppStyle.paragraph2Regular,
                              )
                            ],
                          ),
                          gapH12,
                          Text(
                            widget.movie!.title!,
                            style: HAppStyle.heading3Style,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          widget.movie!.genreIds!.isNotEmpty
                              ? SizedBox(
                                  height: 45,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 12),
                                    child: ListView.separated(
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          var genreList = genrelist
                                              .map((genre) =>
                                                  GenreModel.fromJson(genre))
                                              .toList();
                                          return Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 10),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                border: Border.all(
                                                  color: HAppColor
                                                      .bluePrimaryColor,
                                                )),
                                            child: Center(
                                                child: Text(
                                              genreList
                                                  .firstWhere((element) =>
                                                      element.id ==
                                                      widget.movie!
                                                          .genreIds![index])
                                                  .name!,
                                              style: HAppStyle.paragraph3Regular
                                                  .copyWith(
                                                      color: HAppColor
                                                          .bluePrimaryColor),
                                            )),
                                          );
                                        },
                                        separatorBuilder: (context, index) =>
                                            gapW10,
                                        itemCount:
                                            widget.movie!.genreIds!.length),
                                  ),
                                )
                              : const SizedBox()
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: hAppDefaultPaddingLTRB,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        height: 50,
                        width: 200,
                        child: HElevatedButton(
                            radius: 30,
                            onPressed: () {},
                            child: const Text('Watch Now'))),
                    HBlurCircleIcon(
                            onTap: () {},
                            icon: const Icon(Icons.download_outlined))
                        .frosted(
                            blur: 0.1,
                            borderRadius: BorderRadius.circular(100)),
                    HBlurCircleIcon(
                            onTap: () {},
                            icon: const Icon(Icons.bookmark_outline_rounded))
                        .frosted(
                            blur: 0.1,
                            borderRadius: BorderRadius.circular(100)),
                    HBlurCircleIcon(
                            onTap: () {},
                            icon: const Icon(Icons.share_outlined))
                        .frosted(
                            blur: 0.1, borderRadius: BorderRadius.circular(100))
                  ],
                ),
                gapH24,
                Text(
                    "Language: ${widget.movie!.originalLanguage} • Release date: ${widget.movie!.releaseDate}",
                    style: HAppStyle.paragraph1Regular
                        .copyWith(color: HAppColor.greyColor)),
                gapH24,
                const Text(
                  'Overview',
                  style: HAppStyle.heading4Style,
                ),
                gapH12,
                Text(
                  widget.movie!.overview!,
                  style: HAppStyle.paragraph1Regular
                      .copyWith(color: HAppColor.greyColor),
                )
              ],
            ),
          ),
        ),
        SliverPersistentHeader(
          pinned: true,
          delegate: HSliverAppBarDelegate(
              minHeight: 60,
              maxHeight: 60,
              child: TabBar(
                labelColor: HAppColor.bluePrimaryColor,
                unselectedLabelColor: HAppColor.greyColor,
                controller: _tabController,
                indicatorColor: HAppColor.bluePrimaryColor,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: const EdgeInsets.all(10),
                indicatorWeight: 3,
                tabs: const [
                  Tab(
                    text: 'Trailers',
                  ),
                  Tab(text: 'More Like This'),
                  Tab(text: 'About')
                ],
              )),
        ),
        SliverPadding(
          padding: hAppDefaultPaddingLTRB,
          sliver: SliverFillRemaining(
            child: TabBarView(controller: _tabController, children: [
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 100,
                        width: 150,
                        child: Stack(
                          children: [
                            CachedNetworkImage(
                                imageUrl: HAppAPI.imageBaseUrl +
                                    widget.movie!.posterPath!,
                                imageBuilder: (context, imageProvider) =>
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Container(
                                        height: 100,
                                        width: 150,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover)),
                                      ),
                                    ),
                                progressIndicatorBuilder: (context, url,
                                        downloadProgress) =>
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: const SizedBox(
                                        height: 100,
                                        width: 150,
                                        child: Center(
                                            child: CircularProgressIndicator(
                                                color: HAppColor
                                                    .bluePrimaryColor)),
                                      ),
                                    ),
                                errorWidget: (context, url, error) => ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: const SizedBox(
                                        height: 100,
                                        width: 150,
                                        child: Center(
                                            child: Icon(
                                          Icons.error,
                                          color: HAppColor.greyColor,
                                        )),
                                      ),
                                    )),
                            Center(
                              child: const HBlurCircleIcon(
                                      icon: Icon(Icons.play_arrow_rounded))
                                  .frosted(
                                      blur: 0.05,
                                      borderRadius: BorderRadius.circular(100)),
                            )
                          ],
                        ),
                      ),
                      gapW10,
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${widget.movie!.title} | Official Teaser Trailer $index',
                            style: HAppStyle.heading5Style,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          gapH6,
                          Text(
                            widget.movie!.releaseDate!,
                            style: HAppStyle.paragraph2Regular
                                .copyWith(color: HAppColor.greyColor),
                          )
                        ],
                      ))
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) => gapH10,
                itemCount: 7,
              ),
              const Center(child: Text('Content of Tab Two')),
              const Center(child: Text('Content of Tab Three')),
            ]),
          ),
        )
      ],
    );
  }
}

class HSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  HSliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
        child: Container(
      color: HAppColor.otherColor,
      child: child,
    ));
  }

  @override
  bool shouldRebuild(HSliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
