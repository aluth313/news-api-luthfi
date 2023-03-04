import 'package:flutter/material.dart';
import 'package:news_app_luthfi/bloc/news_bloc.dart';
import 'package:news_app_luthfi/bloc/sort_bloc.dart';
import 'package:news_app_luthfi/models/article.dart';
import 'package:news_app_luthfi/services/news_services.dart';
import 'package:news_app_luthfi/ui/pages/detail_news.dart';
import 'package:news_app_luthfi/ui/pages/home.dart';
import 'package:news_app_luthfi/ui/pages/list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => NewsBloc(NewsServices()),
        ),
        BlocProvider(
          create: (_) => SortBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/':
              return MaterialPageRoute(
                builder: (_) => HomePage(),
              );
            case '/list':
              final category = settings.arguments as String;
              return MaterialPageRoute(
                builder: (_) => ListNews(category: category),
                settings: settings,
              );
            case '/detail':
              final article = settings.arguments as Article;
              return MaterialPageRoute(
                builder: (_) => DetailNews(article: article),
                settings: settings,
              );
            default:
              return MaterialPageRoute(builder: (_) {
                return Scaffold(
                  body: Center(
                    child: Text('Page not found :('),
                  ),
                );
              });
          }
        },
      ),
    );
  }
}
