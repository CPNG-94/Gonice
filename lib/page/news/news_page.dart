import 'dart:convert';

import 'package:gonice/data/model/article.dart';
import 'package:gonice/provider/news_provider.dart';
import 'package:gonice/widget/card_article.dart';
import 'package:gonice/widget/platfrom_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class NewsPage extends StatefulWidget {
  NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  static const String _baseUrl = 'https://newsapi.org/v2/';
  static const String _apiKey = '6ace2996147146779027ae5a0c837f3c';
  static const String _category = 'health';
  static const String _country = 'id';

  @override
  void initState() {
    topHeadlines();
    super.initState();
  }

  Widget _buildList() {
    return Consumer<NewsProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.Loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.state == ResultState.HasData) {
          return RefreshIndicator(
              key: _refreshIndicatorKey,
              onRefresh: topHeadlines,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: state.result.articles.length,
                itemBuilder: (context, index) {
                  var article = state.result.articles[index];
                  return CardArticle(article: article);
                },
              ));
        } else if (state.state == ResultState.NoData) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.state == ResultState.Error) {
          return Column(
            children: <Widget>[
              const Center(
                child: const Text("Tidak Ada Internet Periksa Jaringan Anda"),
              ),
              IconButton(
                  icon: const Icon(Icons.refresh),
                  tooltip: 'Refresh',
                  onPressed: topHeadlines)
            ],
          );
        } else {
          return const Center(child: Text(''));
        }
      },
    );
  }

  Future<ArticlesResult> topHeadlines() async {
    final response = await http.get(Uri.parse(_baseUrl +
        "top-headlines?country=$_country&category=$_category&apiKey=$_apiKey"));
    setState(() {});
    if (response.statusCode == 200) {
      return ArticlesResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          'News',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: _buildList(),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('News App'),
        transitionBetweenRoutes: false,
      ),
      child: _buildList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}
