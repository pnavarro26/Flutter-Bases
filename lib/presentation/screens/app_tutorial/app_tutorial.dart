import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String url;

  SlideInfo({required this.title, required this.caption, required this.url});
}

final slides = <SlideInfo>[
  SlideInfo(
    title: 'Busca la comida',
    caption: 'caption',
    url: 'assets/images/1.png',
  ),
  SlideInfo(
    title: 'Entrega rapida',
    caption: 'caption',
    url: 'assets/images/2.png',
  ),
  SlideInfo(
    title: 'Disfruta la comida',
    caption: 'caption',
    url: 'assets/images/3.png',
  ),
];

class AppTutorial extends StatefulWidget {
  static const name = 'tutorial_screen';

  const AppTutorial({super.key});

  @override
  State<AppTutorial> createState() => _AppTutorialState();
}

class _AppTutorialState extends State<AppTutorial> {
  final PageController pageviewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();

    pageviewController.addListener(() {
      final page = pageviewController.page ?? 0;

      print('${pageviewController.page}');

      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageviewController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map<Widget>(
                  (slideData) => _Slide(
                    title: slideData.title,
                    caption: slideData.caption,
                    imageUrl: slideData.url,
                  ),
                )
                .toList(),
          ),

          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              onPressed: () {
                context.pop();
              },
              child: Text('Salir'),
            ),
          ),

          endReached
              ? Positioned(
                  bottom: 30,
                  right: 30,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(seconds: 1),
                    child: FilledButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: Text('Comenzar'),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // alinea verticalmente
          crossAxisAlignment:
              CrossAxisAlignment.start, // alinea horizontalmnente
          children: [
            Image(image: AssetImage(imageUrl)),

            const SizedBox(height: 20),

            Text(title, style: titleStyle),

            const SizedBox(height: 20),

            Text(caption, style: captionStyle),
          ],
        ),
      ),
    );
  }
}
