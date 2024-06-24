import 'package:cached_network_image/cached_network_image.dart';
import 'package:day_24_06_2024/config/theme/app_style.dart';
import 'package:day_24_06_2024/core/constants/constants_size.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/constants_color.dart';

class TopicWidget extends StatelessWidget {
  const TopicWidget(
      {super.key,
      required this.topicUrl,
      required this.topicTitle,
      required this.index});

  final String topicUrl;
  final String topicTitle;
  final int index;

  @override
  Widget build(BuildContext context) {
    print(topicUrl);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(
            left: index % 2 == 1 ? appDefaultPadding / 2 : 0,
            right: index % 2 == 0 ? appDefaultPadding / 2 : 0),
        height: 200,
        child: Column(
          children: [
            _buildImage(context),
            _buildTitleAndDescription(),
          ],
        ),
      ),
    );
  }

  _buildImage(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: topicUrl,
        imageBuilder: (context, imageProvider) => ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 140,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover)),
              ),
            ),
        progressIndicatorBuilder: (context, url, downloadProgress) => ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: const SizedBox(
                height: 140,
                child: Center(
                    child: CircularProgressIndicator(color: bluePrimaryColor)),
              ),
            ),
        errorWidget: (context, url, error) => ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: const SizedBox(
                height: 140,
                child: Center(
                    child: Icon(
                  Icons.error,
                  color: greyPrimaryColor,
                )),
              ),
            ));
  }

  _buildTitleAndDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: appDefaultPadding / 2),
      child: Text(
        topicTitle,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: paragraph2Regular,
      ),
    );
  }
}
