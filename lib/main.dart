import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gonice/data/api/api_service.dart';
import 'package:gonice/data/model/article.dart';
import 'package:gonice/page/login/login_page.dart';
import 'package:gonice/page/login/register_page.dart';
import 'package:gonice/page/login/welcome_page.dart';
import 'package:gonice/page/news/article_detail_page.dart';
import 'package:gonice/page/news/article_web_view.dart';
import 'package:gonice/page/home/home_page.dart';
import 'package:gonice/page/news/news_page.dart';
import 'package:gonice/page/splashscreen.dart';
import 'package:gonice/provider/news_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const GetMaterialApp(home: MyApp()));
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
            SplashScreen.routeName: (context) => const SplashScreen(),
            WelcomePage.routeName: (context) => const WelcomePage(),
            RegisterPage.routeName: (context) => const RegisterPage(),
            LoginPage.routeName: ((context) => const LoginPage()),
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
