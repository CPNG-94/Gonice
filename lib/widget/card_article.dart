import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:gonice/data/model/article.dart';
import 'package:gonice/page/news/article_detail_page.dart';

class CardArticle extends StatelessWidget {
  final Article article;

  const CardArticle({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: const RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: () => Navigator.pushNamed(context, ArticleDetailPage.routeName,
              arguments: article),
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: Offset(-15, -15),
                  blurRadius: 22,
                  color: Colors.transparent,
                )
              ],
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(0)),
            ),
            margin: const EdgeInsets.all(4.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Hero(
                      tag: article.urlToImage!,
                      child: Image.network(
                        article.urlToImage!,
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                ),
                Flexible(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            article.title!,
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                CupertinoIcons.person_alt,
                                size: 20,
                              ),
                              Expanded(
                                  child: Text(
                                article.author!,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                maxLines: 1,
                                softWrap: false,
                              ))
                            ],
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
