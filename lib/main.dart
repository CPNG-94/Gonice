import 'package:flutter/material.dart';
import 'package:gonice/data/api/api_service.dart';
import 'package:gonice/data/model/article.dart';
import 'package:gonice/page/news/article_detail_page.dart';
import 'package:gonice/page/news/article_detail_page.dart';
import 'package:gonice/page/news/article_web_view.dart';
import 'package:gonice/page/home/home_page.dart';
import 'package:gonice/page/news/news_page.dart';
import 'package:gonice/page/splashscreen.dart';
import 'package:gonice/provider/news_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<NewsProvider>(
            create: (_) => NewsProvider(apiService: ApiService()),
            child: NewsPage(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: SplashScreen.routeName,
          routes: {
            SplashScreen.routeName: (context) => SplashScreen(),
            HomePage.routeName: (context) => HomePage(),
            ArticleDetailPage.routeName: (context) => ArticleDetailPage(
                  article:
                      ModalRoute.of(context)?.settings.arguments as Article,
                ),
            ArticleWebView.routeName: (context) => ArticleWebView(
                  url: ModalRoute.of(context)?.settings.arguments as String,
                ),
          },
        ));
  }
}
