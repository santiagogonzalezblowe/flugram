import 'package:flugram/app/services/jelly_bean/models/jelly_bean_model.dart';
import 'package:flugram/features/jelly_bean/ui/page/jelly_bean_page.dart';
import 'package:flutter/material.dart';

class JellyBeanCard extends StatelessWidget {
  const JellyBeanCard(this.item, {super.key});

  final JellyBeanModel item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => JellyBeanPage.go(context, item.beanId),
        child: Column(
          children: [
            Hero(
              tag: item.beanId,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Image.network(
                  item.imageUrl,
                  width: double.infinity,
                  height: 200,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ListTile(
              title: Text(
                item.flavorName,
                style: Theme.of(context).textTheme.headlineSmall,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                item.description,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
