import 'package:flugram/app/services/space/models/space_article_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SpaceArticleLoaded extends StatelessWidget {
  const SpaceArticleLoaded(
    this.article, {
    super.key,
  });

  final SpaceArticleModel article;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Hero(
          tag: article.id,
          child: Image.network(
            article.imageUrl,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                article.title,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 10),
              Text(
                article.summary,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 10),
              Text(
                'Published: ${article.publishedAt.toLocal()}',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: TextButton.icon(
                  onPressed: () => launchUrl(Uri.parse(article.url)),
                  label: const Text('Read more'),
                  icon: const Icon(Icons.auto_stories),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
