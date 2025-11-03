import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const name = 'infinite_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imagesIds = [1, 2, 3, 4, 5];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      //scrollController.position.pixels => posicion en la que nos encontramos
      //scrollController.position.maxScrollExtent => posicion maxima a la que me puedo extender

      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        // Cargar la siguiente pagina

        loadNextPage();
      }
    });
  }

  Future loadNextPage() async {
    if (isLoading) return;

    isLoading = true;

    setState(() {});

    await Future.delayed(const Duration(seconds: 2));

    addFiveImages();
    isLoading = false;

    if (!isMounted) return; // verifixca que el componente esta montado
    setState(() {});
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = true;
    super.dispose();
  }

  void addFiveImages() {
    final lastId = imagesIds.last;

    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      //appBar: AppBar(title: Text('Infinite Scroll')),
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: ListView.builder(
          controller: scrollController,
          itemCount: imagesIds.length,
          itemBuilder: (context, index) {
            return FadeInImage(
              fit: BoxFit.cover,
              width: double.infinity,
              height: 300,
              placeholder: const AssetImage('assets/images/jar-loading.gif'),
              image: NetworkImage(
                'https://picsum.photos/id/${imagesIds[index]}/500/300',
              ),
            );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pop();
        },
        child: isLoading
            ? SpinPerfect(infinite: true, child: Icon(Icons.refresh_rounded))
            : FadeIn(child: Icon(Icons.arrow_back_ios_new_outlined)), //
      ),
    );
  }
}
