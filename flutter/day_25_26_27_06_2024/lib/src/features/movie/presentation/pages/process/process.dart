import 'dart:ui';

import 'package:blur/blur.dart';
import 'package:day_25_26_06_2024/injection_container.dart';
import 'package:day_25_26_06_2024/src/config/theme/color.dart';
import 'package:day_25_26_06_2024/src/core/common/widgets/background_filter.dart';
import 'package:day_25_26_06_2024/src/core/common/widgets/circle_button_appbar.dart';
import 'package:day_25_26_06_2024/src/core/constants/size.dart';
import 'package:day_25_26_06_2024/src/features/movie/domain/entities/genre.dart';
import 'package:day_25_26_06_2024/src/features/movie/presentation/bloc/genre/genre_bloc.dart';
import 'package:day_25_26_06_2024/src/features/movie/presentation/bloc/pick_genre/pick_genre_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../../../config/theme/style.dart';

// ignore: must_be_immutable
class ProcessPage extends StatelessWidget {
  const ProcessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<GenreBloc>(
        create: (context) => sl()..add(const LoadGenre()),
      ),
      BlocProvider<PickGenreBloc>(
        create: (context) => PickGenreBloc(),
      ),
    ], child: const ProcessContent());
  }
}

class ProcessContent extends StatelessWidget {
  const ProcessContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final stateGenre = context.watch<GenreBloc>().state;
      final statePickGenre = context.watch<PickGenreBloc>().state;

      if (stateGenre is GenreLoading) {
        return const Center(
          child: CircularProgressIndicator(
            color: HAppColor.bluePrimaryColor,
          ),
        );
      }
      return Scaffold(
        body: Stack(
          children: [
            BackgroundFilterImage(
                imagePath: 'assets/images/background_welcome.jpg',
                colors: listColorProcess,
                child: Container()),
            CustomScrollView(
              slivers: <Widget>[
                SliverLayoutBuilder(
                  builder: (BuildContext context, constraints) {
                    final scrolled = constraints.scrollOffset > 80;
                    return SliverAppBar(
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
                      centerTitle: true,
                      expandedHeight: 140,
                      pinned: true,
                      flexibleSpace: FlexibleSpaceBar(
                        centerTitle: true,
                        titlePadding: const EdgeInsets.symmetric(
                            vertical: hAppDefaultPadding,
                            horizontal: hAppDefaultPadding * 4),
                        background: Container(color: Colors.transparent),
                        title: const Text(
                          'Pick What You\'d Like to Watch',
                          style: HAppStyle.heading4Style,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  },
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate((context_, index) {
                  return _buildImage(
                      context, stateGenre.results![index], statePickGenre);
                }, childCount: stateGenre.results!.length)),
              ],
            ),
          ],
        ),
        bottomNavigationBar: Container(
            padding: hAppDefaultPaddingLTRB,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom().copyWith(
                          backgroundColor: const MaterialStatePropertyAll(
                              HAppColor.whileColor)),
                      onPressed: () {
                        var check = statePickGenre.pickedGenre == null ||
                            (statePickGenre.pickedGenre != null &&
                                statePickGenre.pickedGenre!.isEmpty);
                        if (!check) {
                          Navigator.pushNamed(context, '/Home');
                        }
                      },
                      child: Text(
                        statePickGenre.pickedGenre == null ||
                                (statePickGenre.pickedGenre != null &&
                                    statePickGenre.pickedGenre!.isEmpty)
                            ? 'Select at Least 1'
                            : 'Done',
                        style: HAppStyle.label2Bold
                            .copyWith(color: HAppColor.otherColor),
                      )),
                )
              ],
            )),
      );
    });
  }

  // Future<void> _pickGenre(
  //     BuildContext context, GenreEntity? genre, PickGenreState state) async {
  //   context.loaderOverlay.show();

  //   if (context.loaderOverlay.visible) {
  //     await Future.delayed(const Duration(seconds: 3));
  //     if (!context.mounted) return;
  //     context.loaderOverlay.hide();
  //   }
  // }

  Widget _buildImage(
      BuildContext context, GenreEntity? genre, PickGenreState state) {
    return Padding(
      padding: hAppDefaultPaddingLR,
      child: GestureDetector(
        onTap: () =>
            (state.pickedGenre != null && state.pickedGenre!.contains(genre))
                ? context.read<PickGenreBloc>().add(RemoveGenre(genre))
                : context.read<PickGenreBloc>().add(AddGenre(genre)),
        child: CachedNetworkImage(
            imageUrl: genre!.image!,
            imageBuilder: (context, imageProvider) => Padding(
                  padding: const EdgeInsets.only(bottom: hAppDefaultPadding),
                  child: GenreItemWidget(
                    imageProvider: imageProvider,
                    genre: genre,
                    isPicked: (state.pickedGenre != null &&
                        state.pickedGenre!.contains(genre)),
                  ),
                ),
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Padding(
                  padding: const EdgeInsets.only(bottom: hAppDefaultPadding),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 170,
                      decoration: BoxDecoration(
                        color: HAppColor.otherColor.withOpacity(0.08),
                      ),
                      child: const Center(
                          child: CircularProgressIndicator(
                        color: HAppColor.bluePrimaryColor,
                      )),
                    ),
                  ),
                ),
            errorWidget: (context, url, error) => Padding(
                  padding: const EdgeInsets.only(bottom: hAppDefaultPadding),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 170,
                      decoration: BoxDecoration(
                        color: HAppColor.otherColor.withOpacity(0.08),
                      ),
                      child: const Icon(Icons.error),
                    ),
                  ),
                )),
      ),
    );
  }
}

class GenreItemWidget extends StatelessWidget {
  const GenreItemWidget({
    super.key,
    required this.imageProvider,
    required this.genre,
    required this.isPicked,
  });

  final ImageProvider<Object> imageProvider;
  final GenreEntity genre;
  final bool isPicked;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 170,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: isPicked
                    ? Border.all(
                        color: HAppColor.bluePrimaryColor,
                        width: 2,
                      )
                    : null,
                image:
                    DecorationImage(image: imageProvider, fit: BoxFit.cover)),
            child: Center(
                child: Text(
              genre.name!,
              style: HAppStyle.paragraph3Bold,
            ).frosted(
                    frostColor: HAppColor.otherColor,
                    blur: 0.1,
                    borderRadius: BorderRadius.circular(5),
                    padding: const EdgeInsets.symmetric(
                        vertical: 5, horizontal: 10))),
          ),
        ),
        isPicked
            ? Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.check_circle,
                      color: HAppColor.bluePrimaryColor,
                    )),
              )
            : const SizedBox()
      ],
    );
  }
}
