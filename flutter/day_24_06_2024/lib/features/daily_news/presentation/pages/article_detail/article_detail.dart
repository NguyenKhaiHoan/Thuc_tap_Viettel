import 'package:day_24_06_2024/config/theme/app_style.dart';
import 'package:day_24_06_2024/core/constants/constants_color.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../core/constants/constants_size.dart';
import '../../../domain/entities/article.dart';

class ArticleDetailsView extends StatelessWidget {
  final ArticleEntity? article;

  const ArticleDetailsView({Key? key, this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    ));
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      leading: Builder(
        builder: (context) => GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => _onBackButtonTapped(context),
          child: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.share),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.bookmark),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      padding: appDefaultPaddingLR,
      child: Column(
        children: [
          _buildArticleCategoryAndDatetime(),
          gapH12,
          _buildArticleTitleAndAuthor(),
          gapH12,
          _buildArticleImage(),
          gapH12,
          _buildArticleDescription(),
        ],
      ),
    );
  }

  Widget _buildArticleTitleAndAuthor() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          article!.title!,
          style: heading3Style,
        ),
        // gapH12,
        // Text(
        //   article!.author ?? 'Mr Johny',
        //   style: paragraph2Regular.copyWith(color: greySecondaryColor),
        // ),
      ],
    );
  }

  Widget _buildArticleImage() {
    return Container(
      width: double.maxFinite,
      height: 250,
      padding: appDefaultPaddingLTRB,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: DecorationImage(
              image: NetworkImage(article!.urlToImage!), fit: BoxFit.cover)),
    );
  }

  Widget _buildArticleDescription() {
    return Text(
      '${article!.description ?? ''}\n\n${article!.content ?? ''}',
      style: const TextStyle(fontSize: 16),
    );
  }

  void _onBackButtonTapped(BuildContext context) {
    Navigator.pop(context);
  }

  Widget _buildArticleCategoryAndDatetime() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: bluePrimaryColor),
          child: Text(
            'General',
            style: paragraph3Bold.copyWith(color: whiteColor),
          ),
        ),
        gapH12,
        Text(
          DateFormat('yyyy-MM-dd - kk:mm')
              .format(DateTime.tryParse(article!.publishedAt!)!),
          style: paragraph2Regular.copyWith(color: greySecondaryColor),
        ),
      ],
    );
  }
}
