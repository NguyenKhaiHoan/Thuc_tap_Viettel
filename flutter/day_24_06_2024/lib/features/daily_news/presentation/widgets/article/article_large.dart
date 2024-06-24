import 'package:day_24_06_2024/config/theme/app_style.dart';
import 'package:day_24_06_2024/core/constants/constants_color.dart';
import 'package:day_24_06_2024/core/constants/constants_size.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../domain/entities/article.dart';
import 'package:timeago/timeago.dart' as timeago;

class ArticleLargeWidget extends StatelessWidget {
  final ArticleEntity? article;
  final void Function(ArticleEntity article)? onArticlePressed;

  const ArticleLargeWidget({super.key, this.article, this.onArticlePressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _onTap,
      child: SizedBox(
        height: 300,
        width: 300,
        child: Column(
          children: [
            _buildImage(context),
            _buildTitleAndDescription(),
          ],
        ),
      ),
    );
  }

  _onTap() {
    if (onArticlePressed != null) {
      onArticlePressed!(article!);
    }
  }

  _buildImage(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: article!.urlToImage!,
        imageBuilder: (context, imageProvider) => ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 210,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover)),
              ),
            ),
        progressIndicatorBuilder: (context, url, downloadProgress) => ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: const SizedBox(
                height: 210,
                width: 300,
                child: Center(
                    child: CircularProgressIndicator(color: bluePrimaryColor)),
              ),
            ),
        errorWidget: (context, url, error) => ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: const SizedBox(
                height: 210,
                width: 300,
                child: Center(
                    child: Icon(
                  Icons.error,
                  color: greyPrimaryColor,
                )),
              ),
            ));
  }

  _buildTitleAndDescription() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: appDefaultPadding / 2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              article!.title ?? '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: heading4Style,
            ),
            Row(
              children: [
                Text(
                  'General',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: heading5Style.copyWith(color: bluePrimaryColor),
                ),
                gapW4,
                Text('•',
                    style: paragraph3Regular.copyWith(color: greyPrimaryColor)),
                gapW4,
                Text(
                  timeago.format(DateTime.tryParse(article!.publishedAt!) ??
                      DateTime.now()),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: paragraph3Regular.copyWith(color: greyPrimaryColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
