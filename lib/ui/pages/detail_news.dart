import 'package:flutter/material.dart';
import 'package:news_app_luthfi/models/article.dart';
import 'package:news_app_luthfi/shared/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DetailNews extends StatelessWidget {
  static const ROUTE_NAME = '/detail';
  final Article article;

  const DetailNews({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 30,
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 50,
                  height: 50,
                  margin: EdgeInsets.only(
                    bottom: 10,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: kGreyOutlineColor,
                    ),
                  ),
                  child: Icon(Icons.arrow_back_outlined),
                ),
              ),
              Text(
                article.title ?? '-',
                style: blackTextStyle.copyWith(
                  fontWeight: bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    margin: EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                      color: kGreyBackgroundAvatarColor,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/avatar.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      article.author ?? '-',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: blackTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  ),
                  Text(
                    convertDate(article.publishedAt!) ?? '-',
                    style: greyTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(27),
                child: CachedNetworkImage(
                  width: double.infinity,
                  height: 230,
                  fit: BoxFit.cover,
                  imageUrl: article.urlToImage ??
                      'https://static.vecteezy.com/system/resources/thumbnails/004/216/831/original/3d-world-news-background-loop-free-video.jpg',
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                      color: kGreyBackgroundAvatarColor,
                    ),
                    child: Center(
                      child: Text(
                        'Failed to load image',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                article.description ?? '-',
                style: greyTextStyle.copyWith(
                  fontWeight: medium,
                ),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
