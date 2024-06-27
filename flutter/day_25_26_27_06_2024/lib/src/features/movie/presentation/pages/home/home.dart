import 'package:blur/blur.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:day_25_26_06_2024/injection_container.dart';
import 'package:day_25_26_06_2024/src/config/theme/color.dart';
import 'package:day_25_26_06_2024/src/config/theme/style.dart';
import 'package:day_25_26_06_2024/src/core/common/widgets/background_filter.dart';
import 'package:day_25_26_06_2024/src/core/common/widgets/circle_button_appbar.dart';
import 'package:day_25_26_06_2024/src/core/common/widgets/elevated_button.dart';
import 'package:day_25_26_06_2024/src/core/constants/api.dart';
import 'package:day_25_26_06_2024/src/core/constants/size.dart';
import 'package:day_25_26_06_2024/src/features/movie/domain/entities/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../data/models/genre.dart';
import '../../bloc/movie/remote/now_playing/bloc.dart';
import '../../bloc/movie/remote/popular/popular_movie_bloc.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NowPlayingMovieBloc>(
            create: (context) => sl()..add(const GetNowPlayingMovies())),
        BlocProvider<PopularMovieBloc>(
            create: (context) => sl()..add(const GetPopularMovies())),
      ],
      child: const Scaffold(
        body: Page(),
      ),
    );
  }
}

class Page extends StatefulWidget {
  const Page({super.key});

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        BlocBuilder<NowPlayingMovieBloc, NowPlayingMovieState>(
            builder: (context, state) {
          if (state is NowPlayingMovieLoading) {
            return SizedBox(
              height: height * 0.6,
              child: const Center(
                child: CircularProgressIndicator(
                  color: HAppColor.bluePrimaryColor,
                ),
              ),
            );
          } else if (state is NowPlayingMovieException) {
            return const Center(
              child: Text('Error, nothing to display :((('),
            );
          } else if (state is NowPlayingMovieSuccess) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: height * 0.6,
                    viewportFraction: 1,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 10),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    onPageChanged: (index, reason) {
                      setState(() {
                        activeIndex = index;
                      });
                    },
                  ),
                  items: state.nowPlayingMovies!.take(6).map((movie) {
                    return Builder(
                      builder: (BuildContext context) {
                        return CachedNetworkImage(
                            imageUrl:
                                HAppAPI.imageBaseUrl + movie.backdropPath!,
                            imageBuilder: (context, imageProvider) => Stack(
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover)),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: listColorsHome)),
                                        )),
                                    Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Padding(
                                        padding: hAppDefaultPaddingLTRB,
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset(
                                                      'assets/images/imdb_logo.png',
                                                      height: 12),
                                                  gapW4,
                                                  Text(
                                                    movie.voteAverage!
                                                        .toString(),
                                                    style: HAppStyle
                                                        .paragraph2Regular,
                                                  )
                                                ],
                                              ),
                                              gapH12,
                                              Text(
                                                movie.title!,
                                                style: HAppStyle.heading3Style,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              gapH12,
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                      height: 50,
                                                      width: 200,
                                                      child: HElevatedButton(
                                                          radius: 30,
                                                          onPressed: () {
                                                            _onMoviePressed(
                                                                context, movie);
                                                          },
                                                          child: const Text(
                                                              'Watch Now'))),
                                                  gapW16,
                                                  HBlurCircleIcon(
                                                          onTap: () {},
                                                          icon: const Icon(Icons
                                                              .bookmark_outline_rounded))
                                                      .frosted(
                                                          blur: 0.1,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100))
                                                ],
                                              ),
                                              gapH24,
                                              SizedBox(
                                                height: 70,
                                                child: ListView.separated(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemBuilder:
                                                        (context, index) =>
                                                            CachedNetworkImage(
                                                                imageUrl: genrelist
                                                                    .map((genre) =>
                                                                        GenreModel.fromJson(
                                                                            genre))
                                                                    .toList()
                                                                    .elementAt(
                                                                        index)
                                                                    .image!,
                                                                imageBuilder:
                                                                    (context,
                                                                            imageProvider) =>
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(10),
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                70,
                                                                            width:
                                                                                100,
                                                                            decoration:
                                                                                BoxDecoration(image: DecorationImage(image: imageProvider, fit: BoxFit.cover)),
                                                                          ),
                                                                        ),
                                                                progressIndicatorBuilder:
                                                                    (context,
                                                                            url,
                                                                            downloadProgress) =>
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(10),
                                                                          child:
                                                                              const SizedBox(
                                                                            height:
                                                                                70,
                                                                            width:
                                                                                100,
                                                                            child:
                                                                                Center(child: CircularProgressIndicator(color: HAppColor.bluePrimaryColor)),
                                                                          ),
                                                                        ),
                                                                errorWidget:
                                                                    (context, url,
                                                                            error) =>
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(10),
                                                                          child:
                                                                              const SizedBox(
                                                                            height:
                                                                                70,
                                                                            width:
                                                                                100,
                                                                            child: Center(
                                                                                child: Icon(
                                                                              Icons.error,
                                                                              color: HAppColor.greyColor,
                                                                            )),
                                                                          ),
                                                                        )),
                                                    separatorBuilder:
                                                        (context, index) =>
                                                            gapW8,
                                                    itemCount: 5),
                                              )
                                            ]),
                                      ),
                                    )
                                  ],
                                ),
                            progressIndicatorBuilder: (context, url,
                                    downloadProgress) =>
                                ClipRRect(
                                  child: SizedBox(
                                    width: width,
                                    child: const Center(
                                        child: CircularProgressIndicator(
                                            color: HAppColor.bluePrimaryColor)),
                                  ),
                                ),
                            errorWidget: (context, url, error) => ClipRRect(
                                  child: SizedBox(
                                    width: width,
                                    child: const Center(
                                        child: Icon(
                                      Icons.error,
                                      color: HAppColor.greyColor,
                                    )),
                                  ),
                                ));
                      },
                    );
                  }).toList(),
                ),
                gapH6,
                AnimatedSmoothIndicator(
                  activeIndex: activeIndex,
                  count: state.nowPlayingMovies!.take(6).length,
                  effect: const WormEffect(
                      dotWidth: 24.0,
                      spacing: 4.0,
                      dotHeight: 4.0,
                      dotColor: HAppColor.anotherColor,
                      activeDotColor: HAppColor.bluePrimaryColor),
                )
              ],
            );
          }
          return const SizedBox();
        }),
        gapH24,
        BlocBuilder<PopularMovieBloc, PopularMovieState>(
            builder: (context, state) {
          if (state is PopularMovieLoading) {
            return const SizedBox(
              height: 250,
              child: Center(
                child: CircularProgressIndicator(
                  color: HAppColor.bluePrimaryColor,
                ),
              ),
            );
          } else if (state is PopularMovieException) {
            return const Center(
              child: Text('Error, nothing to display :((('),
            );
          } else if (state is PopularMovieSuccess) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: hAppDefaultPaddingLR,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Populars Movies',
                        style: HAppStyle.heading4Style,
                      ),
                      GestureDetector(
                        onTap: () {
                          _onSeeAllPopularMoviePressed(
                              context, state.popularMovies!);
                        },
                        child: Text(
                          'See All',
                          style: HAppStyle.paragraph2Regular
                              .copyWith(color: HAppColor.bluePrimaryColor),
                        ),
                      )
                    ],
                  ),
                ),
                gapH12,
                Stack(
                  children: [
                    gapH12,
                    SizedBox(
                      height: 250,
                      child: ListView.separated(
                          padding: hAppDefaultPaddingLR,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            var movie = state.popularMovies![index];
                            return GestureDetector(
                              onTap: () => _onMoviePressed(context, movie),
                              child: Stack(
                                children: [
                                  CachedNetworkImage(
                                      imageUrl: HAppAPI.imageBaseUrl +
                                          movie.posterPath!,
                                      imageBuilder: (context, imageProvider) =>
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Container(
                                              height: 250,
                                              width: 150,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: imageProvider,
                                                      fit: BoxFit.cover)),
                                            ),
                                          ),
                                      progressIndicatorBuilder:
                                          (context, url, downloadProgress) =>
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: const SizedBox(
                                                  height: 250,
                                                  width: 150,
                                                  child: Center(
                                                      child: CircularProgressIndicator(
                                                          color: HAppColor
                                                              .bluePrimaryColor)),
                                                ),
                                              ),
                                      errorWidget: (context, url, error) =>
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: const SizedBox(
                                              height: 250,
                                              width: 150,
                                              child: Center(
                                                  child: Icon(
                                                Icons.error,
                                                color: HAppColor.greyColor,
                                              )),
                                            ),
                                          )),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      padding: const EdgeInsets.all(5),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 2, horizontal: 4),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Image.asset(
                                                'assets/images/imdb_logo.png',
                                                height: 10),
                                            gapW4,
                                            Text(
                                              movie.voteAverage!.toString(),
                                              style:
                                                  HAppStyle.paragraph3Regular,
                                            )
                                          ],
                                        ),
                                      ).frosted(
                                          blur: 0.05,
                                          frostColor: HAppColor.otherColor,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => gapW8,
                          itemCount: 5),
                    ),
                  ],
                )
              ],
            );
          }
          return const SizedBox();
        }),
      ]),
    );
  }

  void _onMoviePressed(BuildContext context, MovieEntity movie) {
    Navigator.pushNamed(context, '/MovieDetail', arguments: movie);
  }

  void _onSeeAllPopularMoviePressed(
      BuildContext context, List<MovieEntity> movies) {
    Navigator.pushNamed(context, '/SeeAll', arguments: movies);
  }
}
