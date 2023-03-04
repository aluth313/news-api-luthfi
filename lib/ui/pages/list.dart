import 'package:flutter/material.dart';
import 'package:news_app_luthfi/bloc/news_bloc.dart';
import 'package:news_app_luthfi/bloc/search_bloc.dart';
import 'package:news_app_luthfi/bloc/sort_bloc.dart';
import 'package:news_app_luthfi/shared/theme.dart';
import 'package:news_app_luthfi/ui/widgets/card_news.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListNews extends StatefulWidget {
  static const ROUTE_NAME = '/list';
  final String category;

  const ListNews({
    super.key,
    required this.category,
  });

  @override
  State<ListNews> createState() => _ListNewsState();
}

class _ListNewsState extends State<ListNews> {
  @override
  void initState() {
    super.initState();
    context.read<NewsBloc>().add(FetchNews(widget.category, false));
    context.read<SortBloc>().add(IsSorted(false));
    context.read<SearchBloc>().add(SearchNewsEmpty());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            vertical: 30,
            horizontal: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    margin: const EdgeInsets.only(
                      right: 10,
                    ),
                    decoration: BoxDecoration(
                      color: kGreyBackgroundAvatarColor,
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                        image: AssetImage(
                          'assets/images/avatar.png',
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi!',
                        style: greyTextStyle.copyWith(
                          fontWeight: medium,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'You',
                        style: blackTextStyle.copyWith(
                          fontWeight: bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              BlocBuilder<SearchBloc, SearchState>(
                builder: (contextSearch, stateSearch) {
                  return BlocBuilder<SortBloc, SortState>(
                    builder: (context, state) {
                      return Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                cursorColor: kBlackColor,
                                decoration: InputDecoration(
                                  hintText: 'Search news for all categories',
                                  prefixIcon: const Icon(Icons.search),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(17)),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(17),
                                    borderSide: BorderSide(color: kGreyColor),
                                  ),
                                ),
                                onFieldSubmitted: (value) {
                                  context
                                      .read<SearchBloc>()
                                      .add(SearchNewsWithQuery(value));
                                  if (value.isNotEmpty) {
                                    context.read<NewsBloc>().add(SearchNews(
                                        value,
                                        state is IsSortedNews ? true : false));
                                  } else {
                                    context.read<NewsBloc>().add(FetchNews(
                                        widget.category,
                                        state is IsSortedNews ? true : false));
                                  }
                                },
                              ),
                            ),
                            IconButton(
                              tooltip: 'Sort By Date',
                              onPressed: () {
                                context.read<SortBloc>().add(IsSorted(
                                    state is IsSortedNews ? false : true));
                                if (stateSearch is SearchNotEmpty) {
                                  context.read<NewsBloc>().add(SearchNews(
                                      stateSearch.query,
                                      state is IsSortedNews ? false : true));
                                } else {
                                  context.read<NewsBloc>().add(FetchNews(
                                      widget.category,
                                      state is IsSortedNews ? false : true));
                                }
                              },
                              icon: Icon(
                                Icons.filter_list_outlined,
                                color: state is IsSortedNews
                                    ? kBlueColor
                                    : kBlackColor,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Top Headlines',
                      style: blackTextStyle.copyWith(
                        fontWeight: bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  BlocBuilder<SearchBloc, SearchState>(
                    builder: (context, state) {
                      return Text(
                        state is SearchNotEmpty ? 'All' : widget.category,
                        style: greyTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<NewsBloc, NewsState>(
                builder: (context, state) {
                  if (state is NewsLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is NewsHasData) {
                    // final
                    return ListView.builder(
                      itemCount: state.result.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return CardNews(
                          article: state.result[index],
                        );
                      },
                    );
                  } else if (state is NewsError) {
                    return Center(
                      key: const Key('error_message'),
                      child: Text(state.message),
                    );
                  } else if (state is NewsEmpty) {
                    return const Center(
                      child: Text('Search Not Found.'),
                    );
                  } else {
                    return const Center(child: Text('Failed'));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
