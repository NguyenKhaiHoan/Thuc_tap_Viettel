import 'package:day_24_06_2024/config/theme/app_style.dart';
import 'package:day_24_06_2024/core/constants/constants_color.dart';
import 'package:day_24_06_2024/core/constants/constants_size.dart';
import 'package:day_24_06_2024/features/daily_news/domain/entities/article.dart';
import 'package:day_24_06_2024/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:day_24_06_2024/features/daily_news/presentation/widgets/article/article_large.dart';
import 'package:day_24_06_2024/features/daily_news/presentation/widgets/tags/list_tag.dart';
import 'package:day_24_06_2024/features/daily_news/presentation/widgets/title_show_all.dart';
import 'package:day_24_06_2024/features/daily_news/presentation/widgets/topic/topic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class DailyNews extends StatelessWidget {
  DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    ));
  }

  _buildAppBar() {
    return AppBar(
        title: Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: greyTertiaryColor, borderRadius: BorderRadius.circular(5)),
      child: Center(
        child: TextFormField(
          decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.search,
                color: greyPrimaryColor,
              ),
              suffixIcon: IconButton(
                icon: const Icon(
                  Icons.clear,
                  color: greyPrimaryColor,
                ),
                onPressed: () {},
              ),
              hintText: 'Search...',
              hintStyle: label2Bold.copyWith(color: greyPrimaryColor),
              border: InputBorder.none),
        ),
      ),
    ));
  }

  var popularTags = [
    'today',
    'health',
    'politics',
    'nature',
    'music',
    'arts',
    'marketing',
    'business',
    'science'
  ];

  Map<String, String> topics = {
    'https://ic-cdn.flipboard.com/npr.org/8b1cf108b42fac0d40992d893dcff690b635d716/_medium.webp':
        'Business',
    'https://thewealthyboomers.com/wp-content/uploads/2024/04/Old-man-sly-smirk-1024x576.jpg':
        'Entertainment',
    'https://ic-cdn.flipboard.com/fortune.com/c3f49acc567a5042b8cb9fce8b5de3e8ae89cc97/_medium.webp':
        'General',
    'https://ic-cdn.flipboard.com/tvovermind.com/7edb5f8d70f8c6ac6379a811d8592bc404b7470b/_medium.webp':
        'Health',
    'https://img.huffingtonpost.com/asset/6673c94922000038001a59d7.jpeg?cache=PBRhXYdxDL&ops=1200_630':
        'Science',
    'https://i0.wp.com/sacobserver.com/wp-content/uploads/2024/06/istockphoto-475530313-612x612-1.jpg?fit=612%2C406&ssl=1':
        'Sports',
    'https://www.influencive.com/wp-content/uploads/2016/06/internet-marketing-strategies.jpg':
        'Technology',
  };

  final List<Map> myProducts =
      List.generate(100000, (index) => {"id": index, "name": "Product $index"})
          .toList();

  _buildBody() {
    return SingleChildScrollView(
      padding: appDefaultPaddingLTRB,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const TitleShowAll(title: 'Popular tags'),
        gapH12,
        ListTagWidget(popularTags: popularTags),
        gapH12,
        BlocBuilder<RemoteArticlesBloc, RemoteArticleState>(
            builder: (context, state) {
          if (state is RemoteArticlesLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: bluePrimaryColor,
              ),
            );
          } else if (state is RemoteArticlesException) {
            return const Center(
              child: Text('Error, nothing to display :((('),
            );
          } else if (state is RemoteArticlesLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleShowAll(title: 'Top headlines news'),
                gapH12,
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(right: appDefaultPadding),
                        child: ArticleLargeWidget(
                            article: state.articles![index],
                            onArticlePressed: (article) =>
                                _onArticlePressed(context, article)),
                      );
                    },
                    itemCount: state.articles!.length,
                  ),
                ),
              ],
            );
          }
          return const SizedBox();
        }),
        gapH12,
        const TitleShowAll(title: 'Recommended topics'),
        gapH12,
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (_, index) => TopicWidget(
            topicUrl: topics.keys.elementAt(index),
            topicTitle: topics.values.elementAt(index),
            index: index,
          ),
          itemCount: topics.length,
        )
      ]),
    );
  }

  void _onArticlePressed(BuildContext context, ArticleEntity article) {
    Navigator.pushNamed(context, '/ArticleDetails', arguments: article);
  }
}
