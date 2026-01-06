library;

import 'package:flutter/material.dart';
import 'package:newsappnew/feature/allm/models/article_model.dart';

class CarouselExample extends StatefulWidget {
  final List<ArticleModel> stateArticle;

  const CarouselExample({super.key, required this.stateArticle});

  @override
  State<CarouselExample> createState() => _CarouselExampleState();
}

class _CarouselExampleState extends State<CarouselExample> {
  final CarouselController controller = CarouselController(initialItem: 1);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;

    if (widget.stateArticle.isEmpty) {
      return const SizedBox(
        height: 200,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: height / 1),
      child: CarouselView.weighted(
        controller: controller,
        itemSnapping: true,
        flexWeights: const <int>[1, 10, 1],
        children: List.generate(widget.stateArticle.length, (i) {
          final article = widget.stateArticle[i];

          return HeroLayoutCard(
            title: article.title ?? 'No title',
            subtitle: article.title ?? '',
            imageUrl: article.urlToImage?.isNotEmpty == true
                ? article.urlToImage!
                : 'https://via.placeholder.com/800x450',
          );
        }),
      ),
    );
  }
}

/// ------------------------------------------------------------
/// CARD
/// ------------------------------------------------------------
class HeroLayoutCard extends StatelessWidget {
  const HeroLayoutCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });

  final String imageUrl;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;

    return Column(
      children: <Widget>[
        Expanded(
          flex: 4,
          child: ClipRect(
            child: OverflowBox(
              maxWidth: width * 7 / 8,
              minWidth: width * 7 / 8,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) {
                  return const Center(
                    child: Icon(
                      Icons.broken_image,
                      size: 50,
                      color: Colors.white,
                    ),
                  );
                },
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black54],
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  fit: FlexFit.loose,
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(
                      context,
                    ).textTheme.headlineSmall?.copyWith(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 1),
                Flexible(
                  fit: FlexFit.loose,
                  child: Text(
                    subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(color: Colors.white70),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
