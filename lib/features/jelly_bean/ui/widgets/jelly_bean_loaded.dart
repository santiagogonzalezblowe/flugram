import 'package:flugram/app/services/jelly_bean/models/jelly_bean_model.dart';
import 'package:flugram/features/jelly_bean/ui/widgets/jelly_bean_more_info.dart';
import 'package:flutter/material.dart';

class JellyBeanLoaded extends StatelessWidget {
  const JellyBeanLoaded(
    this.bean, {
    super.key,
  });

  final JellyBeanModel bean;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(bottom: 20),
      children: [
        Hero(
          tag: bean.beanId,
          child: Image.network(
            bean.imageUrl,
            width: double.infinity,
            height: 200,
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                bean.flavorName,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 10),
              Text(
                bean.description,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
              JellyBeanMoreInfo(bean),
            ],
          ),
        ),
      ],
    );
  }
}
