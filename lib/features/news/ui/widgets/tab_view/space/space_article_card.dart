import 'package:flugram/app/services/space/models/space_article_model.dart';
import 'package:flugram/features/space_article/ui/page/space_article_page.dart';
import 'package:flutter/material.dart';

class SpaceArticleCard extends StatelessWidget {
  const SpaceArticleCard(this.item, {super.key});

  final SpaceArticleModel item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => SpaceArticlePage.go(context, item.id),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: item.id,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Image.network(
                  item.imageUrl,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ListTile(
              title: Text(
                item.title,
                style: Theme.of(context).textTheme.headlineSmall,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                item.summary,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Published: ${item.publishedAt.toLocal()}',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
