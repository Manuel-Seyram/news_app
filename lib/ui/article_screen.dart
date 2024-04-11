import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/ui/homepage/widgets/image_container.dart';

import '../models/articles_model.dart';
import 'homepage/widgets/custom_tag.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key, required this.article});
  final Article article;
  @override
  Widget build(BuildContext context) {
    return ImageContainer(
      width: double.infinity,
      imageUrl: article.imageUrl,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: ListView(children: [
          _NewsHeadline(
            article: article,
          ),
          _NewsBody(article: article)
        ]),
      ),
    );
  }
}

class _NewsBody extends StatelessWidget {
  const _NewsBody({
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        children: [
          Row(
            children: [
              CustomTag(
                backgroundColor: Colors.amber,
                children: [
                  CircleAvatar(
                    radius: 10,
                    backgroundImage: NetworkImage(article.authorImageUrl),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    article.author,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.black,
                        ),
                  ),
                ],
              ),
              SizedBox(
                width: 10.w,
              ),
              CustomTag(
                backgroundColor: Colors.amber,
                children: [
                  const Icon(
                    Icons.timer,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                      '${DateTime.now().difference(article.createdAt).inHours} h',
                      style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
              SizedBox(
                width: 10.w,
              ),
              CustomTag(
                backgroundColor: Colors.amber,
                children: [
                  const Icon(
                    Icons.remove_red_eye,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text('${article.views}',
                      style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(article.title,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold)),
          SizedBox(
            height: 20.h,
          ),
          Text(article.body,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(height: 1.5.h)),
          SizedBox(
            height: 20.h,
          ),
          GridView.builder(
            shrinkWrap: true,
            itemCount: 2,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.25,
            ),
            itemBuilder: (context, index) {
              return ImageContainer(
                width: MediaQuery.of(context).size.width * 0.42,
                imageUrl: article.imageUrl,
                margin: const EdgeInsets.only(right: 5.0, bottom: 5.0),
              );
            },
          )
        ],
      ),
    );
  }
}

class _NewsHeadline extends StatelessWidget {
  const _NewsHeadline({required this.article});
  final Article article;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          CustomTag(
            backgroundColor: Colors.amber,
            children: [
              Text(
                article.category,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.black,
                    ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            article.title,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  height: 1.25.h,
                  color: Colors.white,
                ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            article.subtitle,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                ),
          ),
        ],
      ),
    );
  }
}
