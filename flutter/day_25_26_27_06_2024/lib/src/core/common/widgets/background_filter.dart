import 'package:cached_network_image/cached_network_image.dart';
import 'package:day_25_26_06_2024/src/config/theme/color.dart';
import 'package:flutter/material.dart';

import '../../constants/api.dart';

class BackgroundFilterImage extends StatelessWidget {
  const BackgroundFilterImage(
      {super.key,
      required this.child,
      required this.imagePath,
      required this.colors,
      this.isNetwork = false});

  final Widget child;
  final String imagePath;
  final List<Color> colors;
  final bool? isNetwork;

  @override
  Widget build(BuildContext context) {
    return isNetwork ?? false
        ? CachedNetworkImage(
            imageUrl: HAppAPI.imageBaseUrl + imagePath,
            imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover)),
                ),
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                const SizedBox(
                  child: Center(
                      child: CircularProgressIndicator(
                          color: HAppColor.bluePrimaryColor)),
                ),
            errorWidget: (context, url, error) => const SizedBox(
                  height: 300,
                  child: Center(
                      child: Icon(
                    Icons.error,
                    color: HAppColor.greyColor,
                  )),
                ))
        : Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imagePath), fit: BoxFit.cover)),
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: colors)),
              child: child,
            ));
  }
}
