import 'package:flutter/material.dart';
import 'package:news_app_luthfi/shared/theme.dart';
import 'package:news_app_luthfi/ui/pages/list.dart';

class CategoryContainer extends StatelessWidget {
  final String image;
  final String title;
  const CategoryContainer({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          ListNews.ROUTE_NAME,
          arguments: title.toLowerCase(),
        );
      },
      child: Container(
        width: double.infinity,
        height: 130,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      image,
                    ),
                  ),
                ),
              ),
              Text(
                title,
                style: blackTextStyle,
              )
            ],
          ),
        ),
      ),
    );
  }
}
