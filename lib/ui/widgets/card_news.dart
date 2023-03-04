import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_luthfi/models/article.dart';
import 'package:news_app_luthfi/shared/theme.dart';
import 'package:news_app_luthfi/ui/pages/detail_news.dart';

class CardNews extends StatelessWidget {
  final Article article;

  const CardNews({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          DetailNews.ROUTE_NAME,
          arguments: article,
        );
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(
          bottom: 10,
        ),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: kWhiteColor, borderRadius: BorderRadius.circular(17)),
        child: Row(
          children: [
            article.urlToImage != null
                ? CachedNetworkImage(
                    imageUrl: article.urlToImage!,
                    imageBuilder: (context, imageProvider) => Container(
                          width: 100.0,
                          height: 100.0,
                          margin: const EdgeInsets.only(
                            right: 10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17),
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover),
                          ),
                        ),
                    placeholder: (context, url) => const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Container(
                          width: 100,
                          height: 100,
                          margin: const EdgeInsets.only(
                            right: 10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17),
                            color: kGreyBackgroundAvatarColor,
                            // image: DecorationImage(
                            //   image: AssetImage('assets/images/news.jpg'),
                            //   fit: BoxFit.cover,
                            // ),
                          ),
                          child: const Center(
                              child: Text(
                            'Failed to load image',
                            textAlign: TextAlign.center,
                          )),
                        ))
                : Container(
                    width: 100,
                    height: 100,
                    margin: const EdgeInsets.only(
                      right: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/news.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          article.author ?? '-',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: greyTextStyle.copyWith(
                            fontWeight: regular,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Text(
                        convertDate(article.publishedAt!) ?? '-',
                        style: greyTextStyle.copyWith(
                          fontWeight: regular,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    article.title ?? '-',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: blackTextStyle.copyWith(
                      fontWeight: semiBold,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
