import 'package:flutter/material.dart';
import 'package:news_app_luthfi/shared/theme.dart';
import 'package:news_app_luthfi/ui/widgets/category.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Choose a category to start  reading',
                  style: blackTextStyle.copyWith(
                    fontWeight: semiBold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [
                    Expanded(
                      child: CategoryContainer(
                        image: 'assets/images/general.png',
                        title: 'General',
                      ),
                    ),
                    Expanded(
                      child: CategoryContainer(
                        image: 'assets/images/technology.png',
                        title: 'Technology',
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [
                    Expanded(
                      child: CategoryContainer(
                        image: 'assets/images/business.png',
                        title: 'Business',
                      ),
                    ),
                    Expanded(
                      child: CategoryContainer(
                        image: 'assets/images/entertainment.png',
                        title: 'Entertainment',
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [
                    Expanded(
                      child: CategoryContainer(
                        image: 'assets/images/health.png',
                        title: 'Health',
                      ),
                    ),
                    Expanded(
                      child: CategoryContainer(
                        image: 'assets/images/science.png',
                        title: 'Science',
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [
                    Expanded(
                      child: CategoryContainer(
                        image: 'assets/images/sport.png',
                        title: 'Sport',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
