import 'package:flutter/material.dart';
import 'package:news_app_luthfi/bloc/news_bloc.dart';
import 'package:news_app_luthfi/bloc/sort_bloc.dart';
import 'package:news_app_luthfi/shared/theme.dart';
import 'package:news_app_luthfi/ui/widgets/card_news.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
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
    // TODO: implement initState
    super.initState();
    context.read<NewsBloc>().add(FetchNews(widget.category));
    context.read<SortBloc>().add(IsSorted(false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
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
                    margin: EdgeInsets.only(
                      right: 10,
                    ),
                    decoration: BoxDecoration(
                      color: kGreyBackgroundAvatarColor,
                      shape: BoxShape.circle,
                      image: DecorationImage(
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
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        cursorColor: kBlackColor,
                        decoration: InputDecoration(
                          hintText: 'Search news for all categories',
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(17)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(17),
                            borderSide: BorderSide(color: kGreyColor),
                          ),
                        ),
                        onFieldSubmitted: (value) {
                          value.isNotEmpty
                              ? context.read<NewsBloc>().add(SearchNews(value))
                              : context
                                  .read<NewsBloc>()
                                  .add(FetchNews(widget.category));
                          ;
                        },
                      ),
                    ),
                    BlocBuilder<SortBloc, SortState>(
                      builder: (context, state) {
                        return IconButton(
                          tooltip: 'Sort By Date',
                          onPressed: () {
                            context.read<SortBloc>().add(
                                IsSorted(state is IsSortedNews ? false : true));
                            // DatePicker.showDatePicker(context,
                            //     showTitleActions: true,
                            //     minTime: DateTime(2000, 1, 1),
                            //     maxTime: DateTime.now(),
                            //     theme: DatePickerTheme(
                            //         headerColor: Colors.orange,
                            //         backgroundColor: kWhiteColor,
                            //         itemStyle: TextStyle(
                            //             color: kBlackColor,
                            //             fontWeight: FontWeight.bold,
                            //             fontSize: 18),
                            //         doneStyle: TextStyle(
                            //             color: kBlackColor,
                            //             fontSize: 16)), onChanged: (date) {
                            //   print('change $date in time zone ' +
                            //       date.timeZoneOffset.inHours.toString());
                            // }, onConfirm: (date) {
                            //   print('confirm ');
                            // }, currentTime: DateTime.now(), locale: LocaleType.en);
                          },
                          icon: Icon(
                            Icons.filter_list_outlined,
                            color: state is IsSortedNews
                                ? kBlueColor
                                : kBlackColor,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
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
                  Text(
                    widget.category,
                    style: greyTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              BlocBuilder<NewsBloc, NewsState>(
                builder: (context, state) {
                  if (state is NewsLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is NewsHasData) {
                    // final
                    return ListView.builder(
                      itemCount: state.result.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return CardNews(
                          article: state.result[index],
                        );
                      },
                    );
                  } else if (state is NewsError) {
                    return Center(
                      key: Key('error_message'),
                      child: Text(state.message),
                    );
                  } else {
                    return Center(child: Text('Failed'));
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
