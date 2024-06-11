import 'package:flugram/features/home/models/repository_model.dart';
import 'package:flugram/features/update_repository/ui/page/update_repository_page.dart';
import 'package:flutter/material.dart';

class RepositoryCard extends StatelessWidget {
  const RepositoryCard({
    super.key,
    required this.repository,
    required this.flugramId,
  });

  final String flugramId;
  final RepositoryModel repository;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 300,
      ),
      child: Card(
        margin: const EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                repository.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                repository.description,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () => UpdateRepositoryPage.go(
                  context,
                  flugramId,
                  repository.id,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
