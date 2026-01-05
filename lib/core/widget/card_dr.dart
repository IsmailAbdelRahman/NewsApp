// import 'package:flutter/material.dart';
// import 'package:newsappnew/core/utils/app_constant.dart';
// import 'package:newsappnew/core/widget/component.dart';
// import 'package:newsappnew/core/widget/custom_teg.dart';
// import 'package:newsappnew/feature/allm/models/article_model.dart';

// class CardDer extends StatelessWidget {
//   const CardDer({super.key, required this.stateArticle});

//   final List<ArticleModel> stateArticle;
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedSwitcher(
//         duration: const Duration(milliseconds: 350),
//         child: ImageContainer(
//           height: MediaQuery.of(context).size.height * 0.40,
//           width: double.infinity,
//           padding: const EdgeInsets.all(20.0),
//           imageUrl:
//               stateArticle[1].urlToImage ?? AppConstant.nullImageUrlChange,
//           gradientBlur: true,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               CustomTag(
//                 backgroundColor: Colors.grey.withAlpha(150),
//                 children: [
//                   Text(
//                     'News of the Day',
//                     style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                           color: Colors.white,
//                         ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 10),
//               Text(
//                 stateArticle[1].title ?? 'Title',
//                 style: Theme.of(context).textTheme.headlineSmall!.copyWith(
//                     fontWeight: FontWeight.bold,
//                     height: 1.25,
//                     color: Colors.white),
//               ),
//               TextButton(
//                 onPressed: () {},
//                 style: TextButton.styleFrom(padding: EdgeInsets.zero),
//                 child: Row(
//                   children: [
//                     Text(
//                       'Learn More',
//                       style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//                             color: Colors.white,
//                           ),
//                     ),
//                     const SizedBox(width: 10),
//                     const Icon(
//                       Icons.arrow_right_alt,
//                       color: Colors.white,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }
// }
import 'package:flutter/material.dart';
import 'package:newsappnew/core/utils/app_constant.dart';
import 'package:newsappnew/core/widget/component.dart';
import 'package:newsappnew/core/widget/custom_teg.dart';
import 'package:newsappnew/feature/allm/models/article_model.dart';

// class CardDer extends StatelessWidget {
//   const CardDer({super.key, required this.stateArticle});

//   final List<ArticleModel> stateArticle;
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedSwitcher(
//       duration: const Duration(milliseconds: 300),
//       transitionBuilder: (child, animation) {
//         // دمج Fade + Scale مع بعض
//         return FadeTransition(
//           opacity: animation,
//           child: ScaleTransition(scale: animation, child: child),
//         );
//       },
//       child: ImageContainer(
//         // Key فريد في كل مرة
//         // key: UniqueKey(),
//         height: MediaQuery.of(context).size.height * 0.40,
//         width: double.infinity,
//         padding: const EdgeInsets.all(20.0),
//         // imageUrl: stateArticle[1].urlToImage ?? AppConstant.nullImageUrlChange,
//         key: ValueKey(stateArticle[3].urlToImage),
//         imageUrl: stateArticle[3].urlToImage ?? AppConstant.nullImageUrlChange,

//         gradientBlur: true,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CustomTag(
//               backgroundColor: Colors.grey.withAlpha(150),
//               children: [
//                 Text(
//                   'News of the Day',
//                   style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                         color: Colors.white,
//                       ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 10),
//             Text(
//               stateArticle[1].title ?? 'Title',
//               style: Theme.of(context).textTheme.headlineSmall!.copyWith(
//                     fontWeight: FontWeight.bold,
//                     height: 1.25,
//                     color: Colors.white,
//                   ),
//             ),
//             TextButton(
//               onPressed: () {},
//               style: TextButton.styleFrom(padding: EdgeInsets.zero),
//               child: Row(
//                 children: [
//                   Text(
//                     'Learn More',
//                     style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//                           color: Colors.white,
//                         ),
//                   ),
//                   const SizedBox(width: 10),
//                   const Icon(
//                     Icons.arrow_right_alt,
//                     color: Colors.white,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class CardDer extends StatefulWidget {
  const CardDer({super.key, required this.stateArticle});

  final List<ArticleModel> stateArticle;

  @override
  State<CardDer> createState() => _CardDerState();
}

class _CardDerState extends State<CardDer> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    // تغيير الصورة تلقائيًا كل 3 ثواني
    Future.delayed(const Duration(seconds: 10), _nextImage);
  }

  void _nextImage() {
    if (!mounted) return;
    setState(() {
      currentIndex = (currentIndex + 1) % widget.stateArticle.length;
    });
    Future.delayed(const Duration(seconds: 3), _nextImage);
  }

  @override
  Widget build(BuildContext context) {
    final article = widget.stateArticle[currentIndex];

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(scale: animation, child: child),
        );
      },
      child: ImageContainer(
        key: ValueKey(article.urlToImage), // Key مختلف لكل صورة
        height: MediaQuery.of(context).size.height * 0.40,
        width: double.infinity,
        padding: const EdgeInsets.all(20.0),
        imageUrl: article.urlToImage ?? AppConstant.nullImageUrlChange,
        gradientBlur: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTag(
              backgroundColor: Colors.grey.withAlpha(150),
              children: [
                Text(
                  'News of the Day',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              article.title ?? 'Title',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.bold,
                height: 1.25,
                color: Colors.white,
              ),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              child: Row(
                children: [
                  Text(
                    'Learn More',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge!.copyWith(color: Colors.white),
                  ),
                  const SizedBox(width: 10),
                  const Icon(Icons.arrow_right_alt, color: Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
