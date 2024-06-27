import 'package:blur/blur.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:day_25_26_06_2024/src/config/theme/style.dart';
import 'package:day_25_26_06_2024/src/core/common/widgets/circle_button_appbar.dart';
import 'package:day_25_26_06_2024/src/core/constants/size.dart';
import 'package:day_25_26_06_2024/src/features/movie/domain/entities/movie.dart';
import 'package:flutter/material.dart';

import '../../../../../config/theme/color.dart';
import '../../../../../core/constants/api.dart';

class SeeAllPopularMovie extends StatelessWidget {
  const SeeAllPopularMovie({super.key, this.movies});

  final List<MovieEntity>? movies;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: HBlurCircleIcon(
          icon: const Icon(Icons.arrow_back_ios),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('Populars Movies'),
        toolbarHeight: 80,
      ),
      body: SingleChildScrollView(
        child: GridView.builder(
          padding: hAppDefaultPaddingLTRB,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 3 / 4),
          itemBuilder: (_, index) {
            var movie = movies![index];
            return GestureDetector(
              onTap: () {
                _onMoviePressed(context, movie);
              },
              child: Stack(
                children: [
                  CachedNetworkImage(
                      imageUrl: HAppAPI.imageBaseUrl + movie.posterPath!,
                      imageBuilder: (context, imageProvider) => ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              height: 300,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover)),
                            ),
                          ),
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: const SizedBox(
                                  height: 300,
                                  child: Center(
                                      child: CircularProgressIndicator(
                                          color: HAppColor.bluePrimaryColor)),
                                ),
                              ),
                      errorWidget: (context, url, error) => ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: const SizedBox(
                              height: 300,
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
                            Image.asset('assets/images/imdb_logo.png',
                                height: 12),
                            gapW4,
                            Text(
                              movie.voteAverage!.toString(),
                              style: HAppStyle.paragraph2Regular,
                            )
                          ],
                        ),
                      ).frosted(
                          blur: 0.05,
                          frostColor: HAppColor.otherColor,
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  )
                ],
              ),
            );
          },
          itemCount: movies!.length,
        ),
      ),
    );
  }
}

void _onMoviePressed(BuildContext context, MovieEntity movie) {
  Navigator.pushNamed(context, '/MovieDetail', arguments: movie);
}
